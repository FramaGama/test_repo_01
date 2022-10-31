unit MainForm;

{$mode objfpc}{$H+}

//{$DEFINE dodebug}

interface

///////////////////////////////////////////////////////////
uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList,
    Menus, ComCtrls, dbugintf, EditController;

type

    ///////////////////////////////////////
    TAppMainForm = class(TForm)
        procedure FormDestroy(Sender: TObject);
    private
        EditController: TEditController;

    published
        FindNextAction1: TAction;
        FindAction1: TAction;
        EditUndoAction1: TAction;
        EditPasteAction1: TAction;
        EditCopyAction1: TAction;
        EditCutAction1: TAction;
        FileExitAction1: TAction;
        MainMenu1: TMainMenu;
        FileMenu: TMenuItem;
        FileNewMenuItem: TMenuItem;
        EditMenu: TMenuItem;
        EditCutMenuItem: TMenuItem;
        EditCopyMenuItem: TMenuItem;
        EditPasteMenuItem: TMenuItem;
        EditUndoMenuItem: TMenuItem;
        FindMenuItem: TMenuItem;
        FindNextMenuItem: TMenuItem;
        FileOpenMenuItem: TMenuItem;
        FileSaveMenuItem: TMenuItem;
        FileSaveAsMenuItem: TMenuItem;
        FileSaveAllMenuItem: TMenuItem;
        PageSetupMenuItem: TMenuItem;
        PrintPreviewMenuItem: TMenuItem;
        PrintMenuItem: TMenuItem;
        ExitMenuItem: TMenuItem;
        PrintAction1: TAction;
        PrintPreviewAction1: TAction;
        PrintPageSetupAction1: TAction;
        FileSaveAllAction1: TAction;
        FileSaveAsAction1: TAction;
        FileSaveAction1: TAction;
        FileOpenAction1: TAction;
        FileNewAction1: TAction;
        ActionList1: TActionList;
        ImageList1: TImageList;
        Separator1: TMenuItem;
        Separator2: TMenuItem;
        Separator3: TMenuItem;
        Separator4: TMenuItem;
        StatusBar1: TStatusBar;
        ToolBar1: TToolBar;
        FileNewButton: TToolButton;
        FileOpenButton: TToolButton;
        FileSaveButton: TToolButton;
        FileSaveAllButton: TToolButton;
        Separator1Button: TToolButton;
        EditCutButton: TToolButton;
        EditCopyButton: TToolButton;
        EditPasteButton: TToolButton;
        ///////////////////////////////////////


        ///////////////////////////////////////
        procedure EditCopyAction1Execute(Sender: TObject);
        procedure EditCutAction1Execute(Sender: TObject);
        procedure EditPasteAction1Execute(Sender: TObject);
        procedure EditUndoAction1Execute(Sender: TObject);
        procedure FileExitAction1Execute(Sender: TObject);
        procedure FileNewAction1Execute(Sender: TObject);
        procedure FileOpenAction1Execute(Sender: TObject);
        procedure FileSaveAction1Execute(Sender: TObject);
        procedure FileSaveAllAction1Execute(Sender: TObject);
        procedure FileSaveAsAction1Execute(Sender: TObject);
        procedure FindAction1Execute(Sender: TObject);
        procedure FindNextAction1Execute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure PrintAction1Execute(Sender: TObject);
        procedure PrintPageSetupAction1Execute(Sender: TObject);
        procedure PrintPreviewAction1Execute(Sender: TObject);

    private

    public

    end;

///////////////////////////////////////
var
    AppMainForm: TAppMainForm;

///////////////////////////////////////////////////////////
implementation
///////////////////////////////////////////////////////////

{$R *.lfm}

///////////////////////////////////////////////////////////
procedure TAppMainForm.FormCreate(Sender: TObject);
begin
    //{$ifdef dodebug} SendMethodEnter('TAppMainForm.FormCreate(Sender: TObject);'); {$endif}
    //SendMethodEnter('TAppMainForm.FormCreate(Sender: TObject);');
    self.EditController := TEditController.Create(self);
    //SendMethodExit('TAppMainForm.FormCreate(Sender: TObject);');
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FormDestroy(Sender: TObject);
begin
    self.EditController.Destroy;
    self.EditController := nil;
end;

{$Region event handlers}

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileNewAction1Execute(Sender: TObject);
begin
    self.EditController.DoFileNewAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileOpenAction1Execute(Sender: TObject);
//var
//aFileName: string;
begin
    self.EditController.DoFileOpenAction();
    //aFileName :=
    //self.EditController.DoFileOpenAction(self.TextEditor.Lines);
    //if (aFileName <> '') then
    //begin
    //  self.TextEditor.Lines.LoadFromFile(aFileName);
    //end;
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileSaveAction1Execute(Sender: TObject);
begin
    self.EditController.DoFileSaveAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileSaveAsAction1Execute(Sender: TObject);
begin
    self.EditController.DoFileSaveAsAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileSaveAllAction1Execute(Sender: TObject);
begin
    self.EditController.DoFileSaveAllAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FileExitAction1Execute(Sender: TObject);
begin
    //self.EditController.DoFileExitAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.PrintPageSetupAction1Execute(Sender: TObject);
begin
    self.EditController.DoPrintPageSetupAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.PrintPreviewAction1Execute(Sender: TObject);
begin
    self.EditController.DoPrintPreviewAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.PrintAction1Execute(Sender: TObject);
begin
    self.EditController.DoPrintAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FindAction1Execute(Sender: TObject);
begin
    self.EditController.DoFindAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.FindNextAction1Execute(Sender: TObject);
begin
    self.EditController.DoFindNextAction();
end;


///////////////////////////////////////////////////////////
procedure TAppMainForm.EditCutAction1Execute(Sender: TObject);
begin
    self.EditController.DoEditCutAction();
end;


///////////////////////////////////////////////////////////
procedure TAppMainForm.EditCopyAction1Execute(Sender: TObject);
begin
    self.EditController.DoEditCopyAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.EditPasteAction1Execute(Sender: TObject);
begin
    self.EditController.DoEditPasteAction();
end;

///////////////////////////////////////////////////////////
procedure TAppMainForm.EditUndoAction1Execute(Sender: TObject);
begin
    self.EditController.DoEditUndoAction();
end;

{$EndRegion event handlers}

end.
