unit AppDialogs;

{$mode ObjFPC}{$H+}

interface

//uses
//    Classes, SysUtils, Dialogs;
//
//type

    { TAppDialogsMod }
{
type TOpenOptions = set of (
  ofReadOnly,
  ofOverwritePrompt,  If selected file exists shows a message, that file will be overwritten.
  ofHideReadOnly,  hide read only file.
  ofNoChangeDir,  do not change current directory.
  ofShowHelp,  show a help button.
  ofNoValidate,
  ofAllowMultiSelect,  allow multiselection.
  ofExtensionDifferent,
  ofPathMustExist,  shows an error message if selected path does not exist.
  ofFileMustExist,  shows an error message if selected file does not exist.
  ofCreatePrompt,
  ofShareAware,
  ofNoReadOnlyReturn,  do not return filenames that are readonly.
  ofNoTestFileCreate,
  ofNoNetworkButton,
  ofNoLongNames,
  ofOldStyleDialog,
  ofNoDereferenceLinks,  do not resolve links while dialog is shown (only on Windows, see OFN_NODEREFERENCELINKS).
  ofNoResolveLinks,  do not resolve links after Execute.
  ofEnableIncludeNotify,
  ofEnableSizing,  dialog can be resized, e.g. via the mouse.
  ofDontAddToRecent,  do not add the path to the history list.
  ofForceShowHidden,  show hidden files.
  ofViewDetail,  details are OS and interface dependent.
  ofAutoPreview  OS and interface dependent.
);
}

//    TAppDialogsMod = class(TDataModule)
//        OpenDialog1: TOpenDialog;
//        procedure DataModuleCreate(Sender: TObject);
//    private
//
//    public
//       // function GetFileNameFromUser(anInitialFolder: string): string;
//    end;
//
//var
//    AppDialogsMod: TAppDialogsMod;
//
implementation
//
//{$R *.lfm}
//
//procedure TAppDialogsMod.DataModuleCreate(Sender: TObject);
//begin
//    if (AppDialogsMod <> nil) then
//    begin
//        OpenDialog1.Options := [ofFileMustExist, ofPathMustExist];
//    end;
//end;


{
openDialog.Filter :=
    'Delphi project files|*.dpr|Delphi pascal files|*.pas';
    // Select pascal files as the starting filter type
    openDialog.FilterIndex := 2;
}

//function TAppDialogsMod.GetFileNameFromUser(anInitialFolder: string): string;
//begin
//    Result := '';
//    if (anInitialFolder <> '') then
//    begin
//        OpenDialog1.InitialDir := anInitialFolder;
//    end;
//    if OpenDialog1.Execute then
//    begin
//        if fileExists(OpenDialog1.Filename) then
//        begin
//            Result := OpenDialog1.Filename;
//        end;
//    end;
//end;

end.
