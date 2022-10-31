unit EventHandlers;

{$mode ObjFPC}{$H+}

interface

uses Dialogs, AppDialogs, MainForm, Classes;

procedure DoFileNewAction(Sender: TObject);
//function DoFileOpenAction(Sender: TObject): string;  //
//procedure DoFileOpenAction(theStrings: TStrings);
procedure DoFileSaveAction(theStrings: TStrings);
procedure DoFileSaveAsAction(Sender: TObject);
procedure DoFileSaveAllAction(Sender: TObject);
procedure DoFileExitAction(Sender: TObject);
procedure DoPrintPageSetupAction(Sender: TObject);
procedure DoPrintPreviewAction(Sender: TObject);
procedure DoPrintAction(Sender: TObject);
procedure DoFindAction(Sender: TObject);
procedure DoFindNextAction(Sender: TObject);
procedure DoEditCutAction(Sender: TObject);
procedure DoEditCopyAction(Sender: TObject);
procedure DoEditPasteAction(Sender: TObject);
procedure DoEditUndoAction(Sender: TObject);


implementation

procedure DoFileNewAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

//function DoFileOpenAction(theStrings: TStrings);//aMainForm: TAppMainForm);
procedure DoFileOpenAction(theStrings: TStrings);
var
    aFileName: string;
begin
    aFileName := AppDialogsMod.GetFileNameFromUser('');
    //Result := afileName
    if (aFileName <> '') then
    begin
        theStrings.LoadFromFile(aFileName);
        //aMainForm.TextEditor1.Lines.LoadFromFile(aFileName);
    end;
end;

procedure DoFileSaveAction(theStrings: TStrings);
begin
     theStrings.SaveToFile('');
end;

procedure DoFileSaveAsAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoFileSaveAllAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoFileExitAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoPrintPageSetupAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoPrintPreviewAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoPrintAction(Sender: TObject);
begin
    ShowMessage('Not yet implemented.');
end;

procedure DoFindAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;
//
//procedure DoFindNextAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;
//
//procedure DoEditCutAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;
//
//procedure DoEditCopyAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;
//
//procedure DoEditPasteAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;
//
//procedure DoEditUndoAction(Sender: TObject);
//begin
//    ShowMessage('Not yet implemented.');
//end;

end.
