object AddDataForm: TAddDataForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
  ClientHeight = 261
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
  object EmployeCodeLabel: TLabel
    Left = 17
    Top = 63
    Width = 134
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployeFIOLabel: TLabel
    Left = 17
    Top = 92
    Width = 96
    Height = 15
    Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployePostLabel: TLabel
    Left = 17
    Top = 121
    Width = 131
    Height = 15
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployeWorkHourLabel: TLabel
    Left = 17
    Top = 150
    Width = 165
    Height = 15
    Caption = #1063#1080#1089#1083#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074' '#1074' '#1089#1091#1090#1082#1080':'
    Visible = False
  end
  object AddButton: TSpeedButton
    Left = 17
    Top = 205
    Width = 597
    Height = 38
    Enabled = False
    Visible = False
    OnClick = AddButtonClick
  end
  object ItemGroupLabel: TLabel
    Left = 17
    Top = 63
    Width = 147
    Height = 15
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1080#1079#1076#1077#1083#1080#1081':'
    Visible = False
  end
  object ItemMarkLabel: TLabel
    Left = 17
    Top = 92
    Width = 86
    Height = 15
    Caption = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103':'
    Visible = False
  end
  object DateOfStartLabel: TLabel
    Left = 17
    Top = 121
    Width = 133
    Height = 15
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1105#1084#1082#1080' '#1074' '#1088#1077#1084#1086#1085#1090':'
    Visible = False
  end
  object EmployeFixedCodeLabel: TLabel
    Left = 17
    Top = 150
    Width = 126
    Height = 15
    Caption = #1050#1086#1076' '#1088#1077#1084#1086#1085#1090#1080#1088#1091#1102#1097#1077#1075#1086':'
    Visible = False
  end
  object ReadyLabel: TLabel
    Left = 17
    Top = 179
    Width = 164
    Height = 15
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1072':'
    Visible = False
  end
  object SwitchPanel: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 632
    object AddEmployerButton: TSpeedButton
      Left = 1
      Top = 1
      Width = 313
      Height = 39
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
      Align = alLeft
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ParentShowHint = False
      ShowHint = True
      OnClick = AddEmployerButtonClick
    end
    object AddItemButton: TSpeedButton
      Left = 325
      Top = 1
      Width = 310
      Height = 39
      Hint = #1057#1076#1072#1090#1100' '#1074' '#1088#1077#1084#1086#1085#1090' '#1088#1072#1076#1080#1086#1072#1087#1087#1072#1088#1072#1090#1091#1088#1091'.'
      Align = alRight
      Caption = #1057#1076#1072#1090#1100' '#1072#1087#1087#1072#1088#1072#1090#1091#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = AddItemButtonClick
      ExplicitLeft = 320
    end
  end
  object DateOfStartPicker: TDateTimePicker
    Left = 193
    Top = 118
    Width = 421
    Height = 23
    Date = 45356.000000000000000000
    Time = 0.995833587963716100
    TabOrder = 1
    Visible = False
    OnChange = DateOfStartPickerChange
  end
  object ReadyCBox: TComboBox
    Left = 193
    Top = 176
    Width = 421
    Height = 23
    Hint = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1072'.'
    Style = csDropDownList
    ItemIndex = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = #1053#1077' '#1074#1099#1087#1086#1083#1085#1077#1085
    TextHint = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
    Visible = False
    OnChange = ReadyCBoxChange
    Items.Strings = (
      #1042#1099#1087#1086#1083#1085#1077#1085
      #1053#1077' '#1074#1099#1087#1086#1083#1085#1077#1085)
  end
  object EmployeCodeLEdit: TLabeledEdit
    Left = 193
    Top = 60
    Width = 421
    Height = 23
    Hint = #1050#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 100
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeCodeLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = ''
    TextHint = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
    OnChange = EmployeCodeLEditChange
  end
  object ItemGroupLEdit: TLabeledEdit
    Left = 193
    Top = 60
    Width = 421
    Height = 23
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1080#1079#1076#1077#1083#1080#1081'.'
    EditLabel.Width = 83
    EditLabel.Height = 15
    EditLabel.Caption = 'ItemGroupLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = ''
    TextHint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1080#1079#1076#1077#1083#1080#1081
    Visible = False
    OnChange = ItemGroupLEditChange
  end
  object ItemMarkLEdit: TLabeledEdit
    Left = 193
    Top = 89
    Width = 421
    Height = 23
    Hint = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103'.'
    EditLabel.Width = 77
    EditLabel.Height = 15
    EditLabel.Caption = 'ItemMarkLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = ''
    TextHint = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103
    Visible = False
    OnChange = ItemMarkLEditChange
  end
  object EmployeFIOLEdit: TLabeledEdit
    Left = 193
    Top = 89
    Width = 421
    Height = 23
    Hint = #1060#1048#1054' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 90
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeFIOLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = ''
    TextHint = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
    OnChange = EmployeFIOLEditChange
  end
  object EmployePostLEdit: TLabeledEdit
    Left = 193
    Top = 118
    Width = 421
    Height = 23
    Hint = #1047#1072#1085#1080#1084#1072#1077#1084#1072#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 95
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployePostLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = ''
    TextHint = #1047#1072#1085#1080#1084#1072#1077#1084#1072#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
    Visible = False
    OnChange = EmployePostLEditChange
  end
  object EmployeFixedCodeLEdit: TLabeledEdit
    Left = 193
    Top = 147
    Width = 421
    Height = 23
    Hint = #1050#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 128
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeFixedCodeLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = ''
    TextHint = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
    OnChange = EmployeFixedCodeLEditChange
  end
  object EmployeWorkHourLEdit: TLabeledEdit
    Left = 193
    Top = 147
    Width = 421
    Height = 23
    Hint = #1050#1086#1083'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1085#1077#1076#1077#1083#1102'.'
    EditLabel.Width = 127
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeWorkHourLEdit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Text = ''
    TextHint = #1050#1086#1083'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074
    Visible = False
    OnChange = EmployeWorkHourLEditChange
  end
end
