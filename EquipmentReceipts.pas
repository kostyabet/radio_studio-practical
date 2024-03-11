Unit EquipmentReceipts;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Grids,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.StdCtrls,
    Vcl.Buttons,
    Vcl.ExtCtrls,
    Vcl.ComCtrls,
    Vcl.Mask;

Type
    //TMyString = String[30];

    TItem = Record
        ProdGroup: String;
        ProdBrand: String;
        AcceptanceDate: TDate;
        ExecutorCode: Integer;
        OrderStatus: Boolean;
    End;

    TEmploye = Record
        Code: Integer;
        Name: String;
        Post: String;
        Hours: Integer;
    End;

    TItemNode = ^ItemNode;

    ItemNode = Record
        Item: TItem;
        Prev: TItemNode;
        Next: TItemNode;
    End;

    TEmployeNode = ^EmployeNode;

    EmployeNode = Record
        Employe: TEmploye;
        Prev: TEmployeNode;
        Next: TEmployeNode;
    End;

    TItemsIndex = (Group, Brand, Date, Executor, Status);
    TEmployersIndex = (Code, Name, Post, Hours);

Procedure EmployeInput(Code: Integer; Name, Post: String; Hours: Integer);
Procedure ItemInput(Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Procedure InputEmployersInGreed(StGrid: TStringGrid);
Procedure DeleteEmployerFromGreed(RecordNumber: Integer);
Procedure InputItemsInGreed(StGrid: TStringGrid);
Procedure DeleteItemFromGreed(RecordNumber: Integer);
Procedure OutputInfoAboutEmploye(RecordNum: Integer; Var CodeLEdit, FIOLEdit, PostLEdit, WorkHourLEdit: TLabeledEdit);
Procedure OutputInfoAboutItem(RecordNum: Integer; Var DateOfStartPicker: TDateTimePicker;
    Var ItemGroupLEdit, ItemMarkLEdit, EmployeFixedCodeLEdit: TLabeledEdit; Var ReadyCBox: TComboBox);
Procedure InputNewInfoAboutEmploye(RecordIndex: Integer; Code: Integer; Name, Post: String; Hours: Integer);
Procedure InputNewInfoAboutItem(RecordIndex: Integer; Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Procedure SearchAnEmployer(Index: Integer; LabelText: String);
Procedure SearchItem(Index: Integer);

Var
    ItemsHead: TItemNode;
    ItemsTail: TItemNode;
    ItemsSearch: TItemNode;
    EmployersHead: TEmployeNode;
    EmployersTail: TEmployeNode;
    EmployerSearch: TEmployeNode;
    ItemsCounter: Integer = 0;
    EmployersCounter: Integer = 0;

Implementation

Procedure EmployeInput(Code: Integer; Name, Post: String; Hours: Integer);
Var
    EmployersBuffer: TEmployeNode;
Begin
    New(EmployersBuffer);
    EmployersBuffer.Employe.Hours := Hours;
    EmployersBuffer.Employe.Post := Post;
    EmployersBuffer.Employe.Name := Name;
    EmployersBuffer.Employe.Code := Code;
    EmployersBuffer.Next := Nil;
    EmployersBuffer.Prev := EmployersTail;
    If (EmployersHead <> Nil) Then
        EmployersTail.Next := EmployersBuffer
    Else
        EmployersHead := EmployersBuffer;
    EmployersTail := EmployersBuffer;
    Inc(EmployersCounter);
End;

Procedure ItemInput(Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Var
    ItemsBuffer: TItemNode;
Begin
    New(ItemsBuffer);
    ItemsBuffer.Item.ProdGroup := Group;
    ItemsBuffer.Item.ProdBrand := Brand;
    ItemsBuffer.Item.AcceptanceDate := Date;
    ItemsBuffer.Item.ExecutorCode := Code;
    ItemsBuffer.Item.OrderStatus := Status;
    ItemsBuffer.Next := Nil;
    ItemsBuffer.Prev := ItemsTail;
    If (ItemsHead <> Nil) Then
        ItemsTail.Next := ItemsBuffer
    Else
        ItemsHead := ItemsBuffer;
    ItemsTail := ItemsBuffer;
    Inc(ItemsCounter);
End;

Procedure InputEmployersInGreed(StGrid: TStringGrid);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    EmployersBuffer := EmployersHead;
    StGrid.ColCount := 4;
    StGrid.RowCount := EmployersCounter + 1;
    StGrid.FixedCols := 0;
    StGrid.FixedRows := Ord(EmployersCounter > 0);
    StGrid.Cells[0, 0] := 'Код работника';
    StGrid.Cells[1, 0] := 'ФИО работника';
    StGrid.Cells[2, 0] := 'Должность';
    StGrid.Cells[3, 0] := 'Кол-во раб. часов';
    I := 1;
    While EmployersBuffer <> Nil Do
    Begin
        StGrid.Cells[0, I] := IntToStr(EmployersBuffer.Employe.Code);
        StGrid.Cells[1, I] := EmployersBuffer.Employe.Name;
        StGrid.Cells[2, I] := EmployersBuffer.Employe.Post;
        StGrid.Cells[3, I] := IntToStr(EmployersBuffer.Employe.Hours);
        EmployersBuffer := EmployersBuffer.Next;
        Inc(I);
    End;
    StGrid.ColWidths[0] := (StGrid.Width * 15) Div 100;
    StGrid.ColWidths[1] := (StGrid.Width * 33) Div 100;
    StGrid.ColWidths[2] := (StGrid.Width * 32) Div 100;
    StGrid.ColWidths[3] := (StGrid.Width * 19) Div 100;
    If (EmployersCounter + 1 > 11) Then
    Begin
        StGrid.ColWidths[1] := (StGrid.Width * 32) Div 100;
        StGrid.ColWidths[2] := (StGrid.Width * 32) Div 100;
    End;
End;

Procedure DeleteEmployerFromGreed(RecordNumber: Integer);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    For I := 1 To RecordNumber - 1 Do
        If EmployersHead.Next <> Nil Then
            EmployersHead := EmployersHead.Next;
    If (EmployersHead.Prev <> Nil) Then
        EmployersHead.Prev.Next := EmployersHead.Next;
    If (EmployersHead.Next <> Nil) Then
        EmployersHead.Next.Prev := EmployersHead.Prev;
    EmployersBuffer := EmployersHead;
    If (EmployersHead.Prev = Nil) Then
        EmployersHead := EmployersHead.Next
    Else
        While (EmployersHead.Prev <> Nil) Do
            EmployersHead := EmployersHead.Prev;
    Dispose(EmployersBuffer);
    EmployersCounter := EmployersCounter - 1;
    If (EmployersCounter = 0) Then
        EmployersHead := Nil;
End;

Procedure InputItemsInGreed(StGrid: TStringGrid);
Var
    ItemsBuffer: TItemNode;
    I: Integer;
Begin
    ItemsBuffer := ItemsHead;
    StGrid.ColCount := 5;
    StGrid.RowCount := ItemsCounter + 1;
    StGrid.FixedCols := 0;
    StGrid.FixedRows := Ord(ItemsCounter > 0);
    StGrid.Cells[0, 0] := 'Изделие';
    StGrid.Cells[1, 0] := 'Бренд';
    StGrid.Cells[2, 0] := 'Дата';
    StGrid.Cells[3, 0] := 'Код рабочего';
    StGrid.Cells[4, 0] := 'Статус';
    I := 1;
    While (ItemsBuffer <> Nil) Do
    Begin
        StGrid.Cells[0, I] := ItemsBuffer.Item.ProdGroup;
        StGrid.Cells[1, I] := ItemsBuffer.Item.ProdBrand;
        StGrid.Cells[2, I] := DateToStr(ItemsBuffer.Item.AcceptanceDate);
        StGrid.Cells[3, I] := IntToStr(ItemsBuffer.Item.ExecutorCode);
        If ItemsBuffer.Item.OrderStatus Then
            StGrid.Cells[4, I] := 'Выполнен'
        Else
            StGrid.Cells[4, I] := 'Не выполнен';
        ItemsBuffer := ItemsBuffer.Next;
        Inc(I);
    End;
    StGrid.ColWidths[0] := (StGrid.Width * 25) Div 100;
    StGrid.ColWidths[1] := (StGrid.Width * 25) Div 100;
    StGrid.ColWidths[2] := (StGrid.Width * 11) Div 100;
    StGrid.ColWidths[3] := (StGrid.Width * 24) Div 100;
    StGrid.ColWidths[4] := (StGrid.Width * 14) Div 100;
    If (ItemsCounter + 1 > 11) Then
    Begin
        StGrid.ColWidths[0] := (StGrid.Width * 24) Div 100;
        StGrid.ColWidths[1] := (StGrid.Width * 23) Div 100;
        StGrid.ColWidths[3] := (StGrid.Width * 24) Div 100;
    End;
End;

Procedure DeleteItemFromGreed(RecordNumber: Integer);
Var
    ItemsBuffer: TItemNode;
    I: Integer;
Begin
    For I := 1 To RecordNumber - 1 Do
        If ItemsHead.Next <> Nil Then
            ItemsHead := ItemsHead.Next;
    If (ItemsHead.Prev <> Nil) Then
        ItemsHead.Prev.Next := ItemsHead.Next;
    If (ItemsHead.Next <> Nil) Then
        ItemsHead.Next.Prev := ItemsHead.Prev;
    ItemsBuffer := ItemsHead;
    If (ItemsHead.Prev = Nil) Then
        ItemsHead := ItemsHead.Next
    Else
        While (ItemsHead.Prev <> Nil) Do
            ItemsHead := ItemsHead.Prev;
    Dispose(ItemsBuffer);
    ItemsCounter := ItemsCounter - 1;
    If (ItemsCounter = 0) Then
        ItemsHead := Nil;
End;

Procedure OutputInfoAboutEmploye(RecordNum: Integer; Var CodeLEdit, FIOLEdit, PostLEdit, WorkHourLEdit: TLabeledEdit);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    EmployersBuffer := EmployersHead;
    For I := 1 To RecordNum - 1 Do
        If EmployersBuffer.Next <> Nil Then
            EmployersBuffer := EmployersBuffer.Next;
    CodeLEdit.Text := IntToStr(EmployersBuffer.Employe.Code);
    FIOLEdit.Text := EmployersBuffer.Employe.Name;
    PostLEdit.Text := EmployersBuffer.Employe.Post;
    WorkHourLEdit.Text := IntToStr(EmployersBuffer.Employe.Hours);
End;

Procedure OutputInfoAboutItem(RecordNum: Integer; Var DateOfStartPicker: TDateTimePicker;
    Var ItemGroupLEdit, ItemMarkLEdit, EmployeFixedCodeLEdit: TLabeledEdit; Var ReadyCBox: TComboBox);
Var
    ItemsBuffer: TItemNode;
    I: Integer;
Begin
    ItemsBuffer := ItemsHead;
    For I := 1 To RecordNum - 1 Do
        If ItemsBuffer.Next <> Nil Then
            ItemsBuffer := ItemsBuffer.Next;
    DateOfStartPicker.Date := ItemsBuffer.Item.AcceptanceDate;
    ItemGroupLEdit.Text := ItemsBuffer.Item.ProdGroup;
    ItemMarkLEdit.Text := ItemsBuffer.Item.ProdBrand;
    EmployeFixedCodeLEdit.Text := IntToStr(ItemsBuffer.Item.ExecutorCode);
    If ItemsBuffer.Item.OrderStatus Then
        ReadyCBox.ItemIndex := 0
    Else
        ReadyCBox.ItemIndex := 1;
End;

Procedure InputNewInfoAboutEmploye(RecordIndex: Integer; Code: Integer; Name, Post: String; Hours: Integer);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    EmployersBuffer := EmployersHead;
    For I := 1 To RecordIndex - 1 Do
        If EmployersBuffer.Next <> Nil Then
            EmployersBuffer := EmployersBuffer.Next;
    EmployersBuffer.Employe.Hours := Hours;
    EmployersBuffer.Employe.Post := Post;
    EmployersBuffer.Employe.Name := Name;
    EmployersBuffer.Employe.Code := Code;
End;

Procedure InputNewInfoAboutItem(RecordIndex: Integer; Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Var
    ItemsBuffer: TItemNode;
    I: Integer;
Begin
    ItemsBuffer := ItemsHead;
    For I := 1 To RecordIndex - 1 Do
        If ItemsBuffer.Next <> Nil Then
            ItemsBuffer := ItemsBuffer.Next;
    ItemsBuffer.Item.ProdGroup := Group;
    ItemsBuffer.Item.ProdBrand := Brand;
    ItemsBuffer.Item.AcceptanceDate := Date;
    ItemsBuffer.Item.ExecutorCode := Code;
    ItemsBuffer.Item.OrderStatus := Status;
End;

Procedure SearchAnEmployer(Index: Integer; LabelText: String);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    EmployersBuffer := EmployersHead;
    Case Index Of
        Integer(TEmployersIndex.Code):
            Begin
                While (EmployersBuffer <> Nil) Do
                Begin
                    If (IntToStr(EmployersBuffer.Employe.Code) = LabelText) Then
                                    
                    EmployersBuffer := EmployersBuffer.Next;
                End;
            End;
        Integer(TEmployersIndex.Name):
            Begin

            End;
        Integer(TEmployersIndex.Post):
            Begin

            End;
        Integer(TEmployersIndex.Hours):
            Begin

            End;
    End;
End;

Procedure SearchItem(Index: Integer);
Begin
    Case Index Of
        Integer(TItemsIndex.Group):
            Begin

            End;
        Integer(TItemsIndex.Brand):
            Begin

            End;
        Integer(TItemsIndex.Date):
            Begin

            End;
        Integer(TItemsIndex.Executor):
            Begin

            End;
        Integer(TItemsIndex.Status):
            Begin

            End;
    End;
End;

Initialization

ItemsHead := Nil;
ItemsTail := Nil;
EmployersHead := Nil;
EmployersTail := Nil;
ItemsSearch := Nil;
EmployerSearch := Nil;

End.
