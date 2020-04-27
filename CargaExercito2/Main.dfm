object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Carga do Ex'#233'rcito no Sistema Agilus          (2)'
  ClientHeight = 462
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Caption = #211'rg'#227'o'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbOrgao: TcxLookupComboBox
    Left = 16
    Top = 32
    Properties.ClearKey = 46
    Properties.KeyFieldNames = 'orgav_codigo'
    Properties.ListColumns = <
      item
        FieldName = 'orgav_descricao'
      end>
    Properties.ListSource = dmDados.dsOrgao
    Properties.OnEditValueChanged = cxDBLookupComboBox1PropertiesEditValueChanged
    TabOrder = 1
    Width = 245
  end
  object cxLabel2: TcxLabel
    Left = 276
    Top = 16
    Caption = 'Unidade'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbUnidade: TcxLookupComboBox
    Left = 276
    Top = 32
    Properties.ClearKey = 46
    Properties.KeyFieldNames = 'uni_codigo'
    Properties.ListColumns = <
      item
        FieldName = 'uni_descricao'
      end>
    Properties.ListSource = dmDados.dsUnidade
    TabOrder = 3
    Width = 245
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 60
    Caption = 'M'#234's da Folha'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edMes: TcxDateEdit
    Left = 16
    Top = 76
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 5
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 103
    Caption = 'Selecione o arquivo'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object beArquivo: TcxButtonEdit
    Left = 16
    Top = 120
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = beArquivoPropertiesButtonClick
    TabOrder = 9
    Width = 373
  end
  object cxButton1: TcxButton
    Left = 404
    Top = 118
    Width = 117
    Height = 25
    Caption = 'Processar'
    TabOrder = 10
    OnClick = cxButton1Click
  end
  object Grid: TAdvStringGrid
    Left = 16
    Top = 168
    Width = 505
    Height = 269
    Cursor = crDefault
    ColCount = 3
    DrawingStyle = gdsClassic
    RowCount = 12
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ScrollBars = ssBoth
    TabOrder = 11
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 15387318
    ColumnHeaders.Strings = (
      'Passo'
      'Descri'#231#227'o'
      'Status')
    ControlLook.FixedGradientFrom = clWhite
    ControlLook.FixedGradientTo = clBtnFace
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientHoverBorder = 12033927
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
    ControlLook.FixedGradientDownBorder = 11440207
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    RowHeaders.Strings = (
      ''
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15')
    SearchFooter.ColorTo = 15790320
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurence'
    SearchFooter.HintFindPrev = 'Find previous occurence'
    SearchFooter.HintHighlight = 'Highlight occurences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SortSettings.HeaderColorTo = 16579058
    SortSettings.HeaderMirrorColor = 16380385
    SortSettings.HeaderMirrorColorTo = 16182488
    Version = '5.6.0.0'
    ColWidths = (
      64
      291
      144)
  end
  object cbNaoProcessarArquivo: TcxCheckBox
    Left = 348
    Top = 76
    Caption = 'N'#227'o processar arquivo Access'
    TabOrder = 7
    OnClick = cbNaoProcessarArquivoClick
    Width = 173
  end
  object cxLabel5: TcxLabel
    Left = 152
    Top = 60
    Caption = 'Filial'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbFilial: TcxLookupComboBox
    Left = 152
    Top = 76
    Properties.ClearKey = 46
    Properties.KeyFieldNames = 'fil_codigo'
    Properties.ListColumns = <
      item
        FieldName = 'fil_descricao'
      end>
    Properties.ListSource = dmDados.dsFilial
    Properties.OnEditValueChanged = cxDBLookupComboBox1PropertiesEditValueChanged
    TabOrder = 6
    Width = 181
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = OpenDialog
        Properties.Strings = (
          'InitialDir')
      end>
    StorageName = 'default'
    Left = 324
    Top = 244
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'mdb'
    Filter = 'Arquivo Access |*.mdb;*.accdb'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Escolha arquivo'
    Left = 216
    Top = 233
  end
end
