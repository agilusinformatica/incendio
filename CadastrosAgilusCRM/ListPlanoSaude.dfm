object frmListPlanoSaude: TfrmListPlanoSaude
  Left = 0
  Top = 0
  Caption = 'Planos de Sa'#250'de'
  ClientHeight = 366
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 403
    Height = 325
    Align = alClient
    TabOrder = 0
    ExplicitTop = 0
    ExplicitWidth = 284
    ExplicitHeight = 366
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.DataSource = dsPlanoSaude
      DataController.KeyFieldNames = 'Id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Id: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object cxGrid1DBTableView1Nome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        Width = 194
      end
      object cxGrid1DBTableView1SeguradoraId: TcxGridDBColumn
        DataBinding.FieldName = 'SeguradoraId'
        Visible = False
      end
      object cxGrid1DBTableView1PlanoSaudeGenericoId: TcxGridDBColumn
        Caption = 'Plano Gen'#233'rico'
        DataBinding.FieldName = 'PlanoSaudeGenericoId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            FieldName = 'Nome'
          end>
        Properties.ListSource = dmDados.dsPlanoSaudeGenerico
        Width = 207
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 60
    ExplicitTop = 184
    ExplicitWidth = 185
    object cxLabel1: TcxLabel
      Left = 12
      Top = 12
      Caption = 'Seguradora'
    end
    object cbSeguradora: TcxLookupComboBox
      Left = 78
      Top = 11
      Properties.ClearKey = 46
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'Id'
      Properties.ListColumns = <
        item
          FieldName = 'Id'
        end
        item
          FieldName = 'Nome'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmDados.dsSeguradora
      Properties.OnChange = cbSeguradoraPropertiesChange
      TabOrder = 1
      Width = 195
    end
  end
  object tbPlanoSaude: TADOQuery
    Connection = dmDados.Conexao
    CursorType = ctStatic
    AfterInsert = tbPlanoSaudeAfterInsert
    Parameters = <
      item
        Name = 'SeguradoraId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from PlanoSaude'
      'where SeguradoraId = :SeguradoraId')
    Left = 128
    Top = 140
    object tbPlanoSaudeId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbPlanoSaudeNome: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object tbPlanoSaudeSeguradoraId: TIntegerField
      FieldName = 'SeguradoraId'
    end
    object tbPlanoSaudePlanoSaudeGenericoId: TIntegerField
      FieldName = 'PlanoSaudeGenericoId'
    end
  end
  object dsPlanoSaude: TDataSource
    DataSet = tbPlanoSaude
    Left = 208
    Top = 140
  end
end
