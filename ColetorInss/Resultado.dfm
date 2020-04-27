object frmResultado: TfrmResultado
  Left = 0
  Top = 0
  Caption = 'Resultado'
  ClientHeight = 550
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid2: TcxGrid
    Left = 0
    Top = 289
    Width = 773
    Height = 261
    Align = alClient
    TabOrder = 0
    object View: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = ColumnValorParcela
        end
        item
          Kind = skSum
          Column = ColumnValorQuitacao
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object ColumnMR: TcxGridColumn
        Caption = 'MR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnBanco: TcxGridColumn
        Caption = 'Banco'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnValorParcela: TcxGridColumn
        Caption = 'Vlr.Parcela'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnPrazo: TcxGridColumn
        Caption = 'Prazo'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnQtdePagas: TcxGridColumn
        Caption = 'Qt.Pagas'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnData: TcxGridColumn
        Caption = 'Data'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnValorQuitacao: TcxGridColumn
        Caption = 'Vlr.Quita'#231#227'o'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnContrato: TcxGridColumn
        Caption = 'Contrato'
        HeaderAlignmentHorz = taCenter
      end
      object ColumnTipoOperacao: TcxGridColumn
        Caption = 'Tipo Opera'#231#227'o'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = View
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 281
    Width = 773
    Height = 8
    AlignSplitter = salTop
    Control = dxLayoutControl1
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 773
    Height = 281
    Align = alTop
    TabOrder = 2
    object edBeneficio: TcxTextEdit
      Left = 58
      Top = 37
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Text = 'edBeneficio'
      Width = 121
    end
    object edNasc: TcxTextEdit
      Left = 400
      Top = 37
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Text = 'edNasc'
      Width = 121
    end
    object edEspecie: TcxTextEdit
      Left = 226
      Top = 37
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Text = 'edEspecie'
      Width = 121
    end
    object edNome: TcxTextEdit
      Left = 226
      Top = 10
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Text = 'edNome'
      Width = 465
    end
    object edBanco: TcxTextEdit
      Left = 100
      Top = 98
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Text = 'edBanco'
      Width = 121
    end
    object edAgencia: TcxTextEdit
      Left = 100
      Top = 125
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Text = 'edAgencia'
      Width = 121
    end
    object edNomeAgencia: TcxTextEdit
      Left = 100
      Top = 152
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Text = 'edNomeAgencia'
      Width = 121
    end
    object edConta: TcxTextEdit
      Left = 100
      Top = 179
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Text = 'edConta'
      Width = 121
    end
    object edEndereco: TcxTextEdit
      Left = 429
      Top = 98
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Text = 'edEndereco'
      Width = 121
    end
    object edBairro: TcxTextEdit
      Left = 429
      Top = 125
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 13
      Text = 'edBairro'
      Width = 121
    end
    object edCidade: TcxTextEdit
      Left = 429
      Top = 152
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 14
      Text = 'edCidade'
      Width = 132
    end
    object edUf: TcxTextEdit
      Left = 603
      Top = 152
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 16
      Text = 'edUf'
      Width = 121
    end
    object edCep: TcxTextEdit
      Left = 429
      Top = 179
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Text = 'edCep'
      Width = 121
    end
    object edOrgaoPagador: TcxTextEdit
      Left = 100
      Top = 206
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Text = 'edOrgaoPagador'
      Width = 121
    end
    object edTipoPagamento: TcxTextEdit
      Left = 100
      Top = 233
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Text = 'edTipoPagamento'
      Width = 121
    end
    object edCpf: TcxTextEdit
      Left = 58
      Top = 10
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Text = 'edCpf'
      Width = 121
    end
    object edMargem: TcxTextEdit
      Left = 570
      Top = 37
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Text = 'edMargem'
      Width = 121
    end
    object edTelefone: TcxTextEdit
      Left = 603
      Top = 179
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Text = 'edTelefone'
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      CaptionOptions.Text = 'Benef'#237'cio'
      Parent = dxLayoutControl1Group4
      Control = edBeneficio
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = 'Dt.Nasc.'
      Parent = dxLayoutControl1Group4
      Control = edNasc
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = 'Esp'#233'cie'
      Parent = dxLayoutControl1Group4
      Control = edEspecie
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = 'Nome'
      Parent = dxLayoutControl1Group9
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 507
      Control = edNome
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = 'Banco'
      Parent = dxLayoutControl1Group1
      Control = edBanco
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = 'Ag.'
      Parent = dxLayoutControl1Group1
      Control = edAgencia
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      CaptionOptions.Text = 'Nome Ag.'
      Parent = dxLayoutControl1Group1
      Control = edNomeAgencia
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      CaptionOptions.Text = 'C/C'
      Parent = dxLayoutControl1Group1
      Control = edConta
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      CaptionOptions.Text = 'Dados Banc'#225'rios'
      Parent = dxLayoutControl1Group6
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 325
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutControl1Group4: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group10
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      CaptionOptions.Text = 'Logradouro'
      Parent = dxLayoutControl1Group3
      Control = edEndereco
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group2: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      CaptionOptions.Text = 'Bairro'
      Parent = dxLayoutControl1Group3
      Control = edBairro
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group3: TdxLayoutGroup
      CaptionOptions.Text = 'Endere'#231'o'
      Parent = dxLayoutControl1Group8
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 320
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      CaptionOptions.Text = 'Cidade'
      Parent = dxLayoutControl1Group7
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = False
      SizeOptions.Width = 162
      Control = edCidade
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item12: TdxLayoutItem
      CaptionOptions.Text = 'UF'
      Parent = dxLayoutControl1Group12
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 182
      Control = edUf
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group3
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item13: TdxLayoutItem
      CaptionOptions.Text = 'CEP'
      Parent = dxLayoutControl1Group7
      Control = edCep
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group7: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group5
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item14: TdxLayoutItem
      CaptionOptions.Text = #211'rg'#227'o Pagador'
      Parent = dxLayoutControl1Group1
      Control = edOrgaoPagador
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item15: TdxLayoutItem
      CaptionOptions.Text = 'Tipo Pagto.'
      Parent = dxLayoutControl1Group1
      Control = edTipoPagamento
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1SpaceItem1: TdxLayoutEmptySpaceItem
      CaptionOptions.Text = 'Empty Space Item'
      Parent = dxLayoutControl1Group6
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      Index = 0
    end
    object dxLayoutControl1Group6: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group2
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1SpaceItem2: TdxLayoutEmptySpaceItem
      CaptionOptions.Text = 'Empty Space Item'
      Parent = dxLayoutControl1Group8
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      Index = 0
    end
    object dxLayoutControl1Group8: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group2
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item16: TdxLayoutItem
      CaptionOptions.Text = 'CPF'
      Parent = dxLayoutControl1Group9
      Control = edCpf
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group9: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item17: TdxLayoutItem
      CaptionOptions.Text = 'Margem'
      Parent = dxLayoutControl1Group10
      Control = edMargem
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group10: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item18: TdxLayoutItem
      CaptionOptions.Text = 'Telefone'
      Parent = dxLayoutControl1Group12
      Control = edTelefone
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group12: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group5
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1SpaceItem3: TdxLayoutEmptySpaceItem
      CaptionOptions.Text = 'Empty Space Item'
      Parent = dxLayoutControl1Group2
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      Index = 1
    end
  end
end
