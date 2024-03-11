Unit DeleteDataUnit;

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
    Vcl.StdCtrls,
    Vcl.Grids,
    Vcl.Buttons,
    Vcl.ExtCtrls;

Type
    TDeleteDataForm = Class(TForm)
        NavigationPanel: TPanel;
        EmployersButton: TSpeedButton;
        ItemsButton: TSpeedButton;
        OutputGrid: TStringGrid;
        DeleteButton: TButton;
        Procedure EmployersButtonClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure ItemsButtonClick(Sender: TObject);
        Procedure DeleteButtonClick(Sender: TObject);
        Procedure OutputGridDblClick(Sender: TObject);
        Procedure FormKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Type
    TGridChoose = (Employe, Item);

Var
    DeleteDataForm: TDeleteDataForm;
    GridChoosen: TGridChoose;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts;

Procedure ChangeEnabled(EmployersEnabled, ItemsEnabled: Boolean);
Begin
    DeleteDataForm.EmployersButton.AlignWithMargins := EmployersEnabled;
    DeleteDataForm.EmployersButton.AllowAllUp := EmployersEnabled;
    DeleteDataForm.ItemsButton.AlignWithMargins := ItemsEnabled;
    DeleteDataForm.ItemsButton.AllowAllUp := ItemsEnabled;
End;

Procedure TDeleteDataForm.DeleteButtonClick(Sender: TObject);
Begin
    Case GridChoosen Of
        Employe:
            Begin
                DeleteEmployerFromGreed(OutputGrid.Row);
                EmployersButton.Click;
            End;
        Item:
            Begin
                DeleteItemFromGreed(OutputGrid.Row);
                ItemsButton.Click;
            End;
    End;
End;

Procedure TDeleteDataForm.EmployersButtonClick(Sender: TObject);
Begin
    GridChoosen := Employe;
    ChangeEnabled(True, False);
    InputEmployersInGreed(OutputGrid);
    If (OutputGrid.RowCount > 1) Then
        DeleteButton.Enabled := True
    Else
        DeleteButton.Enabled := False;
    OutputGrid.Visible := True;
End;

Procedure TDeleteDataForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    OutputGrid.Visible := False;
    DeleteButton.Enabled := False;
    ChangeEnabled(False, False);
End;

Procedure TDeleteDataForm.FormKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
    If (Key = VK_DELETE) And (DeleteButton.Enabled) Then
        DeleteButton.Click;
End;

Procedure TDeleteDataForm.ItemsButtonClick(Sender: TObject);
Begin
    GridChoosen := Item;
    ChangeEnabled(False, True);
    InputItemsInGreed(OutputGrid);
    If (OutputGrid.RowCount > 1) Then
        DeleteButton.Enabled := True
    Else
        DeleteButton.Enabled := False;
    OutputGrid.Visible := True;
End;

Procedure TDeleteDataForm.OutputGridDblClick(Sender: TObject);
Begin
    If (DeleteButton.Enabled) Then
        DeleteButton.Click;
End;

End.
