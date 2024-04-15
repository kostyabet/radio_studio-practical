Unit EmployeeInfoUnit;

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
    Vcl.Mask,
    Vcl.ExtCtrls,
    Vcl.Grids,
    Vcl.ComCtrls,
    System.DateUtils;

Type
    TEmployeeInfoForm = Class(TForm)
        ChooseEmloyeLabel: TLabel;
        EmployersCodesCBox: TComboBox;
        DateFromLabel: TLabel;
        DateToLabel: TLabel;
        ToDTPicker: TDateTimePicker;
        FromDTPicker: TDateTimePicker;
        Label1: TLabel;
        OutputGrid: TStringGrid;
        Procedure FormCreate(Sender: TObject);
        Procedure FromDTPickerChange(Sender: TObject);
        Procedure EmployersCodesCBoxChange(Sender: TObject);
        Procedure ToDTPickerChange(Sender: TObject);
    Private
        Procedure SeenChanges();
    Public
        { Public declarations }
    End;

Var
    EmployeeInfoForm: TEmployeeInfoForm;

Implementation

{$R *.dfm}

Uses
    EquipmentReceipts;

Function IsCorrectInput(FromDTPicker, ToDTPicker: TDateTimePicker; ItemIndex: Integer): Boolean;
Var
    IsCorrect: Boolean;
Begin
    IsCorrect := True;
    IsCorrect := IsCorrect And (ItemIndex <> -1);
    IsCorrectInput := IsCorrect;
End;

Procedure TEmployeeInfoForm.SeenChanges();
Var
    BufferItemsHead: TItemNode;
Begin
    //проверка на корректный ввод
    If IsCorrectInput(FromDTPicker, ToDTPicker, EmployersCodesCBox.ItemIndex) Then
    Begin
        //считывание списка с необходимой информацией
        BufferItemsHead := SearchInfoAboutEmployer(FromDTPicker.Date, ToDTPicker.Date,
            StrToInt(EmployersCodesCBox.Items[EmployersCodesCBox.ItemIndex]));
        //заполнение выходной таблицы
        InputItemsInGreed(OutputGrid, BufferItemsHead);
        //показ таблицы конечному пользователю
        OutputGrid.Visible := True;
    End
    //если не корректно
    Else
        OutputGrid.Visible := False;
End;

Procedure TEmployeeInfoForm.EmployersCodesCBoxChange(Sender: TObject);
Begin
    SeenChanges;
End;

Procedure TEmployeeInfoForm.FormCreate(Sender: TObject);
Begin
    EmployersCodesCBox.Clear;
    EmployersCodesCBox.Items.AddStrings(AllEmloyersCodes);
    FromDTPicker.Date := IncDay(Date, -7);
    ToDTPicker.Date := Date;
    FromDTPickerChange(FromDTPicker);
    ToDTPickerChange(ToDTPicker);
End;

Procedure TEmployeeInfoForm.FromDTPickerChange(Sender: TObject);
Begin
    ToDTPicker.MinDate := FromDTPicker.Date;
    SeenChanges;
End;

Procedure TEmployeeInfoForm.ToDTPickerChange(Sender: TObject);
Begin
    FromDTPicker.MaxDate := ToDTPicker.Date;
    SeenChanges;
End;

End.
