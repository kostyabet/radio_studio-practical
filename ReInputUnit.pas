Unit ReInputUnit;

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
    Vcl.Buttons,
    Vcl.StdCtrls,
    Vcl.Mask,
    Vcl.ExtCtrls,
    Vcl.ComCtrls;

Type
    TReInputDataForm = Class(TForm)
        ApplySpButton: TSpeedButton;
        EmployeCodeLabel: TLabel;
        EmployeFIOLabel: TLabel;
        EmployePostLabel: TLabel;
        EmployeWorkHourLabel: TLabel;
        ItemGroupLabel: TLabel;
        ItemMarkLabel: TLabel;
        DateOfStartLabel: TLabel;
        EmployeFixedCodeLabel: TLabel;
        ReadyLabel: TLabel;
        DateOfStartPicker: TDateTimePicker;
        ReadyCBox: TComboBox;
        EmployeCodeLEdit: TLabeledEdit;
        ItemGroupLEdit: TLabeledEdit;
        ItemMarkLEdit: TLabeledEdit;
        EmployeFIOLEdit: TLabeledEdit;
        EmployePostLEdit: TLabeledEdit;
        EmployeFixedCodeLEdit: TLabeledEdit;
        EmployeWorkHourLEdit: TLabeledEdit;
        Procedure FormCreate(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure ApplySpButtonClick(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    ReInputDataForm: TReInputDataForm;

Implementation

{$R *.dfm}

Uses
    ChangeDataUnit,
    EquipmentReceipts;

Procedure VisibilityDistributor(AddEmployerStatus, AddItemStatus: Boolean);
Begin
    ReInputDataForm.EmployeCodeLabel.Visible := AddEmployerStatus;
    ReInputDataForm.EmployeCodeLEdit.Visible := AddEmployerStatus;
    ReInputDataForm.EmployeFIOLabel.Visible := AddEmployerStatus;
    ReInputDataForm.EmployeFIOLEdit.Visible := AddEmployerStatus;
    ReInputDataForm.EmployePostLabel.Visible := AddEmployerStatus;
    ReInputDataForm.EmployePostLEdit.Visible := AddEmployerStatus;
    ReInputDataForm.EmployeWorkHourLEdit.Visible := AddEmployerStatus;
    ReInputDataForm.EmployeWorkHourLabel.Visible := AddEmployerStatus;

    ReInputDataForm.ItemGroupLEdit.Visible := AddItemStatus;
    ReInputDataForm.ItemGroupLabel.Visible := AddItemStatus;
    ReInputDataForm.ItemMarkLEdit.Visible := AddItemStatus;
    ReInputDataForm.ItemMarkLabel.Visible := AddItemStatus;
    ReInputDataForm.DateOfStartPicker.Visible := AddItemStatus;
    ReInputDataForm.DateOfStartLabel.Visible := AddItemStatus;
    ReInputDataForm.EmployeFixedCodeLabel.Visible := AddItemStatus;
    ReInputDataForm.EmployeFixedCodeLEdit.Visible := AddItemStatus;
    ReInputDataForm.ReadyCBox.Visible := AddItemStatus;
    ReInputDataForm.ReadyLabel.Visible := AddItemStatus;
End;

Procedure TReInputDataForm.ApplySpButtonClick(Sender: TObject);
Begin
    Case GridChoosen Of
        Employe:
            Begin
                InputNewInfoAboutEmploye(ChangeDataForm.OutputGrid.Row, StrToInt(EmployeCodeLEdit.Text), ShortString(EmployeFIOLEdit.Text),
                    ShortString(EmployePostLEdit.Text), StrToInt(EmployeWorkHourLEdit.Text));
                ChangeDataForm.EmployersButtonClick(Sender);
            End;
        Item:
            Begin
                InputNewInfoAboutItem(ChangeDataForm.OutputGrid.Row, ItemGroupLEdit.Text, ItemMarkLEdit.Text, DateOfStartPicker.Date,
                    StrToInt(EmployeFixedCodeLEdit.Text), ReadyCBox.ItemIndex = 0);
                ChangeDataForm.ItemsButtonClick(Sender);
            End;
    End;
    ReInputDataForm.Close;
End;

Procedure TReInputDataForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    VisibilityDistributor(False, False);
    ApplySpButton.Enabled := False;
End;

Procedure TReInputDataForm.FormCreate(Sender: TObject);
Begin
    EmployeFixedCodeLEdit.EditLabel.Caption := '';
    ItemMarkLEdit.EditLabel.Caption := '';
    ItemGroupLEdit.EditLabel.Caption := '';
    EmployeWorkHourLEdit.EditLabel.Caption := '';
    EmployePostLEdit.EditLabel.Caption := '';
    EmployeCodeLEdit.EditLabel.Caption := '';
    EmployeFIOLEdit.EditLabel.Caption := '';
    Case GridChoosen Of
        Employe:
            Begin
                VisibilityDistributor(True, False);
                OutputInfoAboutEmploye(ChangeDataForm.OutputGrid.Row, EmployeCodeLEdit, EmployeFIOLEdit, EmployePostLEdit,
                    EmployeWorkHourLEdit);
            End;
        Item:
            Begin
                VisibilityDistributor(False, True);
                OutputInfoAboutItem(ChangeDataForm.OutputGrid.Row, DateOfStartPicker, ItemGroupLEdit, ItemMarkLEdit, EmployeFixedCodeLEdit,
                    ReadyCBox);
            End;
    End;
End;

End.
