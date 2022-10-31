unit Highlighters;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, SynEditHighlighterFoldBase, SynEditHighlighter,
    SynEditTypes, Graphics, dbugintf,
    SynHighlighterAny,
    SynHighlighterBat,
    SynHighlighterCpp,
    SynHighlighterCss,
    SynHighlighterDiff,
    SynHighlighterHTML,
    SynHighlighterIni,
    SynHighlighterJava,
    SynHighlighterJScript,
    SynHighlighterLFM,
    SynHighlighterMulti,
    SynHighlighterPas,
    SynHighlighterPerl,
    SynHighlighterPHP,
    SynHighLighterPo,
    SynHighlighterPython,
    SynHighlighterSQL,
    SynHighlighterTeX,
    SynHighlighterUnixShellScript,
    SynHighlighterVB,
    SynHighlighterXML;

function GetHighlighterForFileType(aFileName: string): TSynCustomHighlighter;

///////////////////////////////////////////////////////////
implementation

type

{$Region local highlighters}

    TAnyHiLighter = class(TSynAnySyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TBatHiLighter = class(TSynBatSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TCppHiLighter = class(TSynCppSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TCssHiLighter = class(TSynCssSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TDiffHiLighter = class(TSynDiffSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TFreePascalHiLighter = class(TSynFreePascalSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    THTMLHiLighter = class(TSynHTMLSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TIniHiLighter = class(TSynIniSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TJavaHiLighter = class(TSynJavaSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TJScriptHiLighter = class(TSynJScriptSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TLFMHiLighter = class(TSynLFMSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TMultiHiLighter = class(TSynMultiSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TPerlHiLighter = class(TSynPerlSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TPHPHiLighter = class(TSynPHPSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TPoHiLighter = class(TSynPoSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TPythonHiLighter = class(TSynPythonSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TSQLHiLighter = class(TSynSQLSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TTeXHiLighter = class(TSynTeXSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TUNIXShellScriptHiLighter = class(TSynUNIXShellScriptSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TVBHiLighter = class(TSynVBSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    TXMLHiLighter = class(TSynXMLSyn)
    public
        constructor Create(AOwner: TComponent); override;
    end;

    {$EndRegion local highlighters}


//    TFreePascalHiLighter = class(TSynFreePascalSyn);

//    SynHighlighterAny,
//    SynHighlighterBat,
//    SynHighlighterCpp,
//    SynHighlighterCss,
//    SynHighlighterDiff,
//    TFreePascalHiLighter,
//    SynHighlighterHTML,
//    SynHighlighterIni,
//    SynHighlighterJava,
//    SynHighlighterJScript,
//    SynHighlighterLFM,
//    SynHighlighterMulti,
//    SynHighlighterPas,
//    SynHighlighterPerl,
//    SynHighlighterPHP,
//    SynHighLighterPo,
//    SynHighlighterPython,
//    SynHighlighterSQL,
//    SynHighlighterTeX,
//    SynHighlighterUnixShellScript,
//    SynHighlighterVB,
//    SynHighlighterXML,


///////////////////////////////////////////////////////////
//GetHighlighterForFileExtension
///////////////////////////////////////////////////////////
function GetHighlighterForFileExtension(fileExt: string): TSynCustomHighlighter;
var
    //aHL: TSynFreePascalSyn;
    aHL: TComponent;
begin
    case fileExt of
        'htm', 'html':
        begin
            aHL := THTMLHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'c', 'cpp', 'cs', 'h', 'hpp', 'hh':
        begin
            aHL := TCppHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'pas', 'dpr', 'dpk', 'inc':
        begin
            aHL := TFreePascalHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'java':
        begin
            aHL := TJavaHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'pl', 'pm', 'cgi':
        begin
            aHL := TPerlHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'xml', 'xsd', 'xsl', 'xslt', 'dtd':
        begin
            aHL := TXMLHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'lfm':
        begin
            aHL := TLFMHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'sh':
        begin
            aHL := TUNIXShellScriptHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'css':
        begin
            aHL := TCssHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'php', 'php3', 'phtml':
        begin
            aHL := TPHPHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'tex':
        begin
            aHL := TTeXHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'sql':
        begin
            aHL := TSQLHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'py':
        begin
            aHL := TPythonHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'bat', 'cmd':
        begin
            aHL := TBatHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'ini':
        begin
            aHL := TIniHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'po':
        begin
            aHL := TPoHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
        end;
        'vb':
        begin
            aHL := TVBHiLighter.Create(nil);
            //TSynVBSyn(aHL).LoadFromFile('D:\ConfigVB.ini');
            Result := TSynCustomHighlighter(aHL);
        end;
        else
            aHL := TAnyHiLighter.Create(nil);
            Result := TSynCustomHighlighter(aHL);
    end;
end;



///////////////////////////////////////////////////////////
function GetHighlighterForFileType(aFileName: string): TSynCustomHighlighter;
var
    aFileExt: string;
    aHighlighter: TSynCustomHighlighter;
begin
    aFileExt := ExtractFileExt(aFileName);
    Delete(aFileExt, 1, 1);
    aHighlighter := GetHighlighterForFileExtension(aFileExt);
    //aHighlighter.LoadFromFile('D:\Config.ini');
    //SetSynHighlighterDefaults(TSynFreePascalSyn(aHighlighter));  //HACK:  this is a bug!
    //if aHighlighter is TSynFreePascalSyn then
    //begin
    //    SetSynFreePascalSynHighlighterDefaults(TSynFreePascalSyn(aHighlighter));
    //end;
    Result := aHighlighter;
end;




constructor TAnyHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        //AsmAttri.Foreground := clOlive;
        CommentAttri.Foreground := clGreen;
        ///IDEDirectiveAttri.Foreground := clFuchsia;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        NumberAttri.Foreground := clMaroon;
        StringAttri.Foreground := clPurple;
        SymbolAttri.Foreground := clBlue;
        //ProcedureHeaderName.Foreground := clBlue;
        //CaseLabelAttri.Foreground := clRed;
        //DirectiveAttri.Foreground := clTeal;
        //CompilerMode := pcmDelphi;
        //NestedComments := False;
        //TypeHelpers := True;
    end;
end;

constructor TBatHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        //AsmAttri.Foreground := clOlive;
        CommentAttri.Foreground := clGreen;
        //IDEDirectiveAttri.Foreground := clFuchsia;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        NumberAttri.Foreground := clMaroon;
        //StringAttri.Foreground := clPurple;
        //SymbolAttri.Foreground := clBlue;
        //ProcedureHeaderName.Foreground := clBlue;
        //CaseLabelAttri.Foreground := clRed;
        //DirectiveAttri.Foreground := clTeal;
        //CompilerMode := pcmDelphi;
        //NestedComments := False;
        //TypeHelpers := True;
        IdentifierAttri.Foreground := clBlack;
        VariableAttri.Foreground := clBlue;
    end;
end;

constructor TCppHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        AsmAttri.Foreground := clOlive;
        CommentAttri.Foreground := clGreen;
        DirecAttri.Foreground := clFuchsia;
        //IDEDirectiveAttri.Foreground := clFuchsia;
        //IdentifierAttri.Foreground := clFuchsia;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        NumberAttri.Foreground := clMaroon;
        StringAttri.Foreground := clPurple;
        SymbolAttri.Foreground := clBlue;
        //ProcedureHeaderName.Foreground := clBlue;
        //CaseLabelAttri.Foreground := clRed;
        //DirectiveAttri.Foreground := clTeal;
        //CompilerMode := pcmDelphi;
        //NestedComments := False;
        //TypeHelpers := True;
    end;
end;

constructor TCssHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TDiffHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TFreePascalHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        AsmAttri.Foreground := clOlive;
        CommentAttri.Foreground := clGreen;
        IDEDirectiveAttri.Foreground := clFuchsia;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        NumberAttri.Foreground := clMaroon;
        StringAttri.Foreground := clPurple;
        SymbolAttri.Foreground := clBlue;
        ProcedureHeaderName.Foreground := clBlue;
        CaseLabelAttri.Foreground := clRed;
        DirectiveAttri.Foreground := clTeal;
        CompilerMode := pcmDelphi;
        NestedComments := False;
        TypeHelpers := True;
    end;
    //self.LoadFromFile('D:\Config.ini');
end;

constructor THTMLHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        //AsmAttri.Foreground := clOlive;
        AndAttri.Foreground := clFuchsia;
        ASPAttri.Background := clYellow;
        CDATAAttri.Foreground := clNavy;
        CommentAttri.Foreground := clGreen;
        DOCTYPEAttri.Foreground := clNone;
        //IDEDirectiveAttri.Foreground := clFuchsia;
        IdentifierAttri.Foreground := clBlack;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        //NumberAttri.Foreground := clMaroon;
        //StringAttri.Foreground := clPurple;
        SymbolAttri.Foreground := clBlue;
        TextAttri.Foreground := clPurple;
        UndefKeyAttri.Foreground := clAqua;
        ValueAttri.Foreground := clTeal;
        //ProcedureHeaderName.Foreground := clBlue;
        //CaseLabelAttri.Foreground := clRed;
        //DirectiveAttri.Foreground := clTeal;
        //CompilerMode := pcmDelphi;
        //NestedComments := False;
        //TypeHelpers := True;
    end;
end;

constructor TIniHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TJavaHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TJScriptHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TLFMHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TMultiHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TPerlHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TPHPHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TPoHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TPythonHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TSQLHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TTeXHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TUNIXShellScriptHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;

constructor TVBHiLighter.Create(AOwner: TComponent);
begin
    inherited;
    with self do
    begin
        //AsmAttri.Foreground := clOlive;
        CommentAttri.Foreground := clGreen;
        //IDEDirectiveAttri.Foreground := clFuchsia;
        KeyAttri.Foreground := clRed;
        KeyAttri.Style := [];
        NumberAttri.Foreground := clMaroon;
        StringAttri.Foreground := clPurple;
        SymbolAttri.Foreground := clBlue;
        //ProcedureHeaderName.Foreground := clBlue;
        //CaseLabelAttri.Foreground := clRed;
        //DirectiveAttri.Foreground := clTeal;
        //CompilerMode := pcmDelphi;
        //NestedComments := False;
        //TypeHelpers := True;
    end;
end;

constructor TXMLHiLighter.Create(AOwner: TComponent);
begin
    inherited;
end;


/////////////////////////////////////////////////////////////
//procedure SetSynHighlighterDefaults(var aHighlighter: TSynCustomHighlighter);
////var
////    Highlighter: TSynPasSyn;
//begin
//    //Highlighter := TSynPasSyn.Create(nil);
//    try
//    with aHighlighter do
//    begin
//        //Enabled = False
//        AsmAttri.Foreground := clOlive;
//        CommentAttri.Foreground := clGreen;
//        IDEDirectiveAttri.Foreground := clFuchsia;
//        KeyAttri.Foreground := clRed;
//        KeyAttri.Style := [];
//        NumberAttri.Foreground := clMaroon;
//        StringAttri.Foreground := clPurple;
//        SymbolAttri.Foreground := clBlue;
//        ProcedureHeaderName.Foreground := clBlue;
//        CaseLabelAttri.Foreground := clRed;
//        DirectiveAttri.Foreground := clTeal;
//        CompilerMode := pcmDelphi;
//        NestedComments := False;
//        TypeHelpers := True;
//    end;
//    except
//      dbugintf.SendDebug('Exception in SetSynHighlighterDefaults()');
//    end;
//end;

/////////////////////////////////////////////////////////////
//procedure SetSynFreePascalSynHighlighterDefaults(var aHighlighter: TSynFreePascalSyn);
////var
////    Highlighter: TSynPasSyn;
//begin
//    //Highlighter := TSynPasSyn.Create(nil);
//    with aHighlighter do
//    begin
//        //Enabled = False
//        AsmAttri.Foreground := clOlive;
//        CommentAttri.Foreground := clGreen;
//        IDEDirectiveAttri.Foreground := clFuchsia;
//        KeyAttri.Foreground := clRed;
//        KeyAttri.Style := [];
//        NumberAttri.Foreground := clMaroon;
//        StringAttri.Foreground := clPurple;
//        SymbolAttri.Foreground := clBlue;
//        ProcedureHeaderName.Foreground := clBlue;
//        CaseLabelAttri.Foreground := clRed;
//        DirectiveAttri.Foreground := clTeal;
//        CompilerMode := pcmDelphi;
//        NestedComments := False;
//        TypeHelpers := True;
//    end;
//end;
//TAnyHiLighter = class(TSynAnySyn);
//TBatHiLighter = class(TSynBatSyn);
//TCppHiLighter = class(TSynCppSyn);
//TCssHiLighter = class(TSynCssSyn);
//TDiffHiLighter = class(TSynDiffSyn);
//TFreePascalHiLighter = class(TSynFreePascalSyn);
//THTMLHiLighter = class(TSynHTMLSyn);
//TIniHiLighter = class(TSynIniSyn);
//TJavaHiLighter = class(TSynJavaSyn);
//TJScriptHiLighter = class(TSynJScriptSyn);
//TLFMHiLighter = class(TSynLFMSyn);
//TMultiHiLighter = class(TSynMultiSyn);
//TPerlHiLighter = class(TSynPerlSyn);
//TPHPHiLighter = class(TSynPHPSyn);
//TPoHiLighter = class(TSynPoSyn);
//TPythonHiLighter = class(TSynPythonSyn);
//TSQLHiLighter = class(TSynSQLSyn);
//TTeXHiLighter = class(TSynTeXSyn);
//TUNIXShellScriptHiLighter = class(TSynUNIXShellScriptSyn);
//TVBHiLighter = class(TSynVBSyn);
//TXMLHiLighter = class(TSynXMLSyn);


end.
