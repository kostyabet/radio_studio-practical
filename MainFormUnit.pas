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
        Panel1: TPanel;
        MainImgList: TImageList;
        ExitMMButton: TMenuItem;
    MMImgList: TImageList;
        Procedure ViewListsSpButtonClick(Sender: TObject);
        Procedure SearchDataSpButtonClick(Sender: TObject);
        Procedure AddDataSpButtonClick(Sender: TObject);
        Procedure DeleteDataSpButtonClick(Sender: TObject);
        Procedure ChangeDataSpButtonClick(Sender: TObject);
        Procedure ReadinessOrdersSpButtonClick(Sender: TObject);
    procedure EmployeeInfoSpButtonClick(Sender: TObject);
    procedure ExitSpButtonClick(Sender: TObject);
    procedure ExitMMButtonClick(Sender: TObject);
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
    ReadinessOrdersUnit, EmployeeInfoUnit;

Procedure TMainForm.AddDataSpButtonClick(Sender: TObject);
Begin
    AddDataForm.ShowModal;
End;

Procedure TMainForm.ChangeDataSpButtonClick(Sender: TObject);
Begin
    ChangeDataForm.ShowModal;
End;

Procedure TMainForm.DeleteDataSpButtonClick(Sender: TObject);
Begin
    DeleteDataForm.ShowModal;
End;

procedure TMainForm.EmployeeInfoSpButtonClick(Sender: TObject);
begin
    EmployeeInfoForm.ShowModal;
end;

procedure TMainForm.ExitMMButtonClick(Sender: TObject);
begin
    MainForm.Close;
end;

procedure TMainForm.ExitSpButtonClick(Sender: TObject);
begin
    MainForm.Close;
end;

Procedure TMainForm.ReadinessOrdersSpButtonClick(Sender: TObject);
Begin
    ReadinessOrdersForm.ShowModal;
End;

Procedure TMainForm.SearchDataSpButtonClick(Sender: TObject);
Begin
    SearchDataForm.ShowModal;
End;

Procedure TMainForm.ViewListsSpButtonClick(Sender: TObject);
Begin
    ViewListForm.ShowModal;
End;

End.
