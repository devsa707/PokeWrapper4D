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
  Json.Icons;

type
  TMainForm = class(TForm)
    gridMain: TGridPanelLayout;
    svgLogo: TSkSvg;
    StyleBook1: TStyleBook;
    SkSvg1: TSkSvg;
    svgBackgroundList: TSkSvg;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    framePokemonList: TVertScrollBox;
    SkSvg4: TSkSvg;
    edtPokemonSearch: TEdit;
    svgSearch: TSkSvg;
    procedure FormResize(Sender: TObject);
    procedure svgSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSkAnimatedImage: TSkAnimatedImage;
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
  BeginLoadingAnimation;
  LTask := TTask.Run(
    procedure
    begin
      if APokemon.Equals(EmptyStr) then
        SearchPokemonList(1,700)
      else
        try
          LPokemonEntity := nil;
          try
            framePokemonList.BeginUpdate;
            LPokemonEntity := TPokemonEntity.Create;
            TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity, LowerCase(APokemon).Trim);
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

procedure TMainForm.SearchPokemonList(AInitialRange: Integer = 1; AFinalRange: Integer = 10);
var
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity   : TPokemonEntity;
  LTask            : ITask;
begin
  ClearList(framePokemonList);
  try
    framePokemonList.BeginUpdate;
    for var I := AInitialRange to AFinalRange do
    begin
      try
        LPokemonEntity := nil;
        try
          LPokemonEntity := TPokemonEntity.Create;
          TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity, I);
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
