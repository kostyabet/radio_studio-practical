Unit ViewListUnit;

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
    Vcl.ExtCtrls,
    Vcl.Buttons,
    Vcl.Grids;

Type
    TViewListForm = Class(TForm)
        NavigationPanel: TPanel;
        EmployersButton: TSpeedButton;
        ItemsButton: TSpeedButton;
        OutputGrid: TStringGrid;
        Procedure EmployersButtonClick(Sender: TObject);
        Procedure ItemsButtonClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure OutputGridKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    ViewListForm: TViewListForm;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts,
    DeleteDataUnit;

Procedure ChangeEnabled(EmployersEnabled, ItemsEnabled: Boolean);
Begin
    ViewListForm.EmployersButton.AlignWithMargins := EmployersEnabled;
    ViewListForm.EmployersButton.AllowAllUp := EmployersEnabled;
    ViewListForm.ItemsButton.AlignWithMargins := ItemsEnabled;
    ViewListForm.ItemsButton.AllowAllUp := ItemsEnabled;
End;

Procedure TViewListForm.EmployersButtonClick(Sender: TObject);
Begin
    ChangeEnabled(True, False);

    InputEmployersInGreed(OutputGrid);
    OutputGrid.Visible := True;
End;

Procedure TViewListForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    OutputGrid.Visible := False;
    ChangeEnabled(False, False);
End;

Procedure TViewListForm.ItemsButtonClick(Sender: TObject);
Begin
    ChangeEnabled(False, True);
    InputItemsInGreed(OutputGrid);
    OutputGrid.Visible := True;
End;

Procedure TViewListForm.OutputGridKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
    If (Key = VK_DELETE) Then
    Begin
        Application.CreateForm(TDeleteDataForm, DeleteDataForm);
        DeleteDataForm.ShowModal;
    End;
End;

End.
