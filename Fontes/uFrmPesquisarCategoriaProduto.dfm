object frmPesquisarCategoriaProduto: TfrmPesquisarCategoriaProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 79
  ClientWidth = 296
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
    Width = 296
    Height = 79
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      296
      79)
    object edtCategoria: TEdit
      Left = 16
      Top = 14
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtCategoriaChange
    end
    object btnCancelar: TButton
      Left = 205
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnOk: TButton
      Left = 124
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
