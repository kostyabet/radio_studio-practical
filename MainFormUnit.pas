Unit MainFormUnit;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.WinXCalendars,
    Vcl.ComCtrls,
    Vcl.Menus,
    Vcl.Buttons,
    Vcl.ExtCtrls,
    System.ImageList,
    Vcl.ImgList;

Type
    TMainForm = Class(TForm)
        MainMenu: TMainMenu;
        FileMMButton: TMenuItem;
        InstractionMMButton: TMenuItem;
        AboutEditorMMButton: TMenuItem;
        ViewListsSpButton: TSpeedButton;
        SearchDataSpButton: TSpeedButton;
        AddDataSpButton: TSpeedButton;
        DeleteDataSpButton: TSpeedButton;
        ChangeDataSpButton: TSpeedButton;
        ExitSpButton: TSpeedButton;
        ReadinessOrdersSpButton: TSpeedButton;
        EmployeeInfoSpButton: TSpeedButton;
    MainPanel: TPanel;
        MainImgList: TImageList;
        ExitMMButton: TMenuItem;
        MMImgList: TImageList;
        Procedure ViewListsSpButtonClick(Sender: TObject);
        Procedure SearchDataSpButtonClick(Sender: TObject);
        Procedure AddDataSpButtonClick(Sender: TObject);
        Procedure DeleteDataSpButtonClick(Sender: TObject);
        Procedure ChangeDataSpButtonClick(Sender: TObject);
        Procedure ReadinessOrdersSpButtonClick(Sender: TObject);
        Procedure EmployeeInfoSpButtonClick(Sender: TObject);
        Procedure ExitSpButtonClick(Sender: TObject);
        Procedure ExitMMButtonClick(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    MainForm: TMainForm;

Implementation

{$R *.dfm}

Uses
    ViewListUnit,
    SearchDataUnit,
    AddDataUnit,
    DeleteDataUnit,
    ChangeDataUnit,
    ReadinessOrdersUnit,
    EmployeeInfoUnit;

Procedure TMainForm.AddDataSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TAddDataForm, AddDataForm);
    AddDataForm.ShowModal;
End;

Procedure TMainForm.ChangeDataSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TChangeDataForm, ChangeDataForm);
    ChangeDataForm.ShowModal;
End;

Procedure TMainForm.DeleteDataSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TDeleteDataForm, DeleteDataForm);
    DeleteDataForm.ShowModal;
End;

Procedure TMainForm.EmployeeInfoSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TEmployeeInfoForm, EmployeeInfoForm);
    EmployeeInfoForm.ShowModal;
End;

Procedure TMainForm.ExitMMButtonClick(Sender: TObject);
Begin
    MainForm.Close;
End;

Procedure TMainForm.ExitSpButtonClick(Sender: TObject);
Begin
    MainForm.Close;
End;

Procedure TMainForm.ReadinessOrdersSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TReadinessOrdersForm, ReadinessOrdersForm);
    ReadinessOrdersForm.ShowModal;
End;

Procedure TMainForm.SearchDataSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TSearchDataForm, SearchDataForm);
    SearchDataForm.ShowModal;
End;

Procedure TMainForm.ViewListsSpButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TViewListForm, ViewListForm);
    ViewListForm.ShowModal;
End;

End.
