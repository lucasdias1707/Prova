object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmProdutos'
  ClientHeight = 633
  ClientWidth = 963
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
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 633
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      963
      633)
    object lblTitulo: TLabel
      Left = 408
      Top = 2
      Width = 101
      Height = 32
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8913664
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object btnFechar: TSpeedButton
      Left = 922
      Top = 8
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'X'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharClick
    end
    object pnlLinha: TPanel
      Left = 16
      Top = 40
      Width = 929
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
    end
    object grdProdutos: TDBGrid
      Left = 16
      Top = 48
      Width = 929
      Height = 537
      TabStop = False
      DataSource = dsProdutos
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'CODIGO'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 492
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Width = 231
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Width = 96
          Visible = True
        end>
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 591
      Width = 963
      Height = 42
      Anchors = [akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object btnCategorias: TButton
        Left = 514
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Categorias'
        TabOrder = 0
        OnClick = btnCategoriasClick
      end
      object edtEditar: TButton
        Left = 783
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Editar'
        TabOrder = 1
        OnClick = edtEditarClick
      end
      object edtExcluir: TButton
        Left = 870
        Top = 9
        Width = 75
        Height = 25
        Caption = 'E&xcluir'
        TabOrder = 2
        OnClick = edtExcluirClick
      end
      object edtIncluir: TButton
        Left = 694
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Incluir'
        TabOrder = 3
        OnClick = edtIncluirClick
      end
      object edtPesquisar: TButton
        Left = 606
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 4
        OnClick = edtPesquisarClick
      end
      object btnAtualizar: TButton
        Left = 424
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Atualizar'
        TabOrder = 5
        OnClick = btnAtualizarClick
      end
    end
  end
  object dsProdutos: TDataSource
    Left = 64
    Top = 528
  end
end
