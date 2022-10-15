unit Main.Form;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Threading,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  Skia,
  Skia.FMX,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Controls.Presentation,
  FMX.Edit,
  //
  PokemonList.Frame,
  Pokemon.Entity,
  PokeWrapper.Types,
  PokeFactory,
  //
  DataFinder.DB,
  //
  Json.Icons,
  FMX.ComboEdit;

type
  TMainForm = class(TForm)
    gridMain: TGridPanelLayout;
    svgLogo: TSkSvg;
    StyleBook1: TStyleBook;
    SkSvg1: TSkSvg;
    svgBackgroundList: TSkSvg;
    SkSvg2: TSkSvg;
    svgList: TSkSvg;
    framePokemonList: TVertScrollBox;
    SkSvg4: TSkSvg;
    edtPokemonSearch: TEdit;
    svgSearch: TSkSvg;
    procedure FormResize(Sender: TObject);
    procedure svgSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSkAnimatedImage: TSkAnimatedImage;
    function FindPokemon(AValue: string): TPokemonEntity;
    procedure BeginLoadingAnimation;
    procedure FinishLoadingAnimation;
    procedure SearchPokemon(APokemon: string = '');
    procedure SearchPokemonList(AInitialRange: Integer = 1; AFinalRange: Integer = 10);
    procedure ClearList(AVertScrollBox: TVertScrollBox);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.BeginLoadingAnimation;
var
  LStringStream: TStringStream;
begin
  LStringStream := nil;
  try
    LStringStream    := TStringStream.Create(ANIMATION_LOADING);
    FSkAnimatedImage := TSkAnimatedImage.Create(framePokemonList);
    FSkAnimatedImage.BringToFront;
    FSkAnimatedImage.Align  := TAlignLayout.Center;
    FSkAnimatedImage.Width  := 200;
    FSkAnimatedImage.Height := 200;
    FSkAnimatedImage.LoadFromStream(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

procedure TMainForm.ClearList(AVertScrollBox: TVertScrollBox);
begin
  AVertScrollBox.BeginUpdate;
  for var I := AVertScrollBox.Content.ChildrenCount - 1 downto 0 do
    AVertScrollBox.Content.Children[I].Free;
  AVertScrollBox.EndUpdate;
end;

function TMainForm.FindPokemon(AValue: string): TPokemonEntity;
var
  LDataFinder   : TDataFinder;
  LGenericEntity: TGenericEntity;
  LJSON         : string;
begin
  LDataFinder := nil;
  try
    Result      := TPokemonEntity.Create;
    LDataFinder := TDataFinder.Create(nil);
    LJSON       := LDataFinder.Find(AValue, 'pokemon');
    if LJSON.Equals(EmptyStr) then
    begin
      LGenericEntity := nil;
      try
        LGenericEntity := TGenericEntity.Create;
        TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(Result, AValue);
        LJSON                    := TPokeFactory.New(TPokemon.Pokemon).Get(AValue);
        LGenericEntity.Id        := Result.Id;
        LGenericEntity.Name      := Result.Name;
        LGenericEntity.Json      := LJSON;
        LGenericEntity.TableName := 'pokemon';
        LDataFinder.Save(LGenericEntity);
      finally
        LGenericEntity.Free;
      end;
    end
    else
    begin
      TPokeFactory.New(TPokemon.Pokemon).JsonToObject(LJSON, Result);
    end;
  finally
    LDataFinder.Free;
  end;
end;

procedure TMainForm.FinishLoadingAnimation;
begin
  FSkAnimatedImage.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SearchPokemon;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if Self.Width > 700 then
  begin
    gridMain.Align := TAlignLayout.Center;
    gridMain.Width := 700;
  end
  else
    gridMain.Align := TAlignLayout.Client;
end;

procedure TMainForm.SearchPokemon(APokemon: string = '');
var
  LTask            : ITask;
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity   : TPokemonEntity;
begin
  if not framePokemonList.IsUpdating then
  begin
    BeginLoadingAnimation;
    LTask := TTask.Run(
      procedure
      begin
        if APokemon.Equals(EmptyStr) then
          SearchPokemonList(1, 20)
        else
          try
            LPokemonEntity := nil;
            try
              framePokemonList.BeginUpdate;
              LPokemonEntity := FindPokemon(LowerCase(APokemon).Trim);
              ClearList(framePokemonList);
              LPokemonListFrame := TPokemonListFrame.Create(LPokemonEntity, nil);
              LPokemonListFrame.Width := framePokemonList.Width;
              framePokemonList.AddObject(LPokemonListFrame);
              framePokemonList.EndUpdate;
            finally
              LPokemonEntity.Free;
            end;
          except
            on E: Exception do
              framePokemonList.EndUpdate;
          end;
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            framePokemonList.RecalcSize;
          end);
      end);
    FinishLoadingAnimation;
  end;
end;

procedure TMainForm.SearchPokemonList(AInitialRange: Integer = 1; AFinalRange: Integer = 10);
var
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity   : TPokemonEntity;
begin
  ClearList(framePokemonList);
  try
    framePokemonList.BeginUpdate;
    for var I := AInitialRange to AFinalRange do
    begin
      try
        LPokemonEntity := nil;
        try
          LPokemonEntity          := FindPokemon(I.ToString);
          LPokemonListFrame       := TPokemonListFrame.Create(LPokemonEntity, nil);
          LPokemonListFrame.Width := framePokemonList.Width;
          framePokemonList.AddObject(LPokemonListFrame);
        finally
          LPokemonEntity.Free;
        end;
      except
        on E: Exception do
          framePokemonList.EndUpdate;
      end;
    end;
  finally
    framePokemonList.EndUpdate;
  end;
end;

procedure TMainForm.svgSearchClick(Sender: TObject);
begin
  SearchPokemon(edtPokemonSearch.Text);
end;

end.
