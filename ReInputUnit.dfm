object ReInputDataForm: TReInputDataForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
  ClientHeight = 194
  ClientWidth = 572
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
  object ApplySpButton: TSpeedButton
    Left = 7
    Top = 153
    Width = 561
    Height = 33
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    OnClick = ApplySpButtonClick
  end
  object EmployeCodeLabel: TLabel
    Left = 7
    Top = 8
    Width = 134
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployeFIOLabel: TLabel
    Left = 8
    Top = 40
    Width = 96
    Height = 15
    Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployePostLabel: TLabel
    Left = 8
    Top = 98
    Width = 131
    Height = 15
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    Visible = False
  end
  object EmployeWorkHourLabel: TLabel
    Left = 8
    Top = 69
    Width = 123
    Height = 15
    Caption = #1063#1080#1089#1083#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074':'
    Visible = False
  end
  object ItemGroupLabel: TLabel
    Left = 7
    Top = 8
    Width = 133
    Height = 15
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087'. '#1080#1079#1076#1077#1083#1080#1103':'
    Visible = False
  end
  object ItemMarkLabel: TLabel
    Left = 8
    Top = 40
    Width = 86
    Height = 15
    Caption = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103':'
    Visible = False
  end
  object DateOfStartLabel: TLabel
    Left = 8
    Top = 69
    Width = 133
    Height = 15
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1105#1084#1082#1080' '#1074' '#1088#1077#1084#1086#1085#1090':'
    Visible = False
  end
  object EmployeFixedCodeLabel: TLabel
    Left = 8
    Top = 98
    Width = 126
    Height = 15
    Caption = #1050#1086#1076' '#1088#1077#1084#1086#1085#1090#1080#1088#1091#1102#1097#1077#1075#1086':'
    Visible = False
  end
  object ReadyLabel: TLabel
    Left = 8
    Top = 127
    Width = 102
    Height = 15
    Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072':'
    Visible = False
  end
  object DateOfStartPicker: TDateTimePicker
    Left = 147
    Top = 66
    Width = 421
    Height = 23
    Date = 45356.000000000000000000
    Time = 0.995833587963716100
    TabOrder = 0
    Visible = False
  end
  object ReadyCBox: TComboBox
    Left = 147
    Top = 124
    Width = 421
    Height = 23
    Hint = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1072'.'
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
    Visible = False
    Items.Strings = (
      #1042#1099#1087#1086#1083#1085#1077#1085
      #1053#1077' '#1074#1099#1087#1086#1083#1085#1077#1085)
  end
  object EmployeCodeLEdit: TLabeledEdit
    Left = 147
    Top = 5
    Width = 421
    Height = 23
    Hint = #1050#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 100
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeCodeLEdit'
    MaxLength = 9
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = ''
    TextHint = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
    OnKeyPress = EmployeCodeLEditKeyPress
  end
  object ItemGroupLEdit: TLabeledEdit
    Left = 147
    Top = 5
    Width = 421
    Height = 23
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1080#1079#1076#1077#1083#1080#1081'.'
    EditLabel.Width = 83
    EditLabel.Height = 15
    EditLabel.Caption = 'ItemGroupLEdit'
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = ''
    TextHint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1080#1079#1076#1077#1083#1080#1081
    Visible = False
  end
  object ItemMarkLEdit: TLabeledEdit
    Left = 147
    Top = 37
    Width = 421
    Height = 23
    Hint = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103'.'
    EditLabel.Width = 77
    EditLabel.Height = 15
    EditLabel.Caption = 'ItemMarkLEdit'
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = ''
    TextHint = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103
    Visible = False
  end
  object EmployeFIOLEdit: TLabeledEdit
    Left = 147
    Top = 37
    Width = 421
    Height = 23
    Hint = #1060#1048#1054' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 90
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeFIOLEdit'
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = ''
    TextHint = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
  end
  object EmployePostLEdit: TLabeledEdit
    Left = 147
    Top = 66
    Width = 421
    Height = 23
    Hint = #1047#1072#1085#1080#1084#1072#1077#1084#1072#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 95
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployePostLEdit'
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = ''
    TextHint = #1047#1072#1085#1080#1084#1072#1077#1084#1072#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
    Visible = False
  end
  object EmployeFixedCodeLEdit: TLabeledEdit
    Left = 147
    Top = 95
    Width = 421
    Height = 23
    Hint = #1050#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
    EditLabel.Width = 128
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeFixedCodeLEdit'
    MaxLength = 9
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = ''
    TextHint = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Visible = False
    OnKeyPress = EmployeFixedCodeLEditKeyPress
  end
  object EmployeWorkHourLEdit: TLabeledEdit
    Left = 147
    Top = 95
    Width = 421
    Height = 23
    Hint = #1050#1086#1083'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1085#1077#1076#1077#1083#1102'.'
    EditLabel.Width = 127
    EditLabel.Height = 15
    EditLabel.Caption = 'EmployeWorkHourLEdit'
    MaxLength = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = ''
    TextHint = #1050#1086#1083'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1095#1072#1089#1086#1074
    Visible = False
    OnKeyPress = EmployeWorkHourLEditKeyPress
  end
end
