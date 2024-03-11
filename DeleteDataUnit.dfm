object DeleteDataForm: TDeleteDataForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
  ClientHeight = 383
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object NavigationPanel: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 626
    object EmployersButton: TSpeedButton
      Left = 1
      Top = 1
      Width = 312
      Height = 39
      Align = alLeft
      Caption = #1051#1080#1089#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      OnClick = EmployersButtonClick
      ExplicitHeight = 103
    end
    object ItemsButton: TSpeedButton
      Left = 317
      Top = 1
      Width = 312
      Height = 39
      Align = alRight
      Caption = #1051#1080#1089#1090' '#1079#1072#1082#1072#1079#1086#1074
      OnClick = ItemsButtonClick
      ExplicitLeft = 344
      ExplicitHeight = 103
    end
  end
  object OutputGrid: TStringGrid
    Left = 2
    Top = 55
    Width = 620
    Height = 276
    BiDiMode = bdLeftToRight
    DefaultColWidth = 118
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
    OnDblClick = OutputGridDblClick
  end
  object DeleteButton: TButton
    Left = 1
    Top = 337
    Width = 621
    Height = 38
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091
    Enabled = False
    TabOrder = 2
    OnClick = DeleteButtonClick
  end
end
