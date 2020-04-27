object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImageComboBox: TcxImageComboBox
    Left = 48
    Top = 152
    Properties.Images = ImageList
    Properties.Items = <>
    TabOrder = 0
    Width = 261
  end
  object ImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 1048596
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'Caramel'
    Left = 80
    Top = 16
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=.\new'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 196
    Top = 52
  end
  object tbSkin: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'skin'
    Left = 348
    Top = 68
    object tbSkinskn_codigo: TAutoIncField
      FieldName = 'skn_codigo'
      ReadOnly = True
    end
    object tbSkinskn_descricao: TStringField
      FieldName = 'skn_descricao'
      Size = 40
    end
    object tbSkinskn_conteudo: TBlobField
      FieldName = 'skn_conteudo'
    end
    object tbSkinskn_icone: TBlobField
      FieldName = 'skn_icone'
    end
  end
end
