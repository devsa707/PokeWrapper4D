unit SVG.TypeIcons;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.UITypes,
  Pokemon.Types.Constants;

type
  ITypeIcon = interface
    ['{CE9A9626-129F-4F07-BBBD-1E6A9CCC7F0F}']
    function GetTypeColor(AType: string): TAlphaColor;
    function GetBackGroundColor(AType: string): TAlphaColor;
    function GetTypeIcon(AType: string): string;
    function GetGradientPrimaryColor(AType: string): string;
    function GetGradientSecondaryColor(AType: string): string;
  end;

  TTypeIcon = class(TInterfacedObject, ITypeIcon)
    class function New: ITypeIcon;
    function GetTypeColor(AType: string): TAlphaColor;
    function GetBackGroundColor(AType: string): TAlphaColor;
    function GetGradientPrimaryColor(AType: string): string;
    function GetGradientSecondaryColor(AType: string): string;
    function GetTypeIcon(AType: string): string;
  end;

implementation

{ TTypeIcon }

function TTypeIcon.GetBackGroundColor(AType: string): TAlphaColor;
begin
  case IndexStr(AType, POKEMON_TYPES) of
    0:
      Exit($C8A8A77A);
    1:
      Exit($C8EE8130);
    2:
      Exit($C86390F0);
    3:
      Exit($C8F7D02C);
    4:
      Exit($C87AC74C);
    5:
      Exit($C896D9D6);
    6:
      Exit($C8C22E28);
    7:
      Exit($C8E2BF65);
    8:
      Exit($C8A98FF3);
    9:
      Exit($C8F95587);
    10:
      Exit($C8A6B91A);
    11:
      Exit($C8B6A136);
    12:
      Exit($C8735797);
    13:
      Exit($C86F35FC);
    14:
      Exit($C8705746);
    15:
      Exit($C8B7B7CE);
    16:
      Exit($C8D685AD);
    17:
      Exit($C8A33EA1);
  else
    Exit($C8A8A77A);
  end;
end;

function TTypeIcon.GetGradientPrimaryColor(AType: string): string;
begin
  case IndexStr(AType, POKEMON_TYPES) of
    0:
      Exit('#A8A77A');
    1:
      Exit('#EE8130');
    2:
      Exit('#6390F0');
    3:
      Exit('#F7D02C');
    4:
      Exit('#7AC74C');
    5:
      Exit('#96D9D6');
    6:
      Exit('#C22E28');
    7:
      Exit('#E2BF65');
    8:
      Exit('#A98FF3');
    9:
      Exit('#F95587');
    10:
      Exit('#A6B91A');
    11:
      Exit('#B6A136');
    12:
      Exit('#735797');
    13:
      Exit('#6F35FC');
    14:
      Exit('#705746');
    15:
      Exit('#B7B7CE');
    16:
      Exit('#D685AD');
    17:
      Exit('#A33EA1');
  else
    Exit('#A8A77A');
  end;
end;

function TTypeIcon.GetGradientSecondaryColor(AType: string): string;
begin
  case IndexStr(AType, POKEMON_TYPES) of
    0:
      Exit('#D1D0AA');
    1:
      Exit('#FCBD8D');
    2:
      Exit('#B8CEFF');
    3:
      Exit('#FFEDA6');
    4:
      Exit('#B9F596');
    5:
      Exit('#CFFFFD');
    6:
      Exit('#FF9F9C');
    7:
      Exit('#FFEAB5');
    8:
      Exit('#DFD4FF');
    9:
      Exit('#FFADC6');
    10:
      Exit('#E6F573');
    11:
      Exit('#F2DF80');
    12:
      Exit('#CEB4F0');
    13:
      Exit('#C4ADFF');
    14:
      Exit('#DBBAA4');
    15:
      Exit('#E3E3FA');
    16:
      Exit('#FAC3DF');
    17:
      Exit('#ED9CEC');
  else
    Exit('#EDECBB');
  end;
end;

function TTypeIcon.GetTypeColor(AType: string): TAlphaColor;
begin
  case IndexStr(AType, POKEMON_TYPES) of
    0:
      Exit($FFA8A77A);
    1:
      Exit($FFEE8130);
    2:
      Exit($FF6390F0);
    3:
      Exit($FFF7D02C);
    4:
      Exit($FF7AC74C);
    5:
      Exit($FF96D9D6);
    6:
      Exit($FFC22E28);
    7:
      Exit($FFE2BF65);
    8:
      Exit($FFA98FF3);
    9:
      Exit($FFF95587);
    10:
      Exit($FFA6B91A);
    11:
      Exit($FFB6A136);
    12:
      Exit($FF735797);
    13:
      Exit($FF6F35FC);
    14:
      Exit($FF705746);
    15:
      Exit($FFB7B7CE);
    16:
      Exit($FFD685AD);
    17:
      Exit($FFA33EA1);
  else
    Exit($FFA8A77A);
  end;
end;

function TTypeIcon.GetTypeIcon(AType: string): string;
begin
  case IndexStr(AType, POKEMON_TYPES) of
    0:
      Exit(svg_typenormal);
    1:
      Exit(svg_typefire);
    2:
      Exit(svg_typewater);
    3:
      Exit(svg_typeelectric);
    4:
      Exit(svg_typegrass);
    5:
      Exit(svg_typeice);
    6:
      Exit(svg_typefighting);
    7:
      Exit(svg_typeground);
    8:
      Exit(svg_typeflying);
    9:
      Exit(svg_typepsychic);
    10:
      Exit(svg_typebug);
    11:
      Exit(svg_typerock);
    12:
      Exit(svg_typeghost);
    13:
      Exit(svg_typedragon);
    14:
      Exit(svg_typedark);
    15:
      Exit(svg_typesteel);
    16:
      Exit(svg_typefairy);
    17:
      Exit(svg_typepoison);
  else
    Exit(EmptyStr);
  end;
end;

class function TTypeIcon.New: ITypeIcon;
begin
  Result := TTypeIcon.Create;
end;

end.
