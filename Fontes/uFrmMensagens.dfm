object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aviso'
  ClientHeight = 203
  ClientWidth = 653
  Color = clMaroon
  TransparentColor = True
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 203
    Align = alClient
    BevelOuter = bvNone
    Color = 16645629
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 651
    ExplicitHeight = 220
    DesignSize = (
      653
      203)
    object imgIcone: TImage
      Left = 14
      Top = 54
      Width = 128
      Height = 128
      Stretch = True
    end
    object lblTituloJanela: TLabel
      Left = 24
      Top = 6
      Width = 87
      Height = 25
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10987431
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTituloMensagem: TLabel
      Left = 158
      Top = 55
      Width = 60
      Height = 17
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10987431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlLinha: TPanel
      Left = 0
      Top = 37
      Width = 653
      Height = 2
      Color = clDefault
      ParentBackground = False
      TabOrder = 0
    end
    object memMensagem: TMemo
      Left = 155
      Top = 78
      Width = 482
      Height = 89
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10987431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'Mensagem aqui')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object btnSim: TButton
      Left = 560
      Top = 173
      Width = 77
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&SIM ( ENTER )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSimClick
      OnKeyDown = FormKeyDown
    end
    object btnNao: TButton
      Left = 477
      Top = 173
      Width = 77
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&N'#195'O ( ESC )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnNaoClick
      OnKeyDown = FormKeyDown
    end
  end
end
