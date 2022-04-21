object frmEditar: TfrmEditar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar'
  ClientHeight = 175
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 175
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      305
      175)
    object lblCodigo: TLabel
      Left = 26
      Top = 23
      Width = 43
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'C'#243'digo*'
      ExplicitLeft = 16
    end
    object lblDescricao: TLabel
      Left = 26
      Top = 79
      Width = 54
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Descri'#231#227'o*'
      ExplicitLeft = 16
    end
    object btnConfirmar: TButton
      Left = 216
      Top = 140
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object edtCodigo: TEdit
      Left = 24
      Top = 42
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtDescricao: TEdit
      Left = 26
      Top = 98
      Width = 265
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
  end
  object dsCategoria: TDataSource
    Left = 24
    Top = 120
  end
end
