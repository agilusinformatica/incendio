object frmSemVinculo: TfrmSemVinculo
  Left = 0
  Top = 0
  Caption = 'Totalizadores sem V'#237'nculo com Banco'
  ClientHeight = 428
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    605
    428)
  PixelsPerInch = 96
  TextHeight = 13
  object cxMemo1: TcxMemo
    Left = 24
    Top = 20
    TabStop = False
    Lines.Strings = (
      'Aten'#231#227'o!'
      ''
      
        'Os seguintes totalizadores n'#227'o est'#227'o vinculados com os bancos ca' +
        'dastrados no sistema Agilus.'
      
        'Por favor, para cada linha, assinale o banco equivalente ao tota' +
        'lizador ou marque-o para ignorar.')
    Properties.ReadOnly = True
    Properties.WordWrap = False
    Style.BorderStyle = ebsNone
    Style.Color = clBtnFace
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Height = 61
    Width = 561
  end
  object cxGrid1: TcxGrid
    Left = 24
    Top = 87
    Width = 563
    Height = 284
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 561
    ExplicitHeight = 278
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDados.dsNaoVinculado
      DataController.KeyFieldNames = 'cod'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1cod: TcxGridDBColumn
        Caption = 'C'#243'd.'
        DataBinding.FieldName = 'cod'
        Options.Editing = False
      end
      object cxGrid1DBTableView1discriminacao: TcxGridDBColumn
        Caption = 'Discrimina'#231#227'o'
        DataBinding.FieldName = 'discriminacao'
        Options.Editing = False
      end
      object cxGrid1DBTableView1bcolib_codigo: TcxGridDBColumn
        Caption = 'Banco'
        DataBinding.FieldName = 'bcolib_codigo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.KeyFieldNames = 'bcolib_codigo'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'd.'
            FieldName = 'bcolib_codigo'
          end
          item
            Caption = 'Banco'
            FieldName = 'bcolib_descricao'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dmDados.dsBanco
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 422
    Top = 386
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = cxButton1Click
    ExplicitLeft = 420
    ExplicitTop = 380
  end
  object cxButton2: TcxButton
    Left = 512
    Top = 386
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
    ExplicitLeft = 510
    ExplicitTop = 380
  end
end
