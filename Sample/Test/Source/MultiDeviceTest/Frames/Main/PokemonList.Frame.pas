unit PokemonList.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Skia, FMX.Objects, FMX.Layouts, Skia.FMX,
  //
  Pokemon.Entity,
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
    svgType1: TSkSvg;
    lblType1: TSkLabel;
    svgType3: TSkSvg;
    lblType3: TSkLabel;
    svgType2: TSkSvg;
    lblType2: TSkLabel;
    SkLabel1: TSkLabel;
    lblnumber: TSkLabel;
  private
    function GetTypeColor(AType: string): TAlphaColor;
    function GetBackGroundColor(AType: string): TAlphaColor;
    procedure DownloadImage(AURL: string);
  public
    constructor Create(APokemonEntity: TPokemonEntity; AOwner: TComponent); reintroduce;
  end;

implementation

{$R *.fmx}
{ TPokemonListFrame }

constructor TPokemonListFrame.Create(APokemonEntity: TPokemonEntity; AOwner: TComponent);
begin
  inherited Create(AOwner);
  svgType1.Visible := False;
  svgType2.Visible := False;
  svgType3.Visible := False;
  lblName.Text := APokemonEntity.name;
  lblName.Text := Format('#%d', [APokemonEntity.id]);
  DownloadImage(APokemonEntity.sprites.versions.generation_v.black_white.animated.front_default);
  for var I := 0 to APokemonEntity.Types.Count - 1 do
  begin
    case I of
      0:
        begin
          svgBackground.Svg.OverrideColor := GetBackGroundColor(APokemonEntity.Types.Items[I].type_.name);
          lblType1.Text := APokemonEntity.Types.Items[I].type_.name;
          svgType1.Svg.OverrideColor := GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgType1.Visible := True;
        end;
      1:
        begin
          lblType2.Text := APokemonEntity.Types.Items[I].type_.name;
          svgType2.Svg.OverrideColor := GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgType2.Visible := True;
        end;
      2:
        begin
          lblType3.Text := APokemonEntity.Types.Items[I].type_.name;
          svgType3.Svg.OverrideColor := GetTypeColor(APokemonEntity.Types.Items[I].type_.name);
          svgType3.Visible := True;
        end;
    end;
  end;

end;

procedure TPokemonListFrame.DownloadImage(AURL: string);
var
  LMemoryStream: TMemoryStream;
  FMVCRESTResponse: IMVCRESTResponse;
  FMVCRESTClient: IMVCRESTClient;
begin
  FMVCRESTClient := TMVCRESTClient.Create;
  LMemoryStream := TMemoryStream.Create();
  try
    FMVCRESTResponse := FMVCRESTClient.Get(AURL);
    if FMVCRESTResponse.Success then
    begin
      FMVCRESTResponse.SaveContentToStream(LMemoryStream);
      LMemoryStream.Position := 0;
      aniPokemon.LoadFromStream(LMemoryStream);
    end;
  finally
    LMemoryStream.Free;
  end;
end;

function TPokemonListFrame.GetBackGroundColor(AType: string): TAlphaColor;
begin
  if AType.Equals('normal') then
    Result := $C8A8A77A
  else //
    if AType.Equals('fire') then
      Result := $C8EE8130
    else //
      if AType.Equals('water') then
        Result := $C86390F0
      else //
        if AType.Equals('electric') then
          Result := $C8F7D02C
        else //
          if AType.Equals('grass') then
            Result := $C87AC74C
          else //
            if AType.Equals('ice') then
              Result := $C896D9D6
            else //
              if AType.Equals('fighting') then
                Result := $C8C22E28
              else //
                if AType.Equals('ground') then
                  Result := $C8E2BF65
                else //
                  if AType.Equals('flying') then
                    Result := $C8A98FF3
                  else //
                    if AType.Equals('psychic') then
                      Result := $C8F95587
                    else //
                      if AType.Equals('bug') then
                        Result := $C8A6B91A
                      else //
                        if AType.Equals('rock') then
                          Result := $C8B6A136
                        else //
                          if AType.Equals('ghost') then
                            Result := $C8735797
                          else //
                            if AType.Equals('dragon') then
                              Result := $C86F35FC
                            else //
                              if AType.Equals('dark') then
                                Result := $C8705746
                              else //
                                if AType.Equals('steel') then
                                  Result := $C8B7B7CE
                                else //
                                  if AType.Equals('fairy') then
                                    Result := $C8D685AD
                                  else if AType.Equals('poison') then
                                    Result := $C8A33EA1
                                  else
                                    Result := $C8A8A77A;
end;

function TPokemonListFrame.GetTypeColor(AType: string): TAlphaColor;
begin
  if AType.Equals('normal') then
    Result := $FFA8A77A
  else //
    if AType.Equals('fire') then
      Result := $FFEE8130
    else //
      if AType.Equals('water') then
        Result := $FF6390F0
      else //
        if AType.Equals('electric') then
          Result := $FFF7D02C
        else //
          if AType.Equals('grass') then
            Result := $FF7AC74C
          else //
            if AType.Equals('ice') then
              Result := $FF96D9D6
            else //
              if AType.Equals('fighting') then
                Result := $FFC22E28
              else //
                if AType.Equals('ground') then
                  Result := $FFE2BF65
                else //
                  if AType.Equals('flying') then
                    Result := $FFA98FF3
                  else //
                    if AType.Equals('psychic') then
                      Result := $FFF95587
                    else //
                      if AType.Equals('bug') then
                        Result := $FFA6B91A
                      else //
                        if AType.Equals('rock') then
                          Result := $FFB6A136
                        else //
                          if AType.Equals('ghost') then
                            Result := $FF735797
                          else //
                            if AType.Equals('dragon') then
                              Result := $FF6F35FC
                            else //
                              if AType.Equals('dark') then
                                Result := $FF705746
                              else //
                                if AType.Equals('steel') then
                                  Result := $FFB7B7CE
                                else //
                                  if AType.Equals('fairy') then
                                    Result := $FFD685AD
                                  else if AType.Equals('poison') then
                                    Result := $FFA33EA1
                                  else
                                    Result := $FFA8A77A;
end;

end.
