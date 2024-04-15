object EmployeeInfoForm: TEmployeeInfoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1093
  ClientHeight = 327
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object ChooseEmloyeLabel: TLabel
    Left = 8
    Top = 11
    Width = 89
    Height = 15
    Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1076' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1082#1086#1090#1086#1088#1086#1084' '#1093#1086#1090#1080#1090#1077' '#1087#1086#1083#1091#1095#1080#1090#1100'.'
    Caption = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
    ParentShowHint = False
    ShowHint = True
  end
  object DateFromLabel: TLabel
    Left = 391
    Top = 12
    Width = 6
    Height = 15
    Caption = 'c'
  end
  object DateToLabel: TLabel
    Left = 496
    Top = 12
    Width = 13
    Height = 15
    Caption = #1076#1086
  end
  object Label1: TLabel
    Left = 335
    Top = 11
    Width = 50
    Height = 15
    Caption = #1042' '#1087#1077#1088#1080#1086#1076
  end
  object EmployersCodesCBox: TComboBox
    Left = 103
    Top = 8
    Width = 162
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = EmployersCodesCBoxChange
  end
  object ToDTPicker: TDateTimePicker
    Left = 517
    Top = 8
    Width = 84
    Height = 23
    Date = 45393.000000000000000000
    Time = 0.800548449071357000
    TabOrder = 1
    OnChange = ToDTPickerChange
  end
  object FromDTPicker: TDateTimePicker
    Left = 405
    Top = 8
    Width = 84
    Height = 23
    Date = 45393.000000000000000000
    Time = 0.800548449071357000
    TabOrder = 2
    OnChange = FromDTPickerChange
  end
  object OutputGrid: TStringGrid
    Left = 8
    Top = 37
    Width = 620
    Height = 276
    BiDiMode = bdLeftToRight
    DefaultColWidth = 118
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
  end
end
