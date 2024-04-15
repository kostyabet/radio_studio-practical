Program RadioStudio;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  EquipmentReceipts in 'EquipmentReceipts.pas',
  Vcl.Themes,
  Vcl.Styles,
  ViewListUnit in 'ViewListUnit.pas' {ViewListForm},
  SearchDataUnit in 'SearchDataUnit.pas' {SearchDataForm},
  AddDataUnit in 'AddDataUnit.pas' {AddDataForm},
  DeleteDataUnit in 'DeleteDataUnit.pas' {DeleteDataForm},
  ChangeDataUnit in 'ChangeDataUnit.pas' {ChangeDataForm},
  ReadinessOrdersUnit in 'ReadinessOrdersUnit.pas' {ReadinessOrdersForm},
  EmployeeInfoUnit in 'EmployeeInfoUnit.pas' {EmployeeInfoForm},
  ReInputUnit in 'ReInputUnit.pas' {ReInputDataForm};

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    TStyleManager.TrySetStyle('Silver');
    Application.CreateForm(TMainForm, MainForm);
  Application.Run;

End.
