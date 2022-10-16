unit PokemonList.Detail;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IOUtils,
  System.UIConsts,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  Skia,
  Skia.FMX,
  FMX.Layouts,
  //
  StringCapitalHelper,
  SVG.TypeIcons,
  Pokemon.Entity,
  //
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Intf;

type
  TPokemonListDetail = class(TForm)
    svgBackground: TSkSvg;
    gridMain: TGridPanelLayout;
    aniPokemon: TSkAnimatedImage;
    svgGraphStats: TSkSvg;
    lblName: TSkLabel;
    GridPanelLayout2: TGridPanelLayout;
    svgType1: TSkSvg;
    lblType1: TSkLabel;
    svgTypeIcon1: TSkSvg;
    svgType2: TSkSvg;
    lblType2: TSkLabel;
    svgTypeIcon2: TSkSvg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    procedure DownloadImage(AURL: string);
    procedure SetStats(AName: string; AValue: integer);
    procedure SetGraphValue;
    procedure SetGradientColor(APokemonType: string);
    procedure SetData(APokemonEntity: TPokemonEntity);
  public
    constructor Create(APokemonEntity: TPokemonEntity; AOwner: TComponent); reintroduce;
  end;

implementation

{$R *.fmx}
{ TPokemonListDetail }

constructor TPokemonListDetail.Create(APokemonEntity: TPokemonEntity; AOwner: TComponent);
begin
  inherited Create(AOwner);
  svgType1.Visible := False;
  svgType2.Visible := False;
  DownloadImage(APokemonEntity.sprites.other.official_artwork.front_default);
  SetData(APokemonEntity);
  SetGradientColor(APokemonEntity.Types.First.type_.name);
  SetGraphValue;
end;

procedure TPokemonListDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TPokemonListDetail.FormResize(Sender: TObject);
begin
  if Self.Width > 700 then
  begin
    gridMain.Align := TAlignLayout.Center;
    gridMain.Width := 700;
  end
  else
  begin
    gridMain.Align := TAlignLayout.Client;
  end;
end;

procedure TPokemonListDetail.SetData(APokemonEntity: TPokemonEntity);
var
  LTypeIcon: ITypeIcon;
begin
  LTypeIcon                      := TTypeIcon.New;
  lblName.Text                   := FirstLetterUpperCase(APokemonEntity.name);
  lblName.TextSettings.FontColor := LTypeIcon.GetTypeColor(APokemonEntity.Types.First.type_.name);
  for var I                      := 0 to APokemonEntity.Types.Count - 1 do
  begin
    case I of
      0:
        begin
          lblType1.Text              := FirstLetterUpperCase(APokemonEntity.Types.Items[I].type_.name);
          svgType1.SVG.OverrideColor := LTypeIcon.GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgTypeIcon1.SVG.Source    := LTypeIcon.GetTypeIcon(APokemonEntity.Types.Items[I].type_.name);
          svgType1.Visible           := True;
        end;
      1:
        begin
          lblType2.Text              := FirstLetterUpperCase(APokemonEntity.Types.Items[I].type_.name);
          svgType2.SVG.OverrideColor := LTypeIcon.GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgTypeIcon2.SVG.Source    := LTypeIcon.GetTypeIcon(APokemonEntity.Types.Items[I].type_.name);
          svgType2.Visible           := True;
        end;
    end;
    for var LStats in APokemonEntity.stats do
    begin
      if LStats.stat.name.Equals('hp') then
      begin
        SetStats('HP', LStats.base_stat);
        SetStats('1', LStats.effort);
      end;
      if LStats.stat.name.Equals('special-attack') then
      begin
        SetStats('SPATK', LStats.base_stat);
        SetStats('2', LStats.effort);
      end;
      if LStats.stat.name.Equals('special-defense') then
      begin
        SetStats('SPDEF', LStats.base_stat);
        SetStats('3', LStats.effort);
      end;
      if LStats.stat.name.Equals('speed') then
      begin
        SetStats('SPEED', LStats.base_stat);
        SetStats('4', LStats.effort);
      end;
      if LStats.stat.name.Equals('defense') then
      begin
        SetStats('DEF', LStats.base_stat);
        SetStats('5', LStats.effort);
      end;
      if LStats.stat.name.Equals('attack') then
      begin
        SetStats('ATK', LStats.base_stat);
        SetStats('6', LStats.effort);
      end;
    end;
  end;
end;

procedure TPokemonListDetail.SetGradientColor(APokemonType: string);
var
  LSkSVGNode: ISkSVGNode;
begin
  LSkSVGNode := svgBackground.SVG.DOM.FindNodeById('primary_color');
  if Assigned(LSkSVGNode) then
    LSkSVGNode.TrySetAttribute('stop-color', TTypeIcon.New.GetGradientPrimaryColor(APokemonType));
  LSkSVGNode.TrySetAttribute('offset', '1');

  LSkSVGNode := svgBackground.SVG.DOM.FindNodeById('secondary_color');
  if Assigned(LSkSVGNode) then
    LSkSVGNode.TrySetAttribute('stop-color', TTypeIcon.New.GetGradientSecondaryColor(APokemonType));
  svgBackground.Redraw;
end;

procedure TPokemonListDetail.SetGraphValue;
var
  LSkSVGNode: ISkSVGNode;
begin
  // svgGraphStats.SVG.DOM.FindNodeById('graph');
end;

procedure TPokemonListDetail.SetStats(AName: string; AValue: integer);
begin
  svgGraphStats.SVG.Source := string(svgGraphStats.SVG.Source).Replace('%' + AName + '%', Format('%d', [AValue]));
end;

procedure TPokemonListDetail.DownloadImage(AURL: string);
var LPath: string; FMVCRESTResponse: IMVCRESTResponse;
begin
  LPath := System.IOUtils.TPath.GetDocumentsPath + PathDelim + 'images' + PathDelim + 'official_artwork';
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

end.
