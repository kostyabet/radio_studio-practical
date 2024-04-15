object ReadinessOrdersForm: TReadinessOrdersForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 291
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object OutputGrid: TStringGrid
    Left = 8
    Top = 8
    Width = 620
    Height = 276
    BiDiMode = bdLeftToRight
    DefaultColWidth = 118
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
  end
end
