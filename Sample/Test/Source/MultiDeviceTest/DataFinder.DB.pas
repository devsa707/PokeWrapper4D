unit DataFinder.DB;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.FMXUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TGenericEntity = class
  private
    FId       : integer;
    FName     : string;
    FJson     : string;
    FTableName: string;
  public
    property Id       : integer read FId write FId;
    property Name     : string read FName write FName;
    property Json     : string read FJson write FJson;
    property TableName: string read FTableName write FTableName;
  end;

  TDataFinder = class(TDataModule)
    connection: TFDConnection;
    qryData: TFDQuery;
    qryDataid: TIntegerField;
    qryDataname: TWideStringField;
    qryDatajson: TWideMemoField;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    function ListNames(AValue, ATable: string): TList<string>;
    function Find(AValue, ATable: string): string;
    procedure Save(AGenericEntity: TGenericEntity);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDataFinder.DataModuleCreate(Sender: TObject);
var
  LPath: string;
begin
{$IFDEF MSWINDOWS}
  LPath := System.IOUtils.TPath.GetDocumentsPath + PathDelim + 'data';
  if not DirectoryExists(LPath) then
    ForceDirectories(LPath);
{$ELSE}
  LPath := System.IOUtils.TPath.GetDocumentsPath;
{$ENDIF}
  connection.Params.Values['DriverId'] := 'SQLite';
  connection.Params.Values['DataBase'] := TPath.Combine(LPath, 'data.db');
  try
    connection.Connected := True;
  except
    on E: Exception do
      raise Exception.CreateFmt('Erro de conexão com o banco de dados: %s', [E.Message]);
  end;
end;

function TDataFinder.Find(AValue, ATable: string): string;
var
  LId: integer;
begin
  qryData.SQL.Clear;
  qryData.SQL.Add('SELECT * FROM &Table WHERE &Column = :Value');
  LId := StrToIntDef(AValue, 0);
  if LId <> 0 then
  begin
    qryData.MacroByName('Table').Value     := ATable;
    qryData.MacroByName('Column').Value    := 'Id';
    qryData.ParamByName('Value').AsInteger := LId;
  end
  else
  begin
    qryData.MacroByName('Table').Value    := ATable;
    qryData.MacroByName('Column').Value   := 'Name';
    qryData.ParamByName('Value').AsString := AValue;
  end;
  qryData.Open;
  if not qryData.IsEmpty then
    Exit(qryDatajson.AsString)
  else
    Exit(EmptyStr);
end;

function TDataFinder.ListNames(AValue, ATable: string): TList<string>;
var
  LId: integer;
begin
  qryData.SQL.Clear;
  qryData.SQL.Add('SELECT name FROM &Table WHERE &Column = :Value');
  LId := StrToIntDef(AValue, 0);
  if LId <> 0 then
  begin
    qryData.MacroByName('Table').Value     := ATable;
    qryData.MacroByName('Column').Value    := 'Id';
    qryData.ParamByName('Value').AsInteger := LId;
  end
  else
  begin
    qryData.MacroByName('Table').Value    := ATable;
    qryData.MacroByName('Column').Value   := 'Name';
    qryData.ParamByName('Value').AsString := AValue;
  end;
  qryData.Open;
  if not qryData.IsEmpty then
  begin
    Result := TList<string>.Create;
    while not qryData.Eof do
    begin
      Result.Add(qryDataname.AsString);
      qryData.Next;
    end;
    Exit(Result);
  end;
  Exit(nil);
end;

procedure TDataFinder.Save(AGenericEntity: TGenericEntity);
begin
  qryData.SQL.Clear;
  qryData.SQL.Add('INSERT INTO &Table (Id,Name,Json) VALUES (:Id, :Name, :Json)');
  qryData.MacroByName('Table').Value   := AGenericEntity.TableName;
  qryData.ParamByName('Id').AsInteger  := AGenericEntity.Id;
  qryData.ParamByName('Name').AsString := AGenericEntity.Name;
  qryData.ParamByName('Json').AsString := AGenericEntity.Json;
  qryData.ExecSQL;
end;

end.
