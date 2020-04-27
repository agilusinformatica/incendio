object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 526
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 413
    Width = 652
    Height = 8
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 89
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 652
    Height = 413
    Align = alTop
    Lines.Strings = (
      '{'
      '  "beneficio": "1427096802",'
      '  "nome": "BELANISIA TEIXEIRA VIEIRA",'
      '  "dataNascimento": "1963-06-24",'
      '  "cpf": "52338118120",'
      '  "especie": {'
      '    "codigo": "21",'
      '    "descricao": "PENSAO POR MORTE PREVIDENCIARIA"'
      '  },'
      '  "dadosBancarios": {'
      '    "banco": {'
      '      "codigo": "237",'
      '      "nome": "BRADESCO"'
      '    },'
      '    "agencia": {'
      '      "codigo": "1455",'
      '      "nome": "S.JOSE QUATRO MARCOS",'
      '      "endereco": {'
      '        "endereco": "AV.SAO PAULO,851-CENTRO",'
      '        "bairro": "CENTRO",'
      '        "cidade": "SAO JOSE DOS QUATRO MARCOS",'
      '        "cep": "78285-000",'
      '        "uf": "MT"'
      '      },'
      '      "orgaoPagador": 220366'
      '    },'
      '    "meioPagamento": {'
      '      "tipo": "CONTA CORRENTE",'
      '      "numero": "0000124141"'
      '    }'
      '  },'
      '  "situacaoBeneficio": "ATIVO",'
      '  "nit": "12376079057",'
      '  "identidade": "889156",'
      '  "sexo": "FEMININO",'
      '  "dib": "2009-12-30",'
      '  "valorBeneficio": 1613.92,'
      '  "possuiRepresentanteLegalProcurador": false,'
      '  "pensaoAlimenticia": false,'
      '  "bloqueioEmprestismo": false,'
      '  "beneficioPermiteEmprestimo": true,'
      '  "margem": {'
      '    "competencia": "03/2019",'
      '    "baseCalculoMargemConsignavel": 1613.92,'
      '    "margemDisponivelEmprestimo": 55.37,'
      '    "percentualMargemDisponivelEmprestimo": 3.4,'
      '    "percentualMargemTotalEmprestimo": 30,'
      '    "quantidadeEmprestimo": 2,'
      '    "possuiCartao": false,'
      '    "margemDisponivelCartao": 80.69,'
      '    "percentualmargemDisponivelCartao": 5,'
      '    "percentualMargemTotalCartao": 5'
      '  },'
      '  "contratosEmprestimo": ['
      '    {'
      '      "contrato": "0123306375375",'
      '      "tipoEmprestimo": {'
      '        "codigo": 75,'
      '        "descricao": "Empr'#233'stimo por Reten'#231#227'o"'
      '      },'
      '      "banco": {'
      '        "codigo": "237",'
      '        "nome": "BRADESCO"'
      '      },'
      '      "dataInicioContrato": "2016-06-15",'
      '      "competenciaInicioDesconto": "07/2016",'
      '      "competenciaFimDesconto": "06/2022",'
      '      "dataInclusao": "2016-06-15",'
      '      "situacao": "Ativo",'
      '      "excluidoAps": false,'
      '      "excluidoBanco": false,'
      '      "valorEmprestado": 7389.84,'
      '      "valorParcela": 206,'
      '      "quantidadeParcelas": 72,'
      '      "quantidadeParcelasEmAberto": 40,'
      '      "saldoQuitacao": 5683.63,'
      '      "taxa": 2.21'
      '    },'
      '    {'
      '      "contrato": "0123306375406",'
      '      "tipoEmprestimo": {'
      '        "codigo": 75,'
      '        "descricao": "Empr'#233'stimo por Reten'#231#227'o"'
      '      },'
      '      "banco": {'
      '        "codigo": "237",'
      '        "nome": "BRADESCO"'
      '      },'
      '      "dataInicioContrato": "2016-06-10",'
      '      "competenciaInicioDesconto": "07/2016",'
      '      "competenciaFimDesconto": "06/2022",'
      '      "dataInclusao": "2016-06-10",'
      '      "situacao": "Ativo",'
      '      "excluidoAps": false,'
      '      "excluidoBanco": false,'
      '      "valorEmprestado": 8000,'
      '      "valorParcela": 222.8,'
      '      "quantidadeParcelas": 72,'
      '      "quantidadeParcelasEmAberto": 40,'
      '      "saldoQuitacao": 6152.82,'
      '      "taxa": 2.21'
      '    }'
      '  ],'
      '  "resultInfo": {'
      '    "timestamp": "2019-03-11T14:11:26.246Z",'
      '    "requesdId": "719d45c69f06ae6e",'
      '    "queryTime": 4020'
      '  },'
      '  "billingInfo": {'
      '    "value": 2,'
      '    "charged": true,'
      '    "balance": 93.5,'
      '    "balanceValidUntil": "2019-03-30T23:00:00.000Z",'
      '    "subscriptionId": "13fqs35e5x02l"'
      '  }'
      '}')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 56
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
