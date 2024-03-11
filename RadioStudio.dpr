Program RadioStudio;

Uses
    Vcl.Forms,
    MainFormUnit In 'MainFormUnit.pas' {MainForm} ,
    EquipmentReceipts In 'EquipmentReceipts.pas',
    Vcl.Themes,
    Vcl.Styles,
    ViewListUnit In 'ViewListUnit.pas' {ViewListForm} ,
    SearchDataUnit In 'SearchDataUnit.pas' {SearchDataForm} ,
    AddDataUnit In 'AddDataUnit.pas' {AddDataForm} ,
    DeleteDataUnit In 'DeleteDataUnit.pas' {DeleteDataForm} ,
    ChangeDataUnit In 'ChangeDataUnit.pas' {ChangeDataForm} ,
    ReadinessOrdersUnit In 'ReadinessOrdersUnit.pas' {ReadinessOrdersForm} ,
    EmployeeInfoUnit In 'EmployeeInfoUnit.pas' {EmployeeInfoForm} ,
    FrontendUnit In 'FrontendUnit.pas',
    BackendUnit In 'BackendUnit.pas',
    ReInputUnit In 'ReInputUnit.pas' {ReInputDataForm};

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    TStyleManager.TrySetStyle('Silver');
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;

End.
