object frmCategoriasGrd: TfrmCategoriasGrd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Categorias'
  ClientHeight = 392
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 519
    ExplicitHeight = 396
    object btnCancelar: TButton
      Left = 426
      Top = 360
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 336
      Top = 360
      Width = 75
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = btnOkClick
    end
    object grdCategoria: TDBGrid
      Left = 14
      Top = 9
      Width = 487
      Height = 345
      TabStop = False
      DataSource = dsCategoria
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
  end
  object dsCategoria: TDataSource
    Left = 24
    Top = 344
  end
end