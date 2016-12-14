unit win95;

interface
Uses Classes, ShellApi, ShlObj, Registry, Windows, SysUtils, Messages;
type
  Str10  = String[10];

Const
  fpRootKey ='\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders';
  fpDesktop   : Str10 = 'Desktop';
  fpFavorites : Str10 = 'FAVORITES';
  fpFonts     : Str10 = 'FONTS';
  fpPersonal  : Str10 = 'PERSONAL';
  fpPrograms  : Str10 = 'PROGRAMS';
  fpRecent    : Str10 = 'RECENT';
  fpSendTo    : Str10 = 'SENDTO';
  fpStartMenu : Str10 = 'Start Menu';
  fpStartup   : Str10 = 'Startup';
  fpTemplates : Str10 = 'TEMPLATES';


{Windows Paths}
function GetFolderPath(Const FolderName: Str10): String;

{Files functions}
procedure Win95AddToRecentDocs(Const Filename: string);
procedure Win95ClearRecentDocs;

{To allow multiple source files, replace spaces with #0}
function Win95Copy(Owner: Integer;  FromFile,ToFile: String; RenameOnCollision, Confirm: boolean): Boolean;
function Win95Move(Owner: Integer;  FromFile,ToFile: String; RenameOnCollision, Confirm: boolean): Boolean;

{If SendToRecycleBin is true then files will be sent to Windows RecycleBin else they will be wiped out}
function Win95Erase(Owner: Integer;  WichFiles: String; SendToRecycleBin, Confirm: Boolean): Boolean;


{returns TRUE if  small fonts are set, FALSE if using Large Fonts }
Function SmallFonts : BOOLEAN;

{Font loading and unloading function.}
function LoadFont(sFontFileName: string; bLoadIt: boolean): boolean;

implementation

function GetFolderPath(Const FolderName: Str10): String;
begin
  with TRegistry.Create do
    Try
      RootKey:=HKEY_CURRENT_USER;
      OpenKey(fpRootKey,False);
      Result:=ReadString(FolderName);
    finally
      Free;
    end;
end;

procedure Win95AddToRecentDocs(Const Filename: string);
begin
  SHAddToRecentDocs(SHARD_PATH, @Filename[1]);
end;

procedure Win95ClearRecentDocs;
begin
  SHAddToRecentDocs(SHARD_PATH, nil);
end;

function Win95Copy(Owner: Integer; FromFile,ToFile: String; RenameOnCollision, Confirm: boolean): Boolean;
const
  Aborted: Boolean = False;
var
  Struct : TSHFileOpStructA;
begin
  While pos(';',FromFile)>0 do
    FromFile[pos(';',FromFile)]:=#0;
  While pos(';',ToFile)>0 do
    ToFile[pos(';',ToFile)]:=#0;
  FromFile:=FromFile+#0#0;
  ToFile:=ToFile+#0#0;
  with Struct do
    begin
      wnd         :=Owner;
      wFunc       :=FO_Copy;
      pFrom       :=PChar(FromFile);
      pTo         :=PChar(ToFile);
      fFlags:=FOF_ALLOWUNDO or FOF_FILESONLY;
      If RenameOnCollision then
        fFLags:=fFlags or FOF_RENAMEONCOLLISION;
      If not Confirm then
        fFLags:=fFlags or FOF_NOCONFIRMATION;
      fAnyOperationsAborted:=Aborted;
      hNameMappings:=nil;
      lpszProgressTitle:=nil;
    end;
  result:=(SHFileOperationA(Struct)=0) and (not Aborted);
end;

function Win95Move(Owner: Integer;  FromFile,ToFile: String; RenameOnCollision, Confirm: boolean): Boolean;
const
  Aborted: Boolean = False;
var
  Struct : TSHFileOpStructA;
begin

  While pos(';',FromFile)>0 do
    FromFile[pos(';',FromFile)]:=#0;
  While pos(';',ToFile)>0 do
    ToFile[pos(';',ToFile)]:=#0;

  FromFile:=FromFile+#0#0;
  ToFile:=ToFile+#0#0;
  with Struct do
    begin
      wnd         :=Owner;
      wFunc       :=FO_Move;
      pFrom       :=PChar(FromFile);
      pTo         :=PChar(ToFile);
      fFlags:=FOF_ALLOWUNDO or FOF_FILESONLY;
      If RenameOnCollision then
        fFLags:=fFlags or FOF_RENAMEONCOLLISION;
      If Confirm then
        fFLags:=fFlags or FOF_NOCONFIRMATION;
      fAnyOperationsAborted:=Aborted;
      hNameMappings:=nil;
      lpszProgressTitle:=nil;
    end;
  result:=(SHFileOperationA(Struct)=0) and (not Aborted);
end;

function Win95Erase(Owner: Integer;  WichFiles: String;  SendToRecycleBin, Confirm: Boolean): Boolean;
const
  Aborted: Boolean = False;
var
  Struct : TSHFileOpStructA;
begin
  While pos(';',WichFiles)>0 do
    WichFiles[pos(';',WichFiles)]:=#0;
  WichFiles:=WichFiles+#0#0;
  with Struct do
    begin
      wnd         :=Owner;
      wFunc       :=FO_Delete;
      pFrom       :=PChar(WichFiles);
      pTo         :=nil;
      fFLags      :=0;
      If not Confirm then
        fFlags:=FOF_NOCONFIRMATION;
      If SendToRecycleBin then
        fFLags:=fFlags or FOF_ALLOWUNDO or FOF_FILESONLY
      else
        fFlags:=fFlags or 0 or FOF_FILESONLY;
      fAnyOperationsAborted:=Aborted;
      hNameMappings:=nil;
      lpszProgressTitle:=nil;
    end;
  result:=(SHFileOperationA(Struct)=0) and (not Struct.fAnyOperationsAborted);
end;


Function SmallFonts : BOOLEAN;
{returns TRUE if  small fonts are set, FALSE if using Large Fonts }
VAR
  DC : HDC; { used to check for number of colors available }
BEGIN
  DC := GetDC(0);
  Result :=   (GetDeviceCaps(DC, LOGPIXELSX) = 96);
  { LOGPIXELSX will = 120 if large fonts are in use }
  ReleaseDC(0, DC);
END;


{Font loading and unloading function.}
function LoadFont(sFontFileName: string; bLoadIt: boolean): boolean;
var sFontRes: string;
begin
result := TRUE;

if bLoadIt then
 begin
  {Load the font.}
  if FileExists( sFontFileName ) then
     begin
       sFontRes := sFontFileName + #0;
       if AddFontResource( @sFontRes[1] ) = 0
            then result := FALSE
            else SendMessage( HWND_BROADCAST, WM_FONTCHANGE, 0, 0 );
     end else result:=false;
 end
 else
 begin
  {Unload the font.}
  sFontRes := sFontFileName + #0;
  result   := RemoveFontResource( @sFontRes[1] );
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
 end;
end; {LoadFont}


end.


