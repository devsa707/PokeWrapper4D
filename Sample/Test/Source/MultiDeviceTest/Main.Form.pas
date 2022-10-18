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
  PokemonFinder,
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
    svgLogoBackground: TSkSvg;
    edtPokemonSearch: TEdit;
    svgSearch: TSkSvg;
    gridDetail: TGridLayout;
    SkAnimatedImage1: TSkAnimatedImage;
    procedure FormResize(Sender: TObject);
    procedure svgSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPokemonSearchKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    FSkAnimatedImage: TSkAnimatedImage;
    procedure BeginLoadingAnimation;
    procedure FinishLoadingAnimation;
    procedure Search(APokemon: string = '');
    procedure SearchPokemon(APokemon: string = '');
    procedure SearchPokemonList(AInitialRange: Integer = 1; AFinalRange: Integer = 10);
    procedure ClearList(AVertScrollBox: TVertScrollBox);
  public
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
    LStringStream           := TStringStream.Create(ANIMATION_LOADING);
    FSkAnimatedImage        := TSkAnimatedImage.Create(Self);
    FSkAnimatedImage.Parent := Self;
    FSkAnimatedImage.Align  := TAlignLayout.Center;
    FSkAnimatedImage.Width  := 200;
    FSkAnimatedImage.Height := 200;
    FSkAnimatedImage.LoadFromStream(LStringStream);
    FSkAnimatedImage.Redraw;
  finally
    LStringStream.Free;
  end;
end;

procedure TMainForm.ClearList(AVertScrollBox: TVertScrollBox);
begin
  AVertScrollBox.BeginUpdate;
  for var I := AVertScrollBox.Content.ChildrenCount - 1 downto 0 do
    AVertScrollBox.Content.Children[I].DisposeOf;
  AVertScrollBox.EndUpdate;
end;

procedure TMainForm.edtPokemonSearchKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
    Search(edtPokemonSearch.Text);
end;

procedure TMainForm.FinishLoadingAnimation;
begin
  FSkAnimatedImage.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Search;
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

procedure TMainForm.Search(APokemon: string = '');
var
  LTask: ITask;
begin
  if not framePokemonList.IsUpdating then
  begin
    ClearList(framePokemonList);
    LTask := TTask.Run(
      procedure
      begin
        framePokemonList.Visible := False;
        BeginLoadingAnimation;
        if APokemon.Equals(EmptyStr) then
          SearchPokemonList(1, 20)
        else
          SearchPokemon(APokemon);
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            framePokemonList.Visible := True;
            framePokemonList.RecalcSize;
            FinishLoadingAnimation;
          end);
      end);
  end;
end;

procedure TMainForm.SearchPokemon(APokemon: string);
var
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity   : TPokemonEntity;
begin
  LPokemonEntity := nil;
  try
    try
      framePokemonList.BeginUpdate;
      LPokemonEntity          := TPokemonFinder.New.FindPokemon(LowerCase(APokemon).Trim);
      LPokemonListFrame       := TPokemonListFrame.Create(LPokemonEntity, nil);
      LPokemonListFrame.Width := framePokemonList.Width;
      framePokemonList.AddObject(LPokemonListFrame);
    except
      on E: Exception do
        framePokemonList.EndUpdate;
    end;
  finally
    framePokemonList.EndUpdate;
    LPokemonEntity.Free;
  end;
end;

procedure TMainForm.SearchPokemonList(AInitialRange: Integer = 1; AFinalRange: Integer = 10);
var
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity   : TPokemonEntity;
begin
  try
    framePokemonList.BeginUpdate;
    for var I := AInitialRange to AFinalRange do
    begin
      LPokemonEntity := nil;
      try
        try
          LPokemonEntity          := TPokemonFinder.New.FindPokemon(I.ToString);
          LPokemonListFrame       := TPokemonListFrame.Create(LPokemonEntity, nil);
          LPokemonListFrame.Width := framePokemonList.Width;
          framePokemonList.AddObject(LPokemonListFrame);
        except
          on E: Exception do
          begin
            framePokemonList.EndUpdate;
          end;
        end;
      finally
        LPokemonEntity.Free;
      end;
    end;
  finally
    framePokemonList.EndUpdate;
  end;
end;

procedure TMainForm.svgSearchClick(Sender: TObject);
begin
  Search(edtPokemonSearch.Text);
end;

end.
