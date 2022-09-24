unit Main.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, Skia.FMX,
  FMX.Layouts, FMX.ListBox, PokemonList.Frame, Pokemon.Entity, PokeWrapper.Types, PokeFactory;

type
  TForm1 = class(TForm)
    gridMain: TGridPanelLayout;
    svgLogo: TSkSvg;
    StyleBook1: TStyleBook;
    SkSvg1: TSkSvg;
    svgBackgroundList: TSkSvg;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    framePokemonList: TVertScrollBox;
    SkSvg4: TSkSvg;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
var
  LPokemonListFrame: TPokemonListFrame;
  LPokemonEntity: TPokemonEntity;
begin
  for var I := 1 to 25 do
  begin
    LPokemonEntity := TPokemonEntity.Create;
    TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity, I);
    LPokemonListFrame := TPokemonListFrame.Create(LPokemonEntity, nil);
    LPokemonListFrame.Width := framePokemonList.Width;
    framePokemonList.AddObject(LPokemonListFrame);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if Self.Width > 700 then
  begin
    gridMain.Align := TAlignLayout.Center;
    gridMain.Width := 700;
  end
  else
    gridMain.Align := TAlignLayout.Client;
end;

end.
