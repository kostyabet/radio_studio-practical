object SearchDataForm: TSearchDataForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1079#1072#1087#1080#1089#1103#1084
  ClientHeight = 408
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object CriteriLabel: TLabel
    Left = 8
    Top = 64
    Width = 98
    Height = 15
    Caption = #1050#1088#1080#1090#1077#1088#1080#1081' '#1087#1086#1080#1089#1082#1072':'
    Visible = False
  end
  object DataLabel: TLabel
    Left = 287
    Top = 64
    Width = 88
    Height = 15
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1080#1089#1082#1072':'
    Visible = False
  end
  object SearchSpButton: TSpeedButton
    Left = 8
    Top = 90
    Width = 620
    Height = 26
    Caption = #1055#1086#1080#1089#1082
    Enabled = False
    Visible = False
    OnClick = SearchSpButtonClick
  end
  object SwitchPanel: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 333
    object AddEmployerButton: TSpeedButton
      Left = 1
      Top = 1
      Width = 312
      Height = 39
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
      Align = alLeft
      Caption = #1055#1086#1080#1089#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ParentShowHint = False
      ShowHint = True
      OnClick = AddEmployerButtonClick
    end
    object AddItemButton: TSpeedButton
      Left = 323
      Top = 1
      Width = 312
      Height = 39
      Hint = #1057#1076#1072#1090#1100' '#1074' '#1088#1077#1084#1086#1085#1090' '#1088#1072#1076#1080#1086#1072#1087#1087#1072#1088#1072#1090#1091#1088#1091'.'
      Align = alRight
      Caption = #1055#1086#1080#1089#1082' '#1072#1087#1087#1072#1088#1072#1090#1091#1088#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = AddItemButtonClick
      ExplicitLeft = 328
    end
  end
  object SearchCriterionCBox: TComboBox
    Left = 112
    Top = 61
    Width = 169
    Height = 23
    Hint = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1072'.'
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
    Visible = False
    OnChange = SearchCriterionCBoxChange
  end
  object DataLEdit: TLabeledEdit
    Left = 381
    Top = 61
    Width = 247
    Height = 23
    Hint = #1042#1072#1096#1080' '#1076#1072#1085#1085#1099#1077
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'DataLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = ''
    TextHint = #1044#1072#1085#1085#1099#1077
    Visible = False
    OnChange = DataLEditChange
  end
  object DataCBox: TComboBox
    Left = 381
    Top = 61
    Width = 247
    Height = 23
    Hint = #1042#1072#1096#1080' '#1076#1072#1085#1085#1099#1077'.'
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
    Visible = False
    OnChange = DataCBoxChange
    Items.Strings = (
      #1074#1099#1087#1086#1083#1085#1077#1085#1086
      #1085#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1086)
  end
  object DataDateTPick: TDateTimePicker
    Left = 381
    Top = 61
    Width = 247
    Height = 23
    Hint = #1042#1072#1096#1080' '#1076#1072#1085#1085#1099#1077'.'
    Date = 45362.000000000000000000
    Time = 0.529758344906440500
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  object OutputGrid: TStringGrid
    Left = 8
    Top = 122
    Width = 620
    Height = 276
    BiDiMode = bdLeftToRight
    DefaultColWidth = 118
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 5
    Visible = False
  end
end
