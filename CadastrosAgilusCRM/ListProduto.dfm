object frmListProduto: TfrmListProduto
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 366
  ClientWidth = 546
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
    Top = 0
    Width = 546
    Height = 366
    Align = alClient
    TabOrder = 0
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
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = dsProduto
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
        Options.Editing = False
      end
      object cxGrid1DBTableView1Nome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        Options.Editing = False
      end
      object cxGrid1DBTableView1EmpresaId: TcxGridDBColumn
        DataBinding.FieldName = 'EmpresaId'
        Visible = False
        Options.Editing = False
      end
      object cxGrid1DBTableView1RegiaoId: TcxGridDBColumn
        Caption = 'Regi'#227'o'
        DataBinding.FieldName = 'RegiaoId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            FieldName = 'Nome'
          end>
        Properties.ListSource = dmDados.dsRegiao
        Options.Editing = False
      end
      object cxGrid1DBTableView1SeguradoraId: TcxGridDBColumn
        Caption = 'Seguradora'
        DataBinding.FieldName = 'SeguradoraId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            FieldName = 'Nome'
          end>
        Properties.ListSource = dmDados.dsSeguradora
        Options.Editing = False
      end
      object cxGrid1DBTableView1Ativo: TcxGridDBColumn
        DataBinding.FieldName = 'Ativo'
        Options.Editing = False
      end
      object cxGrid1DBTableView1CodigoSeguradora: TcxGridDBColumn
        DataBinding.FieldName = 'CodigoSeguradora'
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object tbProduto: TADOQuery
    Active = True
    Connection = dmDados.Conexao
    CursorType = ctStatic
    AfterInsert = tbProdutoAfterInsert
    AfterEdit = tbProdutoAfterEdit
    Parameters = <>
    SQL.Strings = (
      'select a.Nome, b.*'
      'from Produto a'
      'join ProdutoSeguroSaude b on a.Id = b.Id'
      'where a.EmpresaId = 1')
    Left = 392
    Top = 36
    object tbProdutoId: TIntegerField
      FieldName = 'Id'
    end
    object tbProdutoNome: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object tbProdutoRegiaoId: TIntegerField
      FieldName = 'RegiaoId'
    end
    object tbProdutoSeguradoraId: TIntegerField
      FieldName = 'SeguradoraId'
    end
    object tbProdutoAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tbProdutoQtdeMaximoVidas: TIntegerField
      FieldName = 'QtdeMaximoVidas'
    end
    object tbProdutoCodigoSeguradora: TWideMemoField
      FieldName = 'CodigoSeguradora'
      BlobType = ftWideMemo
    end
  end
  object dsProduto: TDataSource
    DataSet = tbProduto
    Left = 392
    Top = 100
  end
end
