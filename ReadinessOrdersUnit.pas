Unit ReadinessOrdersUnit;

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
    Vcl.Grids;

Type
    TReadinessOrdersForm = Class(TForm)
        OutputGrid: TStringGrid;
        Procedure FormCreate(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    ReadinessOrdersForm: TReadinessOrdersForm;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts;

Procedure TReadinessOrdersForm.FormCreate(Sender: TObject);
Var
    DateItemsHead: TItemNode;
Begin
    DateItemsHead := CreateTempItemsList(Date);
    SortListByGroup(DateItemsHead);
    InputItemsInGreed(OutputGrid, DateItemsHead);
    OutputGrid.Visible := True;
End;

End.
