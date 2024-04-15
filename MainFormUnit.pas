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
    Vcl.ImgList,
    Vcl.StdCtrls;

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
        Line: TMenuItem;
        OpenLists: TMenuItem;
        SaveLists: TMenuItem;
        Procedure ViewListsSpButtonClick(Sender: TObject);
        Procedure SearchDataSpButtonClick(Sender: TObject);
        Procedure AddDataSpButtonClick(Sender: TObject);
        Procedure DeleteDataSpButtonClick(Sender: TObject);
        Procedure ChangeDataSpButtonClick(Sender: TObject);
        Procedure ReadinessOrdersSpButtonClick(Sender: TObject);
        Procedure EmployeeInfoSpButtonClick(Sender: TObject);
        Procedure ExitSpButtonClick(Sender: TObject);
        Procedure ExitMMButtonClick(Sender: TObject);
        Procedure FormDestroy(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure SaveListsClick(Sender: TObject);
        Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
        Procedure OpenListsClick(Sender: TObject);
        Procedure AboutEditorMMButtonClick(Sender: TObject);
        Procedure InstractionMMButtonClick(Sender: TObject);
    Private
        Procedure CreateModalForm(CaptionText, LabelText: String; ModalWidth, ModalHeight: Integer);
        Procedure WMGetMinMaxInfo(Var Msg: TWMGetMinMaxInfo);
    Public
        Procedure ErrorExit(ErrorStr, Caption: String);
    End;

Var
    MainForm: TMainForm;
    IfDataSavedInFile: Boolean = False;
    IsDataExist: Boolean = False;

Implementation

{$R *.dfm}

Uses
    ViewListUnit,
    SearchDataUnit,
    AddDataUnit,
    DeleteDataUnit,
    ChangeDataUnit,
    ReadinessOrdersUnit,
    EmployeeInfoUnit,
    EquipmentReceipts,
    BackendUnit;

Procedure TMainForm.CreateModalForm(CaptionText, LabelText: String; ModalWidth, ModalHeight: Integer);
Const
    LEFT_MARGIN: Integer = 10;
    TOP_MARGIN: Integer = 5;
Var
    ModalForm: TForm;
    ModalLabel: TLAbel;
Begin
    ModalForm := TForm.Create(Nil);
    Try
        ModalForm.Caption := CaptionText;
        ModalForm.Width := ModalWidth;
        ModalForm.Height := ModalHeight;
        ModalForm.Position := PoScreenCenter;
        ModalForm.BorderStyle := BsSingle;
        ModalForm.BorderIcons := [BiSystemMenu];
        ModalForm.FormStyle := FsStayOnTop;
        ModalForm.Icon := MainForm.Icon;
        ModalLabel := TLabel.Create(ModalForm);
        ModalLabel.Parent := ModalForm;
        ModalLabel.Caption := LabelText;
        ModalLabel.Left := LEFT_MARGIN;
        ModalLabel.Top := TOP_MARGIN;
        ModalForm.ShowModal;
    Finally
        ModalForm.Free;
    End;
End;

Procedure TMainForm.AboutEditorMMButtonClick(Sender: TObject);
Begin
    CreateModalForm('О разработчике', 'Выполнил студент группы 351005 Бетеня Константин.', Screen.Width * 22 Div 100,
        Screen.Height * 8 Div 100);
End;

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

Procedure TMainForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var
    ResultKey: Integer;
Begin
    ResultKey := Application.Messagebox('Вы уверены, что хотите закрыть оконное приложение?', 'Выход',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);

    If ResultKey = ID_NO Then
        CanClose := False;

    If (ResultKey = ID_YES) And Not IfDataSavedInFile And IsDataExist Then
    Begin
        ResultKey := Application.Messagebox('Вы не сохранили результат. Хотите сделать это?', 'Сохранение',
            MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);

        If ResultKey = ID_YES Then
        Begin
            SaveEmployersInFile;
            SaveItemsInFile;
        End;
    End;
End;

Procedure TMainForm.FormCreate(Sender: TObject);
Begin
    CreateLists;
End;

Procedure TMainForm.FormDestroy(Sender: TObject);
Begin
    DestroyLists;
End;

Procedure TMainForm.InstractionMMButtonClick(Sender: TObject);
Begin
    CreateModalForm('О разработчике', 'Выполнил студент группы 351005 Бетеня Константин.', Screen.Width * 22 Div 100,
        Screen.Height * 8 Div 100);
End;

Procedure TMainForm.OpenListsClick(Sender: TObject);
Var
    ResultKey: Integer;
Begin
    ResultKey := Application.Messagebox('Вы уверены, что хотите открыть записи?', 'Выход', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
    If ResultKey = ID_YES Then
    Begin
        IsDataExist := False;
        SaveLists.Enabled := False;
        DestroyLists;
        CreateLists;
        LoadEmployersFromFile();
        LoadItemsFromFile();
    End;
End;

Procedure TMainForm.ErrorExit(ErrorStr, Caption: String);
Begin
    Application.Messagebox(PWideChar(ErrorStr), PWideChar(Caption), MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
End;

Procedure TMainForm.SaveListsClick(Sender: TObject);
Var
    ResultKey: Integer;
Begin
    ResultKey := Application.Messagebox('Вы уверены, что хотите сохранить записи?', 'Выход', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
    If ResultKey = ID_YES Then
    Begin
        IsDataExist := False;
        SaveLists.Enabled := False;
        SaveEmployersInFile;
        SaveItemsInFile;
    End;
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

Procedure TMainForm.WMGetMinMaxInfo(Var Msg: TWMGetMinMaxInfo);
Begin
    Msg.MinMaxInfo.PtMaxSize.X := Width;
    Msg.MinMaxInfo.PtMaxSize.Y := Height;
    Msg.MinMaxInfo.PtMaxTrackSize.X := Width;
    Msg.MinMaxInfo.PtMaxTrackSize.Y := Height;

    Left := (Screen.Width - Width) Div 2;
    Top := (Screen.Height - Height) Div 2;
End;

End.
