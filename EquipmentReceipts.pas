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

Procedure EmployeInput(Code: Integer; Name, Post: String; Hours: Integer);
Procedure ItemInput(Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Procedure InputEmployersInGreed(StGrid: TStringGrid);
Procedure InputItemsInGreed(StGrid: TStringGrid);

Var
    ItemsHead: TItemNode;
    ItemsTail: TItemNode;
    EmployersHead: TEmployeNode;
    EmployersTail: TEmployeNode;
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

Initialization

ItemsHead := Nil;
ItemsTail := Nil;
EmployersHead := Nil;
EmployersTail := Nil;

End.
