Unit ChangeDataUnit;

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
    Vcl.Grids,
    Vcl.Buttons,
    Vcl.ExtCtrls,
    Vcl.StdCtrls;

Type
    TChangeDataForm = Class(TForm)
        ChangeButton: TButton;
        NavigationPanel: TPanel;
        EmployersButton: TSpeedButton;
        ItemsButton: TSpeedButton;
        OutputGrid: TStringGrid;
        Procedure EmployersButtonClick(Sender: TObject);
        Procedure ItemsButtonClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure OutputGridDblClick(Sender: TObject);
        Procedure OutputGridKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
        Procedure ChangeButtonClick(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Type
    TGridChoose = (Employe, Item);

Var
    ChangeDataForm: TChangeDataForm;
    GridChoosen: TGridChoose;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts,
    DeleteDataUnit, ReInputUnit;

Procedure ChangeEnabled(EmployersEnabled, ItemsEnabled: Boolean);
Begin
    ChangeDataForm.EmployersButton.AlignWithMargins := EmployersEnabled;
    ChangeDataForm.EmployersButton.AllowAllUp := EmployersEnabled;
    ChangeDataForm.ItemsButton.AlignWithMargins := ItemsEnabled;
    ChangeDataForm.ItemsButton.AllowAllUp := ItemsEnabled;
End;

Procedure TChangeDataForm.ChangeButtonClick(Sender: TObject);
Begin
    Application.CreateForm(TReInputDataForm, ReInputDataForm);
    ReInputDataForm.ShowModal;
End;

Procedure TChangeDataForm.EmployersButtonClick(Sender: TObject);
Begin
    GridChoosen := Employe;
    ChangeEnabled(True, False);
    InputEmployersInGreed(OutputGrid);
    If (OutputGrid.RowCount > 1) Then
        ChangeButton.Enabled := True
    Else
        ChangeButton.Enabled := False;
    OutputGrid.Visible := True;
End;

Procedure TChangeDataForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    OutputGrid.Visible := False;
    ChangeButton.Enabled := False;
    ChangeEnabled(False, False);
End;

Procedure TChangeDataForm.ItemsButtonClick(Sender: TObject);
Begin
    GridChoosen := Item;
    ChangeEnabled(False, True);
    InputItemsInGreed(OutputGrid);
    If (OutputGrid.RowCount > 1) Then
        ChangeButton.Enabled := True
    Else
        ChangeButton.Enabled := False;
    OutputGrid.Visible := True;
End;

Procedure TChangeDataForm.OutputGridDblClick(Sender: TObject);
Begin
    If (ChangeButton.Enabled) Then
        ChangeButton.Click;
End;

Procedure TChangeDataForm.OutputGridKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
    If (Key = VK_DELETE) Then
    Begin
        Application.CreateForm(TDeleteDataForm, DeleteDataForm);
        DeleteDataForm.ShowModal;
    End;
End;

End.
