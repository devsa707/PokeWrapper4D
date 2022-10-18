unit PokemonList.Frame;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IOUtils,
  System.StrUtils,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  Skia,
  FMX.Objects,
  FMX.Layouts,
  Skia.FMX,
  //
  StringCapitalHelper,
  SVG.TypeIcons,
  PokemonList.Detail,
  Pokemon.Entity,
  PokemonFinder,
  //
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Intf;

type
  TPokemonListFrame = class(TFrame)
    svgBackground: TSkSvg;
    GridMain: TGridPanelLayout;
    svgPokeballBackGround: TSkSvg;
    aniPokemon: TSkAnimatedImage;
    GridPanelLayout1: TGridPanelLayout;
    lblName: TSkLabel;
    svgTypeBackground: TSkSvg;
    svgType2: TSkSvg;
    lblType2: TSkLabel;
    svgTypeIcon2: TSkSvg;
    lblnumber: TSkLabel;
    svgType1: TSkSvg;
    lblType1: TSkLabel;
    svgTypeIcon1: TSkSvg;
    procedure FrameClick(Sender: TObject);
    procedure FrameTap(Sender: TObject; const Point: TPointF);
  private
    FId: integer;
    procedure ShowPokemonDetails;
    procedure DownloadImage(AURL: string);
  public
    constructor Create(APokemonEntity: TPokemonEntity; AOwner: TComponent); reintroduce;
  end;

implementation

{$R *.fmx}

{ TPokemonListFrame }
uses
  Main.Form;

constructor TPokemonListFrame.Create(APokemonEntity: TPokemonEntity; AOwner: TComponent);
var
  LTypeIcon: ITypeIcon;
begin
  inherited Create(AOwner);
  svgType1.Visible := False;
  svgType2.Visible := False;
  lblName.Text     := FirstLetterUpperCase(APokemonEntity.name);
  FId              := APokemonEntity.id;
  lblnumber.Text   := Format('#%d', [FId]);
  LTypeIcon        := TTypeIcon.New;
  if APokemonEntity.sprites.versions.generation_v.black_white.animated.front_default.Equals(EmptyStr) then
    DownloadImage(APokemonEntity.sprites.other.official_artwork.front_default)
  else
    DownloadImage(APokemonEntity.sprites.versions.generation_v.black_white.animated.front_default);
  for var I := 0 to APokemonEntity.Types.Count - 1 do
  begin
    case I of
      0:
        begin
          svgBackground.SVG.OverrideColor  := TTypeIcon.New.GetBackGroundColor(APokemonEntity.Types.Items[I].type_.name);
          lblType1.Text                    := FirstLetterUpperCase(APokemonEntity.Types.Items[I].type_.name);
          svgType1.SVG.OverrideColor       := LTypeIcon.GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          lblnumber.TextSettings.FontColor := svgType1.SVG.OverrideColor;
          svgTypeIcon1.SVG.Source          := LTypeIcon.GetTypeIcon(APokemonEntity.Types.Items[I].type_.name);
          svgType1.Visible                 := True;
        end;
      1:
        begin
          lblType2.Text              := FirstLetterUpperCase(APokemonEntity.Types.Items[I].type_.name);
          svgType2.SVG.OverrideColor := LTypeIcon.GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgTypeIcon2.SVG.Source    := LTypeIcon.GetTypeIcon(APokemonEntity.Types.Items[I].type_.name);
          svgType2.Visible           := True;
        end;
    end;
  end;
{$IFDEF MSWINDOWS}
  self.OnClick := FrameClick;
{$ELSE}
  self.OnTap := FrameTap;
{$ENDIF}
end;

procedure TPokemonListFrame.DownloadImage(AURL: string);
var
  LPath           : string;
  FMVCRESTResponse: IMVCRESTResponse;
begin
  LPath := System.IOUtils.TPath.GetDocumentsPath + PathDelim + 'images';
  if not DirectoryExists(LPath) then
    ForceDirectories(LPath);
  LPath := LPath + PathDelim + System.IOUtils.TPath.GetFileName(AURL);
  if FileExists(LPath) then
    aniPokemon.LoadFromFile(LPath)
  else
  begin
    FMVCRESTResponse := TMVCRESTClient.Create.Get(AURL);
    if FMVCRESTResponse.Success then
    begin
      FMVCRESTResponse.SaveContentToFile(LPath);
      aniPokemon.LoadFromFile(LPath)
    end;
  end;
end;

procedure TPokemonListFrame.FrameClick(Sender: TObject);
begin
  ShowPokemonDetails;
end;

procedure TPokemonListFrame.FrameTap(Sender: TObject; const Point: TPointF);
begin
  ShowPokemonDetails;
end;

procedure TPokemonListFrame.ShowPokemonDetails;
var
  LPokemonEntity    : TPokemonEntity;
  LPokemonListDetail: TPokemonListDetail;
begin
  LPokemonEntity := nil;
  try
    LPokemonEntity     := TPokemonFinder.New.FindPokemon(FId.ToString);
    LPokemonListDetail := TPokemonListDetail.Create(LPokemonEntity, nil);
    LPokemonListDetail.Show;
  finally
    LPokemonEntity.Free;
  end;
end;

end.
