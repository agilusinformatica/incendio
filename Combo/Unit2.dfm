object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 216
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Combo: TcxExtLookupComboBox
    Left = 28
    Top = 60
    Properties.Alignment.Horz = taLeftJustify
    Properties.ClearKey = 46
    Properties.DropDownSizeable = True
    Properties.View = cxGridViewRepository1DBTableView1
    Properties.KeyFieldNames = 'bcolib_codigo'
    Properties.ListFieldItem = cxGridViewRepository1DBTableView1bcolib_descricao
    TabOrder = 1
    Width = 369
  end
  object cxTextEdit1: TcxTextEdit
    Left = 28
    Top = 19
    TabOrder = 0
    Text = 'cxTextEdit1'
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 180
    Top = 112
    Width = 75
    Height = 25
    Caption = 'cxButton1'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 28
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=agilus'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 204
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select bcolib_codigo, bcolib_descricao'
      'from bancolib')
    Left = 284
    Top = 20
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 308
    Top = 112
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 104
    Top = 116
    object cxGridViewRepository1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'bcolib_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGridViewRepository1DBTableView1bcolib_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'bcolib_codigo'
      end
      object cxGridViewRepository1DBTableView1bcolib_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'bcolib_descricao'
      end
    end
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'Caramel'
    Left = 284
    Top = 168
  end
end
