object DataFinder: TDataFinder
  OnCreate = DataModuleCreate
  Height = 201
  Width = 389
  PixelsPerInch = 96
  object connection: TFDConnection
    Params.Strings = (
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 64
  end
  object qryData: TFDQuery
    Connection = connection
    SQL.Strings = (
      'SELECT * FROM &Table WHERE &Column = :Value')
    Left = 176
    Top = 64
    ParamData = <
      item
        Name = 'VALUE'
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'TABLE'
        DataType = mdIdentifier
      end
      item
        Value = Null
        Name = 'COLUMN'
        DataType = mdIdentifier
      end>
    object qryDataid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDataname: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 25
    end
    object qryDatajson: TWideMemoField
      FieldName = 'json'
      Origin = 'json'
      BlobType = ftWideMemo
    end
  end
end
