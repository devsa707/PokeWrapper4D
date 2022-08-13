unit Pokemon.Generation.Node.Entity;

interface

uses
  // MVC
  MVCFramework.Serializer.Commons;

type
  TGenerationI = class
  type
    TRedBlue = class
    private
      Fback_default: string;
      Fback_gray: string;
      Fback_transparent: string;
      Ffront_default: string;
      Ffront_gray: string;
      Ffront_transparent: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_gray: string read Fback_gray write Fback_gray;
      property back_transparent: string read Fback_transparent write Fback_transparent;
      property front_default: string read Ffront_default write Ffront_default;
      property front_gray: string read Ffront_gray write Ffront_gray;
      property front_transparent: string read Ffront_transparent write Ffront_transparent;
    end;

    TYellow = class
    private
      Fback_default: string;
      Fback_gray: string;
      Fback_transparent: string;
      Ffront_default: string;
      Ffront_gray: string;
      Ffront_transparent: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_gray: string read Fback_gray write Fback_gray;
      property back_transparent: string read Fback_transparent write Fback_transparent;
      property front_default: string read Ffront_default write Ffront_default;
      property front_gray: string read Ffront_gray write Ffront_gray;
      property front_transparent: string read Ffront_transparent write Ffront_transparent;
    end;
  private
    [MVCNameAsAttribute('red-blue')]
    Fred_blue: TRedBlue;
    Fyellow: TYellow;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property red_blue: TRedBlue read Fred_blue write Fred_blue;
    property yellow: TYellow read Fyellow write Fyellow;
  end;

  TGenerationII = class
  type
    TCrystal = class
    private
      Fback_default: string;
      Fback_shiny: string;
      Fback_shiny_transparent: string;
      Fback_transparent: string;
      Ffront_default: string;
      Ffront_shiny: string;
      Ffront_shiny_transparent: string;
      Ffront_transparent: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_transparent: string read Fback_shiny_transparent write Fback_shiny_transparent;
      property back_transparent: string read Fback_transparent write Fback_transparent;
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_transparent: string read Ffront_shiny_transparent write Ffront_shiny_transparent;
      property front_transparent: string read Ffront_transparent write Ffront_transparent;
    end;

    TGold = class
    private
      Fback_default: string;
      Fback_shiny: string;
      Ffront_default: string;
      Ffront_shiny: string;
      Ffront_transparent: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_transparent: string read Ffront_transparent write Ffront_transparent;
    end;

    TSilver = class
    private
      Fback_default: string;
      Fback_shiny: string;
      Ffront_default: string;
      Ffront_shiny: string;
      Ffront_transparent: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_transparent: string read Ffront_transparent write Ffront_transparent;
    end;
  private
    Fcrystal: TCrystal;
    Fgold: TGold;
    Fsilver: TSilver;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property crystal: TCrystal read Fcrystal write Fcrystal;
    property gold: TGold read Fgold write Fgold;
    property silver: TSilver read Fsilver write Fsilver;
  end;

  TGenerationIII = class
  type
    TEmerald = class
    private
      Ffront_default: string;
      Ffront_shiny: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
    end;

    TFireredLeafgreen = class
    private
      Fback_default: string;
      Fback_shiny: string;
      Ffront_default: string;
      Ffront_shiny: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
    end;

    TRubySapphire = class
    private
      Fback_default: string;
      Fback_shiny: string;
      Ffront_default: string;
      Ffront_shiny: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property front_default: string read Ffront_default write Ffront_default;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
    end;
  private
    Femerald: TEmerald;
    [MVCNameAsAttribute('firered-leafgreen')]
    Ffirered_leafgreen: TFireredLeafgreen;
    [MVCNameAsAttribute('ruby-sapphire')]
    Fruby_sapphire: TRubySapphire;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property emerald: TEmerald read Femerald write Femerald;
    property firered_leafgreen: TFireredLeafgreen read Ffirered_leafgreen write Ffirered_leafgreen;
    property ruby_sapphire: TRubySapphire read Fruby_sapphire write Fruby_sapphire;
  end;

  TGenerationIV = class
  type
    TDiamondPearl = class
    private
      Fback_default: string;
      Fback_female: string;
      Fback_shiny: string;
      Fback_shiny_female: string;
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;

    THeartgoldSoulsilver = class
    private
      Fback_default: string;
      Fback_female: string;
      Fback_shiny: string;
      Fback_shiny_female: string;
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;

    TPlatinum = class
    private
      Fback_default: string;
      Fback_female: string;
      Fback_shiny: string;
      Fback_shiny_female: string;
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;
  private
    [MVCNameAsAttribute('diamond-pearl')]
    Fdiamond_pearl: TDiamondPearl;
    [MVCNameAsAttribute('heartgold-soulsilver')]
    Fheartgold_soulsilver: THeartgoldSoulsilver;
    Fplatinum: TPlatinum;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property diamond_pearl: TDiamondPearl read Fdiamond_pearl write Fdiamond_pearl;
    property heartgold_soulsilver: THeartgoldSoulsilver read Fheartgold_soulsilver write Fheartgold_soulsilver;
    property platinum: TPlatinum read Fplatinum write Fplatinum;
  end;

  TGenerationV = class
  type
    TBlackWhite = class
    type
      TAnimated = class
      private
        Fback_default: string;
        Fback_female: string;
        Fback_shiny: string;
        Fback_shiny_female: string;
        Ffront_default: string;
        Ffront_female: string;
        Ffront_shiny: string;
        Ffront_shiny_female: string;
      public
        property back_default: string read Fback_default write Fback_default;
        property back_female: string read Fback_female write Fback_female;
        property back_shiny: string read Fback_shiny write Fback_shiny;
        property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
        property front_default: string read Ffront_default write Ffront_default;
        property front_female: string read Ffront_female write Ffront_female;
        property front_shiny: string read Ffront_shiny write Ffront_shiny;
        property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
      end;
    private
      Fanimated: TAnimated;
      Fback_default: string;
      Fback_female: string;
      Fback_shiny: string;
      Fback_shiny_female: string;
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property animated: TAnimated read Fanimated write Fanimated;
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;
  private
    [MVCNameAsAttribute('black-white')]
    Fblack_white: TBlackWhite;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property black_white: TBlackWhite read Fblack_white write Fblack_white;
  end;

  TGenerationVI = class
  type
    TOmegarubyAlphasapphire = class
    private
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;

    TXY = class
    private
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;
  private
    [MVCNameAsAttribute('omegaruby-alphasapphire')]
    Fomegaruby_alphasapphire: TOmegarubyAlphasapphire;
    [MVCNameAsAttribute('x-y')]
    Fx_y: TXY;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property omegaruby_alphasapphire: TOmegarubyAlphasapphire read Fomegaruby_alphasapphire write Fomegaruby_alphasapphire;
    property x_y: TXY read Fx_y write Fx_y;
  end;

  TGenerationVII = class
  type
    TIcons = class
    private
      Ffront_default: string;
      Ffront_female: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
    end;

    TUltraSunUltraMoon = class
    private
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;

  private
    Ficons: TIcons;
    [MVCNameAsAttribute('ultra-sun-ultra-moon')]
    Fultra_sun_ultra_moon: TUltraSunUltraMoon;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property icons: TIcons read Ficons write Ficons;
    property ultra_sun_ultra_moon: TUltraSunUltraMoon read Fultra_sun_ultra_moon write Fultra_sun_ultra_moon;
  end;

  TGenerationVIII = class
  type
    TIcons = class
    private
      Ffront_default: string;
      Ffront_female: string;
    public
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
    end;
  private
    Ficons: TIcons;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property icons: TIcons read Ficons write Ficons;
  end;

