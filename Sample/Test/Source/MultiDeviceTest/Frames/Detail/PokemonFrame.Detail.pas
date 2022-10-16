unit PokemonFrame.Detail;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Skia, Skia.FMX, FMX.Layouts;

type
  TPokemonFrameDetail = class(TFrame)
    SkSvg1: TSkSvg;
    GridPanelLayout1: TGridPanelLayout;
    aniPokemon: TSkAnimatedImage;
    lblName: TSkLabel;
    svgHealthBackground: TSkSvg;
    SkSvg3: TSkSvg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
