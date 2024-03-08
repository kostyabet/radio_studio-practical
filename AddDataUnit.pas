Unit AddDataUnit;

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
    Vcl.Grids,
    Vcl.Dialogs,
    Vcl.StdCtrls,
    Vcl.Buttons,
    Vcl.ExtCtrls,
    Vcl.ComCtrls,
    Vcl.Mask;

Type
    TAddDataForm = Class(TForm)
        SwitchPanel: TPanel;
        AddEmployerButton: TSpeedButton;
        AddItemButton: TSpeedButton;
        EmployeCodeLabel: TLabel;
        EmployeFIOLabel: TLabel;
        EmployePostLabel: TLabel;
        EmployeWorkHourLabel: TLabel;
        AddButton: TSpeedButton;
        ItemGroupLabel: TLabel;
        ItemMarkLabel: TLabel;
        DateOfStartLabel: TLabel;
        DateOfStartPicker: TDateTimePicker;
        EmployeFixedCodeLabel: TLabel;
        ReadyLabel: TLabel;
        ReadyCBox: TComboBox;
        EmployeCodeLEdit: TLabeledEdit;
        ItemGroupLEdit: TLabeledEdit;
        ItemMarkLEdit: TLabeledEdit;
        EmployeFIOLEdit: TLabeledEdit;
        EmployePostLEdit: TLabeledEdit;
        EmployeFixedCodeLEdit: TLabeledEdit;
        EmployeWorkHourLEdit: TLabeledEdit;
        Procedure AddEmployerButtonClick(Sender: TObject);
        Procedure AddItemButtonClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure ItemGroupLabeledEditChange(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure EmployeCodeLEditChange(Sender: TObject);
        Procedure EmployeFIOLEditChange(Sender: TObject);
        Procedure EmployeFixedCodeLEditChange(Sender: TObject);
        Procedure EmployePostLEditChange(Sender: TObject);
        Procedure EmployeWorkHourLEditChange(Sender: TObject);
        Procedure ItemGroupLEditChange(Sender: TObject);
        Procedure ItemMarkLEditChange(Sender: TObject);
        Procedure AddButtonClick(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Type
    TInputChoose = (Employe, Item);

Var
    AddDataForm: TAddDataForm;
    VarientOfInput: TInputChoose;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts;

Procedure ClearEdits();
Begin
    AddDataForm.EmployeCodeLEdit.Text := '';
    AddDataForm.EmployeFIOLEdit.Text := '';
    AddDataForm.EmployePostLEdit.Text := '';
    AddDataForm.EmployeWorkHourLEdit.Text := '';
    AddDataForm.ItemGroupLEdit.Text := '';
    AddDataForm.ItemMarkLEdit.Text := '';
    AddDataForm.EmployeFixedCodeLEdit.Text := '';
End;

Function IsCorrectCheckItemInput(Group, Mark, FixedCode: TLabeledEdit; Ready: TComboBox): Boolean;
Var
    TempStr: String;
    IsCorrect: Boolean;
Begin
    Try
        TempStr := Group.Text;
        TempStr := Trim(TempStr);
        IsCorrect := TempStr <> '';

        TempStr := Mark.Text;
        TempStr := Trim(TempStr);
        IsCorrect := IsCorrect And (TempStr <> '');

        TempStr := FixedCode.Text;
        StrToInt(TempStr);
        TempStr := Trim(TempStr);
        IsCorrect := IsCorrect And (TempStr <> '');

        IsCorrect := IsCorrect And Not(Ready.ItemIndex = -1);
    Except
        IsCorrect := False;
    End;

    IsCorrectCheckItemInput := IsCorrect;
End;

Procedure CheckItemInput(Group, Mark, FixedCode: TLabeledEdit; Ready: TComboBox);
Begin
    AddDataForm.AddButton.Enabled := IsCorrectCheckItemInput(Group, Mark, FixedCode, Ready);
End;

Function IsCorrectCheckEmployeInput(CodeEdit, FIOEdit, PostEdit, WorkHourEdit: TLabeledEdit): Boolean;
Var
    TempStr: String;
    IsCorrect: Boolean;
Begin
    Try
        TempStr := CodeEdit.Text;
        TempStr := Trim(TempStr);
        StrToInt(TempStr);
        IsCorrect := TempStr <> '';

        TempStr := FIOEdit.Text;
        TempStr := Trim(TempStr);
        IsCorrect := IsCorrect And (TempStr <> '');

        TempStr := PostEdit.Text;
        TempStr := Trim(TempStr);
        IsCorrect := IsCorrect And (TempStr <> '');

        TempStr := WorkHourEdit.Text;
        TempStr := Trim(TempStr);
        StrToInt(TempStr);
        IsCorrect := IsCorrect And (TempStr <> '');
    Except
        IsCorrect := False;
    End;

    IsCorrectCheckEmployeInput := IsCorrect;
End;

Procedure CheckEmployeInput(EmployeCodeEdit, EmployeFIOEdit, EmployePostEdit, EmployeWorkHourEdit: TLabeledEdit);
Begin
    AddDataForm.AddButton.Enabled := IsCorrectCheckEmployeInput(EmployeCodeEdit, EmployeFIOEdit, EmployePostEdit, EmployeWorkHourEdit);
End;

Procedure CheckChanges();
Begin
    Case VarientOfInput Of
        Employe:
            CheckEmployeInput(AddDataForm.EmployeCodeLEdit, AddDataForm.EmployeFIOLEdit, AddDataForm.EmployePostLEdit,
                AddDataForm.EmployeWorkHourLEdit);
        Item:
            CheckItemInput(AddDataForm.ItemGroupLEdit, AddDataForm.ItemMarkLEdit, AddDataForm.EmployeFixedCodeLEdit, AddDataForm.ReadyCBox);
    End;
End;

Procedure VisibilityDistributor(AddEmployerStatus, AddItemStatus: Boolean);
Begin
    AddDataForm.AddEmployerButton.AlignWithMargins := AddEmployerStatus;
    AddDataForm.AddEmployerButton.AllowAllUp := AddEmployerStatus;
    AddDataForm.AddItemButton.AlignWithMargins := AddItemStatus;
    AddDataForm.AddItemButton.AllowAllUp := AddItemStatus;

    AddDataForm.EmployeCodeLabel.Visible := AddEmployerStatus;
    AddDataForm.EmployeCodeLEdit.Visible := AddEmployerStatus;
    AddDataForm.EmployeFIOLabel.Visible := AddEmployerStatus;
    AddDataForm.EmployeFIOLEdit.Visible := AddEmployerStatus;
    AddDataForm.EmployePostLabel.Visible := AddEmployerStatus;
    AddDataForm.EmployePostLEdit.Visible := AddEmployerStatus;
    AddDataForm.EmployeWorkHourLEdit.Visible := AddEmployerStatus;
    AddDataForm.EmployeWorkHourLabel.Visible := AddEmployerStatus;

    AddDataForm.ItemGroupLEdit.Visible := AddItemStatus;
    AddDataForm.ItemGroupLabel.Visible := AddItemStatus;
    AddDataForm.ItemMarkLEdit.Visible := AddItemStatus;
    AddDataForm.ItemMarkLabel.Visible := AddItemStatus;
    AddDataForm.DateOfStartPicker.Visible := AddItemStatus;
    AddDataForm.DateOfStartLabel.Visible := AddItemStatus;
    AddDataForm.EmployeFixedCodeLabel.Visible := AddItemStatus;
    AddDataForm.EmployeFixedCodeLEdit.Visible := AddItemStatus;
    AddDataForm.ReadyCBox.Visible := AddItemStatus;
    AddDataForm.ReadyLabel.Visible := AddItemStatus;
End;

Procedure TAddDataForm.AddButtonClick(Sender: TObject);
Begin
    Case VarientOfInput Of
        Employe:
            EmployeInput(StrToInt(EmployeCodeLEdit.Text), ShortString(EmployeFIOLEdit.Text), ShortString(EmployePostLEdit.Text),
                StrToInt(EmployeWorkHourLEdit.Text));
        Item:
            ItemInput(ItemGroupLEdit.Text, ItemMarkLEdit.Text, DateOfStartPicker.Date, StrToInt(EmployeFixedCodeLEdit.Text),
                ReadyCBox.ItemIndex = 0);
    End;
    ClearEdits();
    CheckChanges();
End;

Procedure TAddDataForm.AddEmployerButtonClick(Sender: TObject);
Begin
    VisibilityDistributor(True, False);
    AddButton.Visible := True;
    AddButton.Caption := AddEmployerButton.Caption;
    VarientOfInput := Employe;
    CheckChanges();
End;

Procedure TAddDataForm.AddItemButtonClick(Sender: TObject);
Begin
    VisibilityDistributor(False, True);
    AddButton.Visible := True;
    AddButton.Caption := AddItemButton.Caption;
    VarientOfInput := Item;
    CheckChanges();
End;

Procedure TAddDataForm.EmployeCodeLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.EmployeFIOLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.EmployeFixedCodeLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.EmployePostLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.EmployeWorkHourLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    VisibilityDistributor(False, False);
    AddButton.Visible := False;
End;

Procedure TAddDataForm.FormCreate(Sender: TObject);
Begin
    ClearEdits();
    EmployeFixedCodeLEdit.EditLabel.Caption := '';
    ItemMarkLEdit.EditLabel.Caption := '';
    ItemGroupLEdit.EditLabel.Caption := '';
    EmployeWorkHourLEdit.EditLabel.Caption := '';
    EmployePostLEdit.EditLabel.Caption := '';
    EmployeCodeLEdit.EditLabel.Caption := '';
    EmployeFIOLEdit.EditLabel.Caption := '';
End;

Procedure TAddDataForm.ItemGroupLabeledEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.ItemGroupLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

Procedure TAddDataForm.ItemMarkLEditChange(Sender: TObject);
Begin
    CheckChanges();
End;

End.
