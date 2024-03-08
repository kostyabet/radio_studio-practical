program RadioStudio;

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
  FrontendUnit in 'FrontendUnit.pas',
  BackendUnit in 'BackendUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TViewListForm, ViewListForm);
  Application.CreateForm(TSearchDataForm, SearchDataForm);
  Application.CreateForm(TAddDataForm, AddDataForm);
  Application.CreateForm(TDeleteDataForm, DeleteDataForm);
  Application.CreateForm(TChangeDataForm, ChangeDataForm);
  Application.CreateForm(TReadinessOrdersForm, ReadinessOrdersForm);
  Application.CreateForm(TEmployeeInfoForm, EmployeeInfoForm);
  Application.Run;
end.
