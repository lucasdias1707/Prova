object frmPesquisarCategoria: TfrmPesquisarCategoria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 86
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object edtDescricao: TEdit
      Left = 16
      Top = 16
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtDescricaoChange
    end
    object btnCancelar: TButton
      Left = 206
      Top = 49
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnOk: TButton
      Left = 125
      Top = 49
      Width = 75
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
