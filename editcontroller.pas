unit EditController;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Controls, dbugintf, Forms,
    Dialogs, LCLType, SynEdit, SynEditHighlighterFoldBase, SynEditHighlighter,
    SynHighlighterPas, SynEditTypes, Highlighters, Graphics;

type

    { TEditController }

    ///////////////////////////////////////////////////////////
    TEditController = class
    private
        FCurrentFileName: string;
        FParentForm: TForm;
        FTextEditor: TSynEdit;
        FFindText: string;
        FOpenDialog: TOpenDialog;
        FSaveDialog: TSaveDialog;
        FHighlighter: TSynCustomHighlighter;
        procedure SetHighlighter(AValue: TSynCustomHighlighter);
        property ParentForm: TForm read FParentForm;
        property Highlighter: TSynCustomHighlighter read FHighlighter write SetHighlighter;
        //procedure UnloadCurrentFile(aTextEdit: TSynEdit);
    protected

    public
        constructor Create(aForm: TForm);
        destructor Destroy; override;
        //events
        procedure DoEditCopyAction();
        procedure DoEditCutAction();
        procedure DoEditPasteAction();
        procedure DoEditUndoAction();
        //procedure DoFileExitAction();
        procedure DoFileNewAction();
        procedure DoFileOpenAction();
        procedure DoFileSaveAction();
        procedure DoFileSaveAllAction();
        procedure DoFileSaveAsAction();
        procedure DoFindAction();
        procedure DoFindNextAction();
        procedure DoPrintAction();
        procedure DoPrintPageSetupAction();
        procedure DoPrintPreviewAction();
    end;

implementation

{$Region base}

///////////////////////////////////////////////////////////
constructor TEditController.Create(aForm: TForm);
begin
    //SendMethodEnter('TEditController.Create(aForm: TForm);');
    inherited Create;
    self.FParentForm := aForm;
    if (self.FTextEditor = nil) then
    begin
        self.FTextEditor := TSynEdit.Create(aForm);
        self.FTextEditor.Parent := aForm;
        self.FTextEditor.Align := alClient;
        self.FTextEditor.RightEdge := 120;
        with self.FTextEditor.Font do
        begin
            CharSet := ANSI_CHARSET;
            Size := 12;
            Name := 'Cascadia Code';
            Quality := fqDraft;
        end;
    end;
    //SendMethodExit('TEditController.Create(aForm: TForm);');
end;

///////////////////////////////////////////////////////////
destructor TEditController.Destroy;
begin
    //SendMethodEnter('TEditController.Destroy(AOwner: TComponent);');
    if self.FHighlighter <> nil then self.FHighlighter.Free;
    //SendMethodExit('TEditController.Destroy(AOwner: TComponent);');
    inherited;
end;

///////////////////////////////////////////////////////////
procedure TEditController.SetHighlighter(AValue: TSynCustomHighlighter);
begin
    if FHighlighter = AValue then
    begin
        Exit;
    end;
    FHighlighter := AValue;
    self.FTextEditor.Highlighter := AValue;
end;

///////////////////////////////////////////////////////////
//procedure TEditController.UnloadCurrentFile(aTextEdit: TSynEdit);
//begin
//    if FHighlighter <> nil then
//    begin
//         FTextEditor.Highlighter := nil;
//        FHighlighter.Free;
//    end;
//    FTextEditor.Lines.Clear;

//end;

{$EndRegion base}

{$Region event handlers}

///////////////////////////////////////////////////////////
procedure TEditController.DoEditCopyAction;
begin
    if not FTextEditor.SelAvail then
    begin
        FTextEditor.SelectWord;
    end;
    FTextEditor.CopyToClipboard;
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoEditCutAction;
begin
    if not FTextEditor.SelAvail then
    begin
        FTextEditor.SelectWord;
    end;
    FTextEditor.CutToClipboard;
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoEditPasteAction;
begin
    FTextEditor.PasteFromClipboard();
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoEditUndoAction;
begin
    FTextEditor.Undo;
end;

//procedure TEditController.DoFileExitAction;
//begin

//end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFileNewAction;
begin
    Dialogs.ShowMessage('Not implemented');
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFileOpenAction;
var
    aHighlighter: TSynCustomHighlighter;
begin
    if FOpenDialog = nil then
    begin
        FOpenDialog := TOpenDialog.Create(self.ParentForm);
    end;
    if FOpenDialog.Execute then
    begin
        if fileExists(FOpenDialog.Filename) then
        begin
            self.FCurrentFileName := FOpenDialog.Filename;
            self.FTextEditor.Lines.LoadFromFile(FCurrentFileName);
            self.ParentForm.Caption := FCurrentFileName;
            aHighlighter := GetHighlighterForFileType(FCurrentFileName);
            if aHighlighter <> nil then
            begin
                self.SetHighlighter(aHighlighter);
            end;
        end;
    end;
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFileSaveAction;
begin
    self.FTextEditor.Lines.SaveToFile(self.FCurrentFileName);
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFileSaveAllAction;
begin
    //self.FTextEditor.ExecuteAction();
    Dialogs.ShowMessage('Not implemented');
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFileSaveAsAction;
begin
    if FSaveDialog = nil then
    begin
        FSaveDialog := TSaveDialog.Create(self.ParentForm);
    end;
    if FSaveDialog.Execute then
    begin
        //if fileExists(FSaveDialog.Filename) then
        //begin
        //try
        self.FCurrentFileName := FSaveDialog.Filename;
        self.FTextEditor.Lines.SaveToFile(FSaveDialog.Filename);
        //except
        //    On EStreamError do
        //    begin
        //      Dialogs.ShowMessage('Exception:');
        //    end;
        //end;
        //end;
    end;
end;


//TSynSearchOption =
//  ( ssoMatchCase, ssoWholeWord,
//    ssoBackwards,
//    ssoEntireScope, ssoSelectedOnly,
//    ssoReplace, ssoReplaceAll,
//    ssoPrompt,
//    ssoSearchInReplacement,    // continue search-replace in replacement (with ssoReplaceAll) // replace recursive
//    ssoRegExpr, ssoRegExprMultiLine,
//    ssoFindContinue      // Assume the current selection is the last match, and start search behind selection
//                         // (before if ssoBackward) // Default is to start at caret (Only SearchReplace / SearchReplaceEx has start/end param)
//  );

///////////////////////////////////////////////////////////
procedure TEditController.DoFindAction;
begin
    FFindText := '';
    if FTextEditor.SelAvail then
    begin
        FFindText := FTextEditor.SelText;
    end
    else
    begin
        FFindText := InputBox('Find...', 'Please enter the text you want to find:', '');
    end;
    FTextEditor.SearchReplace(FFindText, '', [ssoEntireScope]);
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoFindNextAction;
begin
    FTextEditor.SearchReplace(FFindText, '', [ssoFindContinue]);
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoPrintAction;
begin
    Dialogs.ShowMessage('Not implemented');
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoPrintPageSetupAction;
begin
    Dialogs.ShowMessage('Not implemented');
end;

///////////////////////////////////////////////////////////
procedure TEditController.DoPrintPreviewAction;
begin
    Dialogs.ShowMessage('Not implemented');
end;

{$EndRegion event handlers}


end.
