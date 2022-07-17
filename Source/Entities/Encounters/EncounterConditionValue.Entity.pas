unit EncounterConditionValue.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TEncounterConditionValueEntity = class
  type
    TCondition = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TNames = class
    type
      TLanguage = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Flanguage: TLanguage;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;
  private
    Fcondition: TCondition;
    Fid: integer;
    Fname: string;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property condition: TCondition read Fcondition write Fcondition;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
  end;

implementation

{ TEncounterConditionValueEntity }

constructor TEncounterConditionValueEntity.Create;
begin
  Fcondition := TCondition.Create;
end;

destructor TEncounterConditionValueEntity.Destroy;
begin
  Fcondition.Free;
  inherited;
end;

{ TEncounterConditionValueEntity.TNames }

constructor TEncounterConditionValueEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TEncounterConditionValueEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
