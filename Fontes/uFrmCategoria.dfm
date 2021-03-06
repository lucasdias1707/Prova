object frmCategoria: TfrmCategoria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Categorias'
  ClientHeight = 406
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 406
    Align = alClient
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      517
      406)
    object grdCategoria: TDBGrid
      Left = 11
      Top = 15
      Width = 487
      Height = 345
      TabStop = False
      DataSource = dsCategoria
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = grdCategoriaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#211'DIGO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 347
          Visible = True
        end>
    end
    object btnExcluir: TButton
      Left = 427
      Top = 370
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Exclui&r'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnIncluir: TButton
      Left = 252
      Top = 370
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Incluir'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnEditar: TButton
      Left = 339
      Top = 370
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnPesquisar: TButton
      Left = 164
      Top = 370
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
  end
  object dsCategoria: TDataSource
    Left = 216
    Top = 213
  end
end
