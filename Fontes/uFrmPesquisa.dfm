object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 92
  ClientWidth = 117
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
    Width = 117
    Height = 92
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object btnProduto: TButton
      Left = 23
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Produto'
      TabOrder = 0
      OnClick = btnProdutoClick
    end
    object btnCategoria: TButton
      Left = 23
      Top = 55
      Width = 75
      Height = 25
      Caption = '&Categoria'
      TabOrder = 1
      OnClick = btnCategoriaClick
    end
  end
end
