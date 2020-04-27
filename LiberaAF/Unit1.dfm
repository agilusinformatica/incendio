object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Libera AF'
  ClientHeight = 241
  ClientWidth = 515
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'C'#243'digo AF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 144
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxVerticalGrid1: TcxDBVerticalGrid
    Left = 8
    Top = 60
    Width = 497
    Height = 133
    OptionsView.RowHeaderWidth = 116
    OptionsData.Editing = False
    OptionsData.Appending = False
    OptionsData.Deleting = False
    OptionsData.Inserting = False
    Navigator.Buttons.CustomButtons = <>
    TabOrder = 2
    DataController.DataSource = DataSource1
    Version = 1
    object cxVerticalGrid1con_nome: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'con_nome'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object cxVerticalGrid1con_cpf: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'con_cpf'
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object cxVerticalGrid1af_valor: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'af_valor'
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    object cxVerticalGrid1af_data: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'af_data'
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    object cxVerticalGrid1bcolib_descricao: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'bcolib_descricao'
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
    object cxVerticalGrid1itb_qtde_parcelas: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'itb_qtde_parcelas'
      ID = 5
      ParentID = -1
      Index = 5
      Version = 1
    end
    object cxVerticalGrid1enc_data_entrada: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'enc_data_entrada'
      Visible = False
      ID = 6
      ParentID = -1
      Index = 6
      Version = 1
    end
  end
  object Button2: TButton
    Left = 100
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Liberar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Conexao: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;Data Source=192.' +
      '168.201.230;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Application Name=Libera'#231#227'o AF;Workstation ID=AGILUS' +
      '2;Use Encryption for Data=False;Tag with column collation when p' +
      'ossible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 128
  end
  object tbAf: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodAf'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select con_nome, con_cpf, dbo.fn_valor_repasse(af_codigo) af_val' +
        'or, '
      'af_data, bcolib_descricao, itb_qtde_parcelas, enc_data_entrada,'
      'enc_codigo'
      'from af a, convenio b, bancolib c'
      'where a.con_codigo = b.con_codigo'
      'and a.bcolib_codigo = c.bcolib_codigo'
      'and a.af_codigo = :CodAf')
    Left = 176
    Top = 120
    object tbAfcon_nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'con_nome'
      Size = 70
    end
    object tbAfcon_cpf: TWideStringField
      DisplayLabel = 'CPF'
      FieldName = 'con_cpf'
      EditMask = '999.999.999-99;0; '
      Size = 11
    end
    object tbAfaf_valor: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Valor'
      FieldName = 'af_valor'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 19
    end
    object tbAfaf_data: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'af_data'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object tbAfbcolib_descricao: TWideStringField
      DisplayLabel = 'Banco'
      FieldName = 'bcolib_descricao'
      Size = 40
    end
    object tbAfitb_qtde_parcelas: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Qtd.Parcelas'
      FieldName = 'itb_qtde_parcelas'
    end
    object tbAfenc_data_entrada: TDateTimeField
      FieldName = 'enc_data_entrada'
      Visible = False
    end
    object tbAfenc_codigo: TIntegerField
      FieldName = 'enc_codigo'
    end
  end
  object DataSource1: TDataSource
    DataSet = tbAf
    Left = 240
    Top = 124
  end
  object Command: TADOCommand
    CommandText = 
      'set xact_abort on'#13#10#13#10'begin transaction'#13#10#13#10'declare @lus_codigo in' +
      't'#13#10#13#10'insert into login_usuario ( usu_codigo, lus_login, lus_data' +
      '_conexao, lus_numero_conexao, lus_versao, lus_ip_externo)'#13#10'value' +
      's( 1, '#39'admin'#39', getdate(), @@spid, '#39'sql'#39', '#39'sql'#39')'#13#10#13#10'select @lus_c' +
      'odigo = @@identity'#13#10'-----------------------------'#13#10'update af'#13#10'se' +
      't enc_codigo = null'#13#10'where af_codigo = :CodAf'#13#10'-----------------' +
      '------------'#13#10'update login_usuario'#13#10'set lus_data_desconexao = ge' +
      'tdate()'#13#10'where lus_codigo = @lus_codigo'#13#10#13#10'commit'#13#10
    Connection = Conexao
    Parameters = <
      item
        Name = 'CodAf'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 260
    Top = 176
  end
end
