Unit EquipmentReceipts;

Interface

Uses
    System.Math,
    BackendUnit,
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
    Vcl.Mask,
    System.DateUtils;

Const
    EmployersFilePath = 'EmployersFil.txt';
    ItemsFilePath = 'Items.txt';

Type
    TMyString = Array [1 .. 30] Of WideChar;
    TArrOfCodes = Array Of String;
    TArrayOfIndex = Array Of Integer;

    TItem = Record
        ProdGroup: TMyString;
        ProdBrand: TMyString;
        AcceptanceDate: TDate;
        ExecutorCode: Integer;
        OrderStatus: Boolean;
    End;

    TEmploye = Record
        Code: Integer;
        Name: TMyString;
        Post: TMyString;
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

    TItemsIndex = (Group, Brand, ItemDate, Executor, Status);
    TEmployersIndex = (Code, Name, Post, Hours);

    TEmployersFile = File Of TEmploye;
    TItemsFile = File Of TItem;

Procedure SaveEmployersInFile();
Procedure SaveItemsInFile();

Procedure LoadEmployersFromFile();
Procedure LoadItemsFromFile();

Procedure EmployeInput(Code: Integer; Name, Post: String; Hours: Integer);
Procedure ItemInput(Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Procedure InputEmployersInGreed(StGrid: TStringGrid; EmployersBuffer: TEmployeNode);
Procedure DeleteEmployer(RecordNumber: Integer);
Procedure InputItemsInGreed(StGrid: TStringGrid; Items: TItemNode);
Procedure DeleteItem(RecordNumber: Integer);
Procedure OutputInfoAboutEmploye(RecordNum: Integer; Var CodeLEdit, FIOLEdit, PostLEdit, WorkHourLEdit: TLabeledEdit);
Procedure OutputInfoAboutItem(RecordNum: Integer; Var DateOfStartPicker: TDateTimePicker;
    Var ItemGroupLEdit, ItemMarkLEdit, EmployeFixedCodeLEdit: TLabeledEdit; Var ReadyCBox: TComboBox);
Procedure InputNewInfoAboutEmploye(RecordIndex: Integer; Code: Integer; Name, Post: String; Hours: Integer);
Procedure InputNewInfoAboutItem(RecordIndex: Integer; Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Function SearchEmployers(Index: Integer; LabelText: String): TEmployeNode;
Function SearchItems(Index: Integer; LabelText: String; Date: TDate; Status: Boolean): TItemNode;
Function CreateTempItemsList(Date: TDate): TItemNode;
Procedure SortListByGroup(Var ItemsHead: TItemNode);
Function IsEmployerExist(LabelText: String): Boolean;
Function AllEmloyersCodes: TArrOfCodes;
Function SearchInfoAboutEmployer(MinDate, MaxDate: TDate; Code: Integer): TItemNode;
Function SearchItemsCounter(Items: TItemNode): Integer;
Function SearchEmployersCounter(Employes: TEmployeNode): Integer;
Function StrToWideChar(SourceString: String): TMyString;
Function WideCharToStr(SourceWideChar: TMyString): String;
Function AllDeletedItemsIndex(Index: Integer): TArrayOfIndex;
Procedure CreateLists;
Procedure DestroyLists;

Var
    EmployersFile: TEmployersFile;
    ItemsFile: TItemsFile;
    ItemsHead: TItemNode;
    ItemsTail: TItemNode;
    EmployersHead: TEmployeNode;
    EmployersTail: TEmployeNode;
    ItemsCounter: Integer = 0;
    EmployersCounter: Integer = 0;

Implementation

Uses
    MainFormUnit;

Function StrToWideChar(SourceString: String): TMyString;
Const
    NULL_POINT: Char = #0;
Var
    DestArray: TMyString;
    NumCharsToCopy, I: Integer;
Begin
    NumCharsToCopy := Min(Length(SourceString), SizeOf(DestArray) Div SizeOf(WideChar) - 1);

    For I := 1 To NumCharsToCopy Do
        DestArray[I] := WideChar(SourceString[I]);
    For I := NumCharsToCopy + 1 To High(DestArray) Do
        DestArray[I] := WideChar(NULL_POINT);

    StrToWideChar := DestArray;
End;

Function WideCharToStr(SourceWideChar: TMyString): String;
Const
    Null_POINT: Char = #0;
Var
    ResStr: String;
    I: Integer;
Begin
    ResStr := '';
    For I := Low(SourceWideChar) To High(SourceWideChar) Do
    Begin
        If SourceWideChar[I] <> NULL_POINT Then
            ResStr := ResStr + String(SourceWideChar[I]);
    End;

    WideCharToStr := ResStr;
End;

Procedure SaveItemsInFile();
Var
    BufferItems: TItemNode;
Begin
    Try
        //открываем файл для записи
        Assign(ItemsFile, ItemsFilePath);
        Try
            //очищаем файл от предыдущей информации
            Rewrite(ItemsFile);
            //присваиваем указатель на первый элемент списка
            BufferItems := ItemsHead;
            //пока не конец узлов
            While BufferItems <> Nil Do
            Begin
                //записываем информацию о заказе в файл
                Write(ItemsFile, BufferItems.Item);
                //переход на следующий узел
                BufferItems := BufferItems.Next;
            End;
        Except
            //информаци о ошибке
            MainForm.ErrorExit('Ошибка при записи данных в файл.', 'Запись');
        End;
    Finally
        //закрытие файла
        Close(ItemsFile);
    End;
End;

Procedure LoadItemsFromFile();
Var
    Item: TItem;
Begin
    //открываем файл для чтения
    Assign(ItemsFile, ItemsFilePath);
    //проверка на существование файла
    If Not FileExists(ItemsFilePath) Then
        Rewrite(ItemsFile)//созданеи пустого файла
        //если файл существует
    Else
    Begin
        Try
            //подготовка файл перед записью
            Reset(ItemsFile);
            Try
                //пока не достигнем конца файла
                While Not EOF(ItemsFile) Do
                Begin
                    //читаем заказ
                    Read(ItemsFile, Item);
                    //добавляем заказ
                    ItemInput(Item.ProdGroup, Item.ProdBrand, Item.AcceptanceDate, Item.ExecutorCode, Item.OrderStatus);
                End;
            Except
                //вывод информации ошибки
                MainForm.ErrorExit('Ошибка при загрузке данных из файла.', 'Загрузка');
                //создание пустого файла
                Rewrite(ItemsFile);
            End;
        Finally
            //закрваем файл
            Close(ItemsFile);
        End;
    End;
End;

Procedure LoadEmployersFromFile();
Var
    Employe: TEmploye;
Begin
    //открыть файл
    Assign(EmployersFile, EmployersFilePath);
    //проверка на существование файла
    If Not FileExists(EmployersFilePath) Then
        Rewrite(EmployersFile)//создание пустого файла
    Else
    //выполним считывание если файл существует
    Begin
        Try
            //подготовка файл к считыванию
            Reset(EmployersFile);
            Try
                //пока не достигли конца файла
                While Not EOF(EmployersFile) Do
                Begin
                    //чтение сотрудника
                    Read(EmployersFile, Employe);
                    //добавление сотрудника
                    EmployeInput(Employe.Code, Employe.Name, Employe.Post, Employe.Hours)
                End;
            Except
                //отлавливание ошибки
                MainForm.ErrorExit('Ошибка при загрузке данных из файла.', 'Загрузка');
                //создание пустого файла
                Rewrite(EmployersFile);
            End;
        Finally
            //закрываем файл
            Close(EmployersFile);
        End;
    End;
End;

Procedure SaveEmployersInFile();
Var
    BufferEmployer: TEmployeNode;
Begin
    Try
        //открываем файл
        Assign(EmployersFile, EmployersFilePath);
        Try
            //очищаем файл от старой информации
            Rewrite(EmployersFile);
            //принимаем указатель на первый элемент списка заказов
            BufferEmployer := EmployersHead;
            //проходим все узлы
            While BufferEmployer <> Nil Do
            Begin
                //записываем сотрудника в файл
                Write(EmployersFile, BufferEmployer.Employe);
                //переходим на следующий узел списка
                BufferEmployer := BufferEmployer.Next;
            End;
        Except
            //всплывающее окно ошибки
            MainForm.ErrorExit('Ошибка при записи данных в файл.', 'Запись');
        End;
    Finally
        //закрытие файла
        Close(EmployersFile);
    End;
End;

Procedure CreateLists;
Begin
    ItemsHead := Nil;
    ItemsTail := Nil;
    EmployersHead := Nil;
    EmployersTail := Nil;
End;

Procedure DestroyLists;
Begin
    While ItemsHead <> Nil Do
    Begin
        ItemsTail := ItemsHead;
        ItemsHead := ItemsHead.Next;
        Dispose(ItemsTail);
    End;
    ItemsTail := Nil;
    ItemsHead := Nil;
    While EmployersHead <> Nil Do
    Begin
        EmployersTail := EmployersHead;
        EmployersHead := EmployersHead.Next;
        Dispose(EmployersTail);
    End;
    EmployersTail := Nil;
    EmployersHead := Nil;
End;

Procedure AddItemInList(Var ResNodeHead, ResNodeTail, BufNode: TItemNode);
Begin
    If (ResNodeHead = Nil) Then
    Begin
        New(ResNodeHead);
        ResNodeHead.Item := BufNode.Item;
        ResNodeHead.Prev := Nil;
        ResNodeHead.Next := Nil;
        ResNodeTail := ResNodeHead;
    End
    Else
    Begin
        New(ResNodeTail.Next);
        ResNodeTail.Next.Prev := ResNodeTail;
        ResNodeTail := ResNodeTail.Next;
        ResNodeTail.Next := Nil;
        ResNodeTail.Item := BufNode.Item;
    End;
End;

Procedure AddEmployeInList(Var ResNodeHead, ResNodeTail, BufNode: TEmployeNode);
Begin
    If (ResNodeHead = Nil) Then
    Begin
        New(ResNodeHead);
        ResNodeHead.Employe := BufNode.Employe;
        ResNodeHead.Prev := Nil;
        ResNodeHead.Next := Nil;
        ResNodeTail := ResNodeHead;
    End
    Else
    Begin
        New(ResNodeTail.Next);
        ResNodeTail.Next.Prev := ResNodeTail;
        ResNodeTail := ResNodeTail.Next;
        ResNodeTail.Next := Nil;
        ResNodeTail.Employe := BufNode.Employe;
    End;
End;

Function CreateTempItemsList(Date: TDate): TItemNode;
Var
    BufNode: TItemNode;
    ResNodeHead: TItemNode;
    ResNodeTail: TItemNode;
Begin
    ResNodeHead := Nil;
    BufNode := ItemsHead;
    While BufNode <> Nil Do
    Begin
        If SameDate(BufNode.Item.AcceptanceDate, Date) Then
            AddItemInList(ResNodeHead, ResNodeTail, BufNode);
        BufNode := BufNode.Next;
    End;

    CreateTempItemsList := ResNodeHead;
End;

Procedure EmployeInput(Code: Integer; Name, Post: String; Hours: Integer);
Var
    EmployersBuffer: TEmployeNode;
Begin
    //выделение памяти под новый узел
    New(EmployersBuffer);
    //заполнение полей записи
    EmployersBuffer.Employe.Hours := Hours;
    EmployersBuffer.Employe.Post := StrToWideChar(Post);
    EmployersBuffer.Employe.Name := StrToWideChar(Name);
    EmployersBuffer.Employe.Code := StrToInt(IntToStr(Code));
    //присваивание указателей узла
    EmployersBuffer.Next := Nil;
    EmployersBuffer.Prev := EmployersTail;
    //включнение узла в список
    If (EmployersHead <> Nil) Then
        EmployersTail.Next := EmployersBuffer
    Else
        EmployersHead := EmployersBuffer;
    EmployersTail := EmployersBuffer;
    //увеличение счётчика сотрудников
    Inc(EmployersCounter);
End;

Procedure ItemInput(Group, Brand: String; Date: TDate; Code: Integer; Status: Boolean);
Var
    ItemsBuffer: TItemNode;
Begin
    //выделение памяти под новый узел
    New(ItemsBuffer);
    //заполнение полей записи
    ItemsBuffer.Item.ProdGroup := StrToWideChar(Group);
    ItemsBuffer.Item.ProdBrand := StrToWideChar(Brand);
    ItemsBuffer.Item.AcceptanceDate := Date;
    ItemsBuffer.Item.ExecutorCode := Code;
    ItemsBuffer.Item.OrderStatus := Status;
    //присваивание указателей узла
    ItemsBuffer.Next := Nil;
    ItemsBuffer.Prev := ItemsTail;
    //включнение узла в список
    If (ItemsHead <> Nil) Then
        ItemsTail.Next := ItemsBuffer
    Else
        ItemsHead := ItemsBuffer;
    ItemsTail := ItemsBuffer;
    //увеличение счётчика заказов
    Inc(ItemsCounter);
End;

Procedure InputEmployersInGreed(StGrid: TStringGrid; EmployersBuffer: TEmployeNode);
Const
    EmployersColCount: Integer = 4;
    CodeColPercent: Integer = 15;
    NameColPercent: Integer = 33;
    PosColPercent: Integer = 32;
    WorkHourPercenr: Integer = 19;
    MaxVisibleRows: Integer = 11;
Var
    I: Integer;
    ColValues: (Code, Name, Pos, WorkHour);
Begin
    StGrid.ColCount := EmployersColCount;
    StGrid.RowCount := SearchEmployersCounter(EmployersBuffer) + 1;
    StGrid.FixedRows := Ord(StGrid.RowCount > 1);
    StGrid.Cells[Ord(Code), 0] := 'Код работника';
    StGrid.Cells[Ord(Name), 0] := 'ФИО работника';
    StGrid.Cells[Ord(Pos), 0] := 'Должность';
    StGrid.Cells[Ord(WorkHour), 0] := 'Кол-во раб. часов';
    I := 1;
    While EmployersBuffer <> Nil Do
    Begin
        StGrid.Cells[Ord(Code), I] := IntToStr(EmployersBuffer.Employe.Code);
        StGrid.Cells[Ord(Name), I] := WideCharToStr(EmployersBuffer.Employe.Name);
        StGrid.Cells[Ord(Pos), I] := WideCharToStr(EmployersBuffer.Employe.Post);
        StGrid.Cells[Ord(WorkHour), I] := IntToStr(EmployersBuffer.Employe.Hours);
        EmployersBuffer := EmployersBuffer.Next;
        Inc(I);
    End;
    StGrid.ColWidths[Ord(Code)] := (StGrid.Width * CodeColPercent) Div 100;
    StGrid.ColWidths[Ord(Name)] := (StGrid.Width * NameColPercent) Div 100;
    StGrid.ColWidths[Ord(Pos)] := (StGrid.Width * PosColPercent) Div 100;
    StGrid.ColWidths[Ord(WorkHour)] := (StGrid.Width * WorkHourPercenr) Div 100;
    If (EmployersCounter + 1 > MaxVisibleRows) Then
        StGrid.ColWidths[Ord(Name)] := (StGrid.Width * NameColPercent - 1) Div 100;
End;

Procedure DeleteEmployer(RecordNumber: Integer);
Var
    EmployersBuffer: TEmployeNode;
    I: Integer;
Begin
    //поиск удаляемого элемента
    For I := 1 To RecordNumber - 1 Do
        If EmployersHead.Next <> Nil Then
            EmployersHead := EmployersHead.Next;
    //проверка на краиний левый
    If (EmployersHead.Prev <> Nil) Then
        EmployersHead.Prev.Next := EmployersHead.Next;
    //проверка на краиний правый
    If (EmployersHead.Next <> Nil) Then
        EmployersHead.Next.Prev := EmployersHead.Prev;
    //распределние указателей
    EmployersBuffer := EmployersHead;
    If (EmployersHead.Prev = Nil) Then
        EmployersHead := EmployersHead.Next
    Else
        //возвращение указателя в начальное состояние
        While (EmployersHead.Prev <> Nil) Do
            EmployersHead := EmployersHead.Prev;
    //очистка память удалённого узла
    Dispose(EmployersBuffer);
    //умешнешие счётчика
    EmployersCounter := EmployersCounter - 1;
    //проверка на пустоту списка
    If (EmployersCounter = 0) Then
        EmployersHead := Nil;
End;

Function SearchEmployersCounter(Employes: TEmployeNode): Integer;
Var
    Index: Integer;
Begin
    Index := 0;
    While Employes <> Nil Do
    Begin
        Employes := Employes.Next;
        Inc(Index);
    End;
    SearchEmployersCounter := Index;
End;

Function SearchItemsCounter(Items: TItemNode): Integer;
Var
    Index: Integer;
Begin
    Index := 0;
    While Items <> Nil Do
    Begin
        Inc(Index);
        Items := Items.Next;
    End;
    SearchItemsCounter := Index;
End;

Procedure SortListByGroup(Var ItemsHead: TItemNode);
Var
    I: Integer;
    J: Integer;
    Counter: Integer;
    ItemsBuffer: TItemNode;
    TempItem: TItem;
Begin
    Counter := SearchItemsCounter(ItemsHead);
    For I := 1 To Counter - 1 Do
    Begin
        ItemsBuffer := ItemsHead;
        For J := 1 To Counter - 1 Do
        Begin
            If (ItemsBuffer.Item.ProdGroup > ItemsBuffer.Next.Item.ProdGroup) And
                (Length(ItemsBuffer.Item.ProdGroup) >= Length(ItemsBuffer.Next.Item.ProdGroup)) Then
            Begin
                TempItem := ItemsBuffer.Item;
                ItemsBuffer.Item := ItemsBuffer.Next.Item;
                ItemsBuffer.Next.Item := TempItem;
            End;
            ItemsBuffer := ItemsBuffer.Next;
        End;
    End;
End;

Procedure InputItemsInGreed(StGrid: TStringGrid; Items: TItemNode);
Var
    ItemsBuffer: TItemNode;
    ItemsCounter, I: Integer;
Begin
    ItemsBuffer := Items;
    ItemsCounter := SearchItemsCounter(Items);
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
        StGrid.Cells[0, I] := WideCharToStr(ItemsBuffer.Item.ProdGroup);
        StGrid.Cells[1, I] := WideCharToStr(ItemsBuffer.Item.ProdBrand);
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

Procedure DeleteItem(RecordNumber: Integer);
Var
    ItemsBuffer, ItemsTemp: TItemNode;
    I: Integer;
Begin
    //поиск удаляемого узла
    ItemsTemp := ItemsHead;
    For I := 1 To RecordNumber - 1 Do
        If ItemsTemp.Next <> Nil Then
            ItemsTemp := ItemsTemp.Next;
    //проверка на самый левый
    If (ItemsTemp.Prev <> Nil) Then
        ItemsTemp.Prev.Next := ItemsTemp.Next;
    //проверка на самый правый
    If (ItemsTemp.Next <> Nil) Then
        ItemsTemp.Next.Prev := ItemsTemp.Prev;
    //проверка головы
    ItemsBuffer := ItemsTemp;
    If (ItemsTemp.Prev = Nil) Then
        ItemsHead := ItemsHead.Next;
    //освобождение памяти
    Dispose(ItemsBuffer);
    //уменешние счётчика
    ItemsCounter := ItemsCounter - 1;
    //проверка на пустой список
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

    IsDataExist := (EmployersBuffer.Employe.Hours <> Hours) Or (EmployersBuffer.Employe.Post <> StrToWideChar(Post)) Or
        (EmployersBuffer.Employe.Name <> StrToWideChar(Name)) Or (EmployersBuffer.Employe.Code <> Code);
    MainForm.SaveLists.Enabled := IsDataExist;

    EmployersBuffer.Employe.Hours := Hours;
    EmployersBuffer.Employe.Post := StrToWideChar(Post);
    EmployersBuffer.Employe.Name := StrToWideChar(Name);
    EmployersBuffer.Employe.Code := Code;
End;

Function AllDeletedItemsIndex(Index: Integer): TArrayOfIndex;
Var
    ResArr, TempArr: TArrayOfIndex;
    TempItem: TItemNode;
    TempEmploy: TEmployeNode;
    I, Code, Curent: Integer;
Begin
    SetLength(ResArr, 0);
    TempEmploy := EmployersHead;
    For I := 1 To Index - 1 Do
        If TempEmploy.Next <> Nil Then
            TempEmploy := TempEmploy.Next;
    Code := TempEmploy.Employe.Code;
    Curent := 1;
    TempItem := ItemsHead;
    While (TempItem <> Nil) Do
    Begin
        If TempItem.Item.ExecutorCode = Code Then
        Begin
            SetLength(TempArr, Length(ResArr) + 1);
            For I := Low(ResArr) To High(ResArr) Do
                TempArr[I] := ResArr[I];
            TempArr[High(TempArr)] := Curent;
            SetLength(ResArr, Length(TempArr));
            For I := Low(TempArr) To High(TempArr) Do
                ResArr[I] := TempArr[I];
        End;
        Inc(Curent);
        TempItem := TempItem.Next;
    End;
    AllDeletedItemsIndex := ResArr;
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

    IsDataExist := (ItemsBuffer.Item.ProdGroup <> StrToWideChar(Group)) Or (ItemsBuffer.Item.ProdBrand <> StrToWideChar(Brand)) Or
        (ItemsBuffer.Item.AcceptanceDate <> Date) Or (ItemsBuffer.Item.ExecutorCode <> Code) Or (ItemsBuffer.Item.OrderStatus <> Status);
    MainForm.SaveLists.Enabled := IsDataExist;

    ItemsBuffer.Item.ProdGroup := StrToWideChar(Group);
    ItemsBuffer.Item.ProdBrand := StrToWideChar(Brand);
    ItemsBuffer.Item.AcceptanceDate := Date;
    ItemsBuffer.Item.ExecutorCode := Code;
    ItemsBuffer.Item.OrderStatus := Status;
End;

Function IsEmployerExist(LabelText: String): Boolean;
Var
    EmployersBuffer: TEmployeNode;
    IsExist: Boolean;
Begin
    EmployersBuffer := EmployersHead;
    IsExist := False;
    While (EmployersBuffer <> Nil) Do
    Begin
        If (EmployersBuffer.Employe.Code = StrToInt(LabelText)) Then
            IsExist := True;
        EmployersBuffer := EmployersBuffer.Next;
    End;
    IsEmployerExist := IsExist;
End;

Function SearchEmployers(Index: Integer; LabelText: String): TEmployeNode;
Var
    EmployersBuffer: TEmployeNode;
    ResNodeHead, ResNodeTail: TEmployeNode;
Begin
    ResNodeHead := Nil;
    ResNodeTail := ResNodeHead;
    EmployersBuffer := EmployersHead;
    Case Index Of
        Integer(TEmployersIndex.Code):
            While (EmployersBuffer <> Nil) Do
            Begin
                If (IntToStr(EmployersBuffer.Employe.Code) = LabelText) Then
                    AddEmployeInList(ResNodeHead, ResNodeTail, EmployersBuffer);
                EmployersBuffer := EmployersBuffer.Next;
            End;
        Integer(TEmployersIndex.Name):
            While (EmployersBuffer <> Nil) Do
            Begin
                If (WideCharToStr(EmployersBuffer.Employe.Name) = LabelText) Then
                    AddEmployeInList(ResNodeHead, ResNodeTail, EmployersBuffer);
                EmployersBuffer := EmployersBuffer.Next;
            End;
        Integer(TEmployersIndex.Post):
            While (EmployersBuffer <> Nil) Do
            Begin
                If (WideCharToStr(EmployersBuffer.Employe.Post) = LabelText) Then
                    AddEmployeInList(ResNodeHead, ResNodeTail, EmployersBuffer);
                EmployersBuffer := EmployersBuffer.Next;
            End;
        Integer(TEmployersIndex.Hours):
            While (EmployersBuffer <> Nil) Do
            Begin
                If (IntToStr(EmployersBuffer.Employe.Hours) = LabelText) Then
                    AddEmployeInList(ResNodeHead, ResNodeTail, EmployersBuffer);
                EmployersBuffer := EmployersBuffer.Next;
            End;
    End;
    SearchEmployers := ResNodeHead;
End;

Function SearchItems(Index: Integer; LabelText: String; Date: TDate; Status: Boolean): TItemNode;
Var
    BufferItems: TItemNode;
    ResNodeHead, ResNodeTail: TItemNode;
Begin
    BufferItems := ItemsHead;
    ResNodeHead := Nil;
    ResNodeTail := ResNodeHead;
    Case Index Of
        Integer(TItemsIndex.Group):
            While (BufferItems <> Nil) Do
            Begin
                If (WideCharToStr(BufferItems.Item.ProdGroup) = LabelText) Then
                    AddItemInList(ResNodeHead, ResNodeTail, BufferItems);
                BufferItems := BufferItems.Next;
            End;
        Integer(TItemsIndex.Brand):
            While (BufferItems <> Nil) Do
            Begin
                If (WideCharToStr(BufferItems.Item.ProdBrand) = LabelText) Then
                    AddItemInList(ResNodeHead, ResNodeTail, BufferItems);
                BufferItems := BufferItems.Next;
            End;
        Integer(TItemsIndex.ItemDate):
            While (BufferItems <> Nil) Do
            Begin
                If (BufferItems.Item.AcceptanceDate = Date) Then
                    AddItemInList(ResNodeHead, ResNodeTail, BufferItems);
                BufferItems := BufferItems.Next;
            End;
        Integer(TItemsIndex.Executor):
            While (BufferItems <> Nil) Do
            Begin
                If (IntToStr(BufferItems.Item.ExecutorCode) = LabelText) Then
                    AddItemInList(ResNodeHead, ResNodeTail, BufferItems);
                BufferItems := BufferItems.Next;
            End;
        Integer(TItemsIndex.Status):
            While (BufferItems <> Nil) Do
            Begin
                If (BufferItems.Item.OrderStatus = Status) Then
                    AddItemInList(ResNodeHead, ResNodeTail, BufferItems);
                BufferItems := BufferItems.Next;
            End;
    End;
    SearchItems := ResNodeHead;
End;

Procedure SortCodesByLexical(Var ArrOfCodes: TArrOfCodes);
Var
    I, J: Integer;
    Temp: String;
Begin
    For I := Low(ArrOfCodes) To High(ArrOfCodes) Do
        For J := Low(ArrOfCodes) To High(ArrOfCodes) - I - 1 Do
            If (ArrofCodes[J] > ArrofCodes[J + 1]) And (Length(ArrofCodes[J]) >= Length(ArrofCodes[J + 1])) Then
            Begin
                Temp := ArrOfCodes[J];
                ArrofCodes[J] := ArrofCodes[J + 1];
                ArrOfCodes[J + 1] := Temp;
            End;
End;

Function SearchInfoAboutEmployer(MinDate, MaxDate: TDate; Code: Integer): TItemNode;
Var
    HeadItem, TailItem, TempItem: TItemNode;
    IsCorrect: Boolean;
Begin
    HeadItem := Nil;
    TailItem := HeadItem;
    TempItem := ItemsHead;
    While TempItem <> Nil Do
    Begin
        IsCorrect := TempItem.Item.ExecutorCode = Code;
        IsCorrect := IsCorrect And Not(CompareDateTime(TempItem.Item.AcceptanceDate, MinDate) < 0);
        IsCorrect := IsCorrect And Not(CompareDateTime(TempItem.Item.AcceptanceDate, MaxDate) > 0);
        IsCorrect := IsCorrect And TempItem.Item.OrderStatus;

        If IsCorrect Then
            AddItemInList(HeadItem, TailItem, TempItem);

        TempItem := TempItem.Next;
    End;
    SearchInfoAboutEmployer := HeadItem;
End;

Function AllEmloyersCodes: TArrOfCodes;
Var
    BufHead: TEmployeNode;
    ArrOfCodes: TArrOfCodes;
    I: Integer;
Begin
    SetLength(ArrOfCodes, SearchEmployersCounter(EmployersHead));
    BufHead := EmployersHead;
    I := 0;
    While BufHead <> Nil Do
    Begin
        ArrOfCodes[I] := IntToStr(BufHead.Employe.Code);
        Inc(I);
        BufHead := BufHead.Next;
    End;
    SortCodesByLexical(ArrOfCodes);
    AllEmloyersCodes := ArrOfCodes;
End;

End.
