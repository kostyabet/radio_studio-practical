object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1076#1080#1086#1072#1090#1077#1083#1100#1077
  ClientHeight = 330
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 330
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 253
    ExplicitHeight = 318
    object ViewListsSpButton: TSpeedButton
      Left = 1
      Top = 1
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1087#1080#1089#1082#1086#1074
      OnClick = ViewListsSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 257
    end
    object SearchDataSpButton: TSpeedButton
      Left = 1
      Top = 42
      Width = 255
      Height = 42
      Align = alTop
      Caption = #1055#1086#1080#1089#1082
      OnClick = SearchDataSpButtonClick
      ExplicitLeft = 2
      ExplicitTop = 36
    end
    object AddDataSpButton: TSpeedButton
      Left = 1
      Top = 84
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      OnClick = AddDataSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 80
      ExplicitWidth = 257
    end
    object DeleteDataSpButton: TSpeedButton
      Left = 1
      Top = 125
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      OnClick = DeleteDataSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 120
      ExplicitWidth = 257
    end
    object ChangeDataSpButton: TSpeedButton
      Left = 1
      Top = 166
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      OnClick = ChangeDataSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 160
      ExplicitWidth = 257
    end
    object ReadinessOrdersSpButton: TSpeedButton
      Left = 1
      Top = 207
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1074#1089#1077#1093' '#1079#1072#1082#1072#1079#1086#1074
      OnClick = ReadinessOrdersSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 200
      ExplicitWidth = 257
    end
    object ExitSpButton: TSpeedButton
      Left = 1
      Top = 289
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1042#1099#1093#1086#1076
      OnClick = ExitSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 280
      ExplicitWidth = 257
    end
    object EmployeeInfoSpButton: TSpeedButton
      Left = 1
      Top = 248
      Width = 255
      Height = 41
      Align = alTop
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1099#1084' '#1079#1072#1082#1072#1079#1072#1084
      OnClick = EmployeeInfoSpButtonClick
      ExplicitLeft = 0
      ExplicitTop = 240
      ExplicitWidth = 257
    end
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 16
    object FileMMButton: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenLists: TMenuItem
        Caption = #1042#1074#1086#1076' '#1089#1087#1080#1089#1082#1086#1074
        ShortCut = 16463
        OnClick = OpenListsClick
      end
      object SaveLists: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1086#1074
        Enabled = False
        ShortCut = 16467
        OnClick = SaveListsClick
      end
      object Line: TMenuItem
        Caption = '-'
      end
      object ExitMMButton: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 16465
        OnClick = ExitMMButtonClick
      end
    end
    object InstractionMMButton: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = InstractionMMButtonClick
    end
    object AboutEditorMMButton: TMenuItem
      Caption = #1054' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1082#1077
      OnClick = AboutEditorMMButtonClick
    end
  end
  object MainImgList: TImageList
    Left = 8
    Top = 72
  end
  object MMImgList: TImageList
    Left = 8
    Top = 136
  end
end
