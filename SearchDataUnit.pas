Unit SearchDataUnit;

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
    Vcl.ExtCtrls,
    Vcl.StdCtrls,
    Vcl.ComCtrls,
    Vcl.Mask,
    Vcl.Grids;

Type
    TSearchDataForm = Class(TForm)
        SwitchPanel: TPanel;
        AddEmployerButton: TSpeedButton;
        AddItemButton: TSpeedButton;
        CriteriLabel: TLabel;
        SearchCriterionCBox: TComboBox;
        DataLEdit: TLabeledEdit;
        DataLabel: TLabel;
        DataCBox: TComboBox;
        DataDateTPick: TDateTimePicker;
        SearchSpButton: TSpeedButton;
        OutputGrid: TStringGrid;
        Procedure AddEmployerButtonClick(Sender: TObject);
        Procedure AddItemButtonClick(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure FormCreate(Sender: TObject);
        Procedure SearchCriterionCBoxChange(Sender: TObject);
        Procedure SearchSpButtonClick(Sender: TObject);
        Procedure DataLEditChange(Sender: TObject);
        Procedure DataCBoxChange(Sender: TObject);
        Procedure DataLEditKeyPress(Sender: TObject; Var Key: Char);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Const
    Items: Array [0 .. 4] Of String = ('по группе', 'по бренду', 'по дате сдачи', 'по коду ремонтирующего', 'по готовность');
    Employers: Array [0 .. 3] Of String = ('по коду', 'по ФИО', 'по должности', 'по часам работы');

Type
    TGridChoose = (Employe, Item);

Var
    SearchDataForm: TSearchDataForm;
    GridChoose: TGridChoose;

Implementation

{$R *.dfm}

Uses
    ViewSearchResUnit,
    EquipmentReceipts;

Procedure TSearchDataForm.AddEmployerButtonClick(Sender: TObject);
Begin
    AddEmployerButton.AlignWithMargins := True;
    AddEmployerButton.AllowAllUp := True;
    AddItemButton.AlignWithMargins := False;
    AddItemButton.AllowAllUp := False;

    CriteriLabel.Visible := True;
    SearchCriterionCBox.Visible := True;

    DataLabel.Visible := False;
    DataLEdit.Visible := False;
    DataDateTPick.Visible := False;
    DataCBox.Visible := False;
    SearchSpButton.Visible := False;

    SearchCriterionCBox.Clear;
    SearchCriterionCBox.Items.AddStrings(Employers);

    GridChoose := Employe;
End;

Procedure TSearchDataForm.AddItemButtonClick(Sender: TObject);
Begin
    AddEmployerButton.AlignWithMargins := False;
    AddEmployerButton.AllowAllUp := False;
    AddItemButton.AlignWithMargins := True;
    AddItemButton.AllowAllUp := True;

    CriteriLabel.Visible := True;
    SearchCriterionCBox.Visible := True;

    DataLabel.Visible := False;
    DataLEdit.Visible := False;
    DataDateTPick.Visible := False;
    DataCBox.Visible := False;
    SearchSpButton.Visible := False;

    SearchCriterionCBox.Clear;
    SearchCriterionCBox.Items.AddStrings(Items);

    GridChoose := Item;
End;

Procedure TSearchDataForm.DataCBoxChange(Sender: TObject);
Begin
    SearchSpButton.Enabled := DataCBox.ItemIndex <> -1;
End;

Procedure TSearchDataForm.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    AddEmployerButton.AlignWithMargins := False;
    AddEmployerButton.AllowAllUp := False;
    AddItemButton.AlignWithMargins := False;
    AddItemButton.AllowAllUp := False;

    CriteriLabel.Visible := False;
    SearchCriterionCBox.Visible := False;

    DataLEdit.Visible := False;
    DataDateTPick.Visible := False;
    DataCBox.Visible := False;
    SearchSpButton.Visible := False;

    OutputGrid.Visible := False;
End;

Procedure TSearchDataForm.FormCreate(Sender: TObject);
Begin
    DataLEdit.EditLabel.Caption := '';
End;

Procedure TSearchDataForm.SearchCriterionCBoxChange(Sender: TObject);
Begin
    DataLEdit.Text := '';
    DataCBox.ItemIndex := -1;
    DataLEdit.Visible := False;
    DataDateTPick.Visible := False;
    DataCBox.Visible := False;
    DataLabel.Visible := True;
    SearchSpButton.Visible := True;
    SearchSpButton.Enabled := False;
    Case GridChoose Of
        Employe:
            Begin
                DataLEdit.Visible := True;
                If (SearchCriterionCBox.ItemIndex = 0) Then
                    DataLEdit.MaxLength := 9
                Else
                    If (SearchCriterionCBox.ItemIndex = 3) Then
                        DataLEdit.MaxLength := 2
                    Else
                        DataLEdit.MaxLength := 30;
            End;
        Item:
            Begin
                Case SearchCriterionCBox.ItemIndex Of
                    Integer(TItemsIndex.ItemDate):
                        Begin
                            DataDateTPick.Visible := True;
                            SearchSpButton.Enabled := True;
                        End;
                    Integer(TItemsIndex.Status):
                        DataCBox.Visible := True;
                Else
                    Begin
                        DataLEdit.Visible := True;
                        If (SearchCriterionCBox.ItemIndex = 3) Then
                            DataLEdit.MaxLength := 9
                        Else
                            DataLEdit.MaxLength := 30;
                    End;
                End;
            End;
    End;
End;

Procedure TSearchDataForm.SearchSpButtonClick(Sender: TObject);
Var
    ItemsBufHead: TItemNode;
    EmployersBufHead: TEmployeNode;
Begin
    Case GridChoose Of
        Employe:
            Begin
                EmployersBufHead := SearchEmployers(SearchCriterionCBox.ItemIndex, DataLEdit.Text);
                InputEmployersInGreed(OutputGrid, EmployersBufHead);
                OutputGrid.RowCount := OutputGrid.RowCount;
            End;
        Item:
            Begin
                ItemsBufHead := SearchItems(SearchCriterionCBox.ItemIndex, DataLEdit.Text, DataDateTPick.Date, DataCBox.ItemIndex = 0);
                InputItemsInGreed(OutputGrid, ItemsBufHead);
            End;
    End;
    OutputGrid.Visible := True;
End;

Procedure TSearchDataForm.DataLEditChange(Sender: TObject);
Begin
    SearchSpButton.Enabled := Trim(DataLEdit.Text) <> ''
End;

Procedure TSearchDataForm.DataLEditKeyPress(Sender: TObject; Var Key: Char);
Const
    GOOD_VALUE = ['0' .. '9', #13, #08];
Begin
    If Not CharInSet(Key, GOOD_VALUE) And (DataLEdit.MaxLength <> 30) Then
        Key := #0;
End;

End.