implementation

{ TGenerationI }

constructor TGenerationI.Create;
begin
  Fred_blue := TRedBlue.Create;
  Fyellow := TYellow.Create;
end;

destructor TGenerationI.Destroy;
begin
  Fred_blue.Free;
  Fyellow.Free;
  inherited;
end;

{ TGenerationII }

constructor TGenerationII.Create;
begin
  Fcrystal := TCrystal.Create;
  Fgold := TGold.Create;
  Fsilver := TSilver.Create;
end;

destructor TGenerationII.Destroy;
begin
  Fcrystal.Free;
  Fgold.Free;
  Fsilver.Free;
  inherited;
end;

{ TGenerationIII }

constructor TGenerationIII.Create;
begin
  Femerald := TEmerald.Create;
  Ffirered_leafgreen := TFireredLeafgreen.Create;
  Fruby_sapphire := TRubySapphire.Create;
end;

destructor TGenerationIII.Destroy;
begin
  Femerald.Free;
  Ffirered_leafgreen.Free;
  Fruby_sapphire.Free;
  inherited;
end;

{ TGenerationIV }

constructor TGenerationIV.Create;
begin
  Fdiamond_pearl := TDiamondPearl.Create;
  Fheartgold_soulsilver := THeartgoldSoulsilver.Create;
  Fplatinum := TPlatinum.Create;
end;

destructor TGenerationIV.Destroy;
begin
  Fdiamond_pearl.Free;
  Fheartgold_soulsilver.Free;
  Fplatinum.Free;
  inherited;
end;

{ TGenerationV.TBlackWhite }

constructor TGenerationV.TBlackWhite.Create;
begin
  Fanimated := TAnimated.Create;
end;

destructor TGenerationV.TBlackWhite.Destroy;
begin
  Fanimated.Free;
  inherited;
end;

{ TGenerationV }

constructor TGenerationV.Create;
begin
  Fblack_white := TBlackWhite.Create;
end;

destructor TGenerationV.Destroy;
begin
  Fblack_white.Free;
  inherited;
end;

{ TGenerationVI }

constructor TGenerationVI.Create;
begin
  Fomegaruby_alphasapphire := TOmegarubyAlphasapphire.Create;
  Fx_y := TXY.Create;
end;

destructor TGenerationVI.Destroy;
begin
  Fomegaruby_alphasapphire.Free;
  Fx_y.Free;
  inherited;
end;

{ TGenerationVII }

constructor TGenerationVII.Create;
begin
  Ficons := TIcons.Create;
  Fultra_sun_ultra_moon := TUltraSunUltraMoon.Create;
end;

destructor TGenerationVII.Destroy;
begin
  Ficons.Free;
  Fultra_sun_ultra_moon.Free;
  inherited;
end;

{ TGenerationVIII }

constructor TGenerationVIII.Create;
begin
  Ficons := TIcons.Create;
end;

destructor TGenerationVIII.Destroy;
begin
  Ficons.Free;
  inherited;
end;

end.
