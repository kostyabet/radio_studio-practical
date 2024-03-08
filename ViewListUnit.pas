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
    EquipmentReceipts;

Procedure TViewListForm.EmployersButtonClick(Sender: TObject);
Begin
    EmployersButton.AlignWithMargins := True;
    EmployersButton.AllowAllUp := True;
    ItemsButton.AlignWithMargins := False;
    ItemsButton.AllowAllUp := False;

    InputEmployersInGreed(OutputGrid);
    OutputGrid.Visible := True;
End;

Procedure TViewListForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    OutputGrid.Visible := False;
    EmployersButton.AlignWithMargins := False;
    EmployersButton.AllowAllUp := False;
    ItemsButton.AlignWithMargins := False;
    ItemsButton.AllowAllUp := False;
End;

Procedure TViewListForm.ItemsButtonClick(Sender: TObject);
Begin
    EmployersButton.AlignWithMargins := False;
    EmployersButton.AllowAllUp := False;
    ItemsButton.AlignWithMargins := True;
    ItemsButton.AllowAllUp := True;

    InputItemsInGreed(OutputGrid);
    OutputGrid.Visible := True;
End;

End.
