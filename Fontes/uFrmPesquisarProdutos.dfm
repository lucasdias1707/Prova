object frmPesquisarProduto: TfrmPesquisarProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 82
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 82
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 297
    ExplicitHeight = 86
    DesignSize = (
      307
      82)
    object edtDescricao: TEdit
      Left = 16
      Top = 14
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtDescricaoChange
    end
    object btnCancelar: TButton
      Left = 216
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
      ExplicitLeft = 206
      ExplicitTop = 129
    end
    object btnOk: TButton
      Left = 135
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      TabOrder = 1
      OnClick = btnOkClick
      ExplicitLeft = 125
      ExplicitTop = 129
    end
  end
end
