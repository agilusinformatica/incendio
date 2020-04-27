object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 476
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    476)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 544
    Top = 436
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'cxButton1'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxMemo1: TcxMemo
    Left = 16
    Top = 8
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'VERSION BUILD=9002379'
      'TAB T=1'
      'TAB CLOSEALLOTHERS'
      'URL GOTO=https://www.ibconsigweb.com.br/cas/login?logout=true'
      'SET !WAITPAGECOMPLETE YES'
      ''
      
        #39'GARANTINDO QUE N'#195'O D'#202' PROBLEMA NA HORA DE SALVAR A IMAGEM, E NE' +
        'M ERRO AO TENTAR APAGAR A IMAGEM NA PRIMEIRA VEZ DO PROCESSO'
      'SET !ERRORIGNORE YES'
      'FILEDELETE NAME=C:\Users\suporte2\Documents\Captcha_files'
      ''
      'SET !ERRORIGNORE NO '
      'SET !WAITPAGECOMPLETE NO'
      'SET !TIMEOUT_STEP 6'
      ''
      #39'DOWNLOAD DA IMAGEM'
      
        'ONDOWNLOAD FOLDER=C:\Users\suporte2\Documents\Captcha_files FILE' +
        '=captcha.png'
      'FRAME NAME=iCaptcha'
      
        'TAG POS=1 TYPE=IMG ATTR=SRC:https://www.ibconsigweb.com.br/cas/c' +
        'aptcha.html CONTENT=EVENT:SAVE_ELEMENT_SCREENSHOT'
      ''
      #39'FAZENDO O UPLOAD DO CAPTCHA'
      'TAB OPEN'
      'TAB T=2'
      'URL GOTO=http://Captchatypers.com/Forms/FileUploadAndGetText.htm'
      
        'TAG POS=1 TYPE=INPUT:TEXT FORM=ACTION:UploadFileAndGetText.ashx ' +
        'ATTR=NAME:username CONTENT=agilus'
      
        'TAG POS=1 TYPE=INPUT:PASSWORD FORM=ACTION:UploadFileAndGetText.a' +
        'shx ATTR=NAME:password CONTENT=168421'
      
        'TAG POS=1 TYPE=INPUT:FILE FORM=ACTION:UploadFileAndGetText.ashx ' +
        'ATTR=NAME:file CONTENT=C:\Users\suporte2\Documents\Captcha_files' +
        '\captcha.png'
      
        'TAG POS=1 TYPE=INPUT:SUBMIT FORM=ACTION:UploadFileAndGetText.ash' +
        'x ATTR=VALUE:Submit'
      'SET !EXTRACT_TEST_POPUP NO'
      'TAG POS=1 TYPE=BODY ATTR=TXT:* EXTRACT=TXT'
      'SET CAPTCHA1 {{!EXTRACT}}'
      'TAB CLOSE'
      'TAB T=1'
      ''
      
        #39'ESSE RECURSO FOI FEITO PARA AGUARDAR A CARGA DA P'#193'GINA, POIS A ' +
        'IMAGEM N'#195'O PODE SER ENCONTRADA SE O WAITPAGE ESTIVER HABILITADO!'
      'SET !WAITPAGECOMPLETE YES'
      'TAG POS=1 TYPE=INPUT:TEXT ATTR=NAME:username CONTENT='
      'SET !WAITPAGECOMPLETE NO'
      ''
      'SET !TIMEOUT_STEP 10'
      
        #39'SE ESSA IMAGEM N'#195'O APARECER O USU'#193'RIO '#201' APAGADO QUANDO CLICA EM' +
        ' OUTRO CAMPO'
      
        'TAG POS=1 TYPE=IMG ATTR=SRC:https://www.ibconsigweb.com.br/cas/i' +
        'mages/login/norton.jpeg'
      ''
      #39'USU'#193'RIO E SENHA DE TESTE'
      'SET USUARIO felippe.meta'
      'SET SENHA agilus$1684'
      'TAG POS=1 TYPE=INPUT:TEXT ATTR=NAME:username CONTENT={{USUARIO}}'
      'SET !ENCRYPTION NO'
      
        'TAG POS=1 TYPE=INPUT:PASSWORD ATTR=NAME:password CONTENT={{SENHA' +
        '}}'
      ''
      #39'COLOCANDO O TEXTO EXTRA'#205'DO NO CAMPO DO CAPTCHA'
      
        'TAG POS=1 TYPE=INPUT:TEXT ATTR=NAME:j_captcha_response CONTENT={' +
        '{CAPTCHA1}}'
      'SET !EXTRACT NULL'
      ''
      'IMAGECLICK POS=1 IMAGE=btn_ok.png CONFIDENCE=95'
      ''
      
        #39'SE N'#195'O HOUVER JANELA DE DI'#193'LOGO, ELE CONTINUA A MACRO IGNORANDO' +
        ' O ERRO'
      'SET !ERRORIGNORE YES'
      'SET !TIMEOUT_STEP 1'
      'ONWEBPAGEDIALOG KEYS="{WAIT<SP>2}{CLOSE}"'
      'SET !ERRORIGNORE NO'
      'SET !TIMEOUT_STEP 10'
      ''
      #9#9'FRAME NAME=topFrame'
      'IMAGESEARCH POS=1 IMAGE=ambiente_bmg.png CONFIDENCE=95'
      'DS CMD=MOVETO X={!IMAGEX} Y={!IMAGEY}'
      'SET !TIMEOUT_STEP 20'
      ''
      #39'ACESSANDO OP'#199#195'O DE REFINANCIAMENTO'
      'IMAGECLICK POS=1 IMAGE=menu_proposta.png CONFIDENCE=95'
      'IMAGECLICK POS=1 IMAGE=refinanciamento.png CONFIDENCE=95'
      ''
      #39'DOWNLOAD DA IMAGEM'
      
        'ONDOWNLOAD FOLDER=C:\Users\suporte2\Documents\Captcha_files FILE' +
        '=captcha.png'
      'FRAME NAME=iCaptcha'
      'SET !ERRORIGNORE YES'
      'SET !TIMEOUT_STEP 1'
      
        'TAG POS=1 TYPE=IMG ATTR=SRC:https://ssoconsig.bancobmg.com.br/Ca' +
        'rregaCaptcha.captcha CONTENT=EVENT:SAVE_ELEMENT_SCREENSHOT'
      
        'TAG POS=1 TYPE=IMG ATTR=SRC:https://www2.ibconsigweb.com.br/Carr' +
        'egaCaptcha.captcha CONTENT=EVENT:SAVE_ELEMENT_SCREENSHOT'
      'SET !ERRORIGNORE NO'
      'SET !TIMEOUT_STEP 20'
      ''
      #39'FAZENDO O UPLOAD DO CAPTCHA'
      'TAB OPEN'
      'TAB T=2'
      'URL GOTO=http://Captchatypers.com/Forms/FileUploadAndGetText.htm'
      
        'TAG POS=1 TYPE=INPUT:TEXT FORM=ACTION:UploadFileAndGetText.ashx ' +
        'ATTR=NAME:username CONTENT=agilus'
      
        'TAG POS=1 TYPE=INPUT:PASSWORD FORM=ACTION:UploadFileAndGetText.a' +
        'shx ATTR=NAME:password CONTENT=168421'
      
        'TAG POS=1 TYPE=INPUT:FILE FORM=ACTION:UploadFileAndGetText.ashx ' +
        'ATTR=NAME:file CONTENT=C:\Users\suporte2\Documents\Captcha_files' +
        '\captcha.png'
      
        'TAG POS=1 TYPE=INPUT:SUBMIT FORM=ACTION:UploadFileAndGetText.ash' +
        'x ATTR=VALUE:Submit'
      'SET !EXTRACT_TEST_POPUP NO'
      'TAG POS=1 TYPE=BODY ATTR=TXT:* EXTRACT=TXT'
      'SET CAPTCHA2 {{!EXTRACT}}'
      'TAB CLOSE'
      'TAB T=1'
      ''
      #39'PASSANDO PAR'#194'METROS DE BUSCA DE CLIENTE'
      'SET ESTABELECIMENTO 1581'
      'SET CPF_TESTE 49720546115'
      'FRAME NAME=rightFrame'
      
        'TAG POS=1 TYPE=INPUT:TEXT FORM=NAME:consignacaoForm ATTR=NAME:co' +
        'digoEstabelecimento CONTENT={{ESTABELECIMENTO}}'
      
        'TAG POS=1 TYPE=INPUT:TEXT FORM=NAME:consignacaoForm ATTR=NAME:re' +
        'gistroFilter.cpf CONTENT={{CPF_TESTE}}'
      
        'TAG POS=1 TYPE=INPUT:TEXT FORM=NAME:consignacaoForm ATTR=NAME:ca' +
        'ptcha CONTENT={{CAPTCHA2}}'
      'SET !EXTRACT NULL'
      'TAG POS=1 TYPE=A FORM=NAME:consignacaoForm ATTR=TXT:Pesquisar'
      'SET !TIMEOUT_STEP 60'
      'SET !EXTRACT_TEST_POPUP NO'
      'SET CONTRATO 239832440'
      ''
      #39'MARCANDO CHECKBOX REFERENTE AO N'#218'MERO DO CONTRATO ESCOLHIDO'
      
        'TAG POS=1 TYPE=INPUT:CHECKBOX FORM=NAME:consignacaoForm ATTR=ID:' +
        'id{{CONTRATO}} CONTENT=YES'
      'TAG POS=1 TYPE=SPAN FORM=NAME:consignacaoForm ATTR=TXT:Confirmar'
      ''
      'SET !ERRORIGNORE YES'
      'SET !TIMEOUT_STEP 1'
      'ONDIALOG POS=1 BUTTON=NO'
      'SET !ERRORIGNORE NO'
      'SET !TIMEOUT_STEP 60'
      ''
      'FRAME NAME=rightFrame'
      
        'TAG POS=1 TYPE=SPAN FORM=NAME:consignacaoForm ATTR=ID:label_refi' +
        'nanciamento.valorSaldoDevedor EXTRACT=TXT'
      'SET SALDO_DEVEDOR {{!EXTRACT}}'
      'PROMPT Saldo<SP>devedor:<sp>{{SALDO_DEVEDOR}}')
    Properties.ScrollBars = ssVertical
    Properties.WordWrap = False
    TabOrder = 1
    Height = 405
    Width = 603
  end
end
