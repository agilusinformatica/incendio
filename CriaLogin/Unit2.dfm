object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cria'#231#227'o de Login'
  ClientHeight = 218
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 36
    Top = 42
    Width = 101
    Height = 13
    Caption = 'NOME DO SERVIDOR'
  end
  object Edit1: TEdit
    Left = 36
    Top = 56
    Width = 293
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 36
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Criar Login'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 240
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'use master'
      ''
      'if exists (select 1 from syslogins where name = '#39'agilus'#39')'
      '   drop login agilus'
      ''
      
        'create login agilus with password='#39'awrpu07!@$AFAFAsdfqrasfafJMYJ' +
        'YJ&* $%'#39', default_language=english'
      ''
      'if exists (select 1 from syslogins where name = '#39'claudio'#39')'
      '   drop login claudio'
      ''
      
        'create login claudio with password='#39'ac@78902'#39', default_database=' +
        'dbAgilus, default_language=english'
      ''
      
        'EXEC master..sp_addsrvrolemember @loginame = N'#39'claudio'#39', @rolena' +
        'me = N'#39'sysadmin'#39
      ''
      'use dbAgilus'
      ''
      'if exists (select 1 from sysusers where name = '#39'agilus'#39')'
      '   drop user agilus'
      ''
      'create user agilus for login agilus')
    Left = 328
    Top = 136
  end
end
