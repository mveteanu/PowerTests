unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmp_TTranslator, cmp_TInstallContainer, cmp_TInstall, cmp_TPathSpecifier,
  dlgcmp_TBaseDlg, cmp_TInstallShellLink, cmp_TNetInstallLocation,
  StdCtrls, cmp_Rotate3DLabel, ExtCtrls, cmp_TBackDrop, cmp_TUninstallEXE;

type
  TForm1 = class(TForm)
    psBDEDLL: TpsBDEDLL;
    psCommonFiles: TpsCommonFiles;
    psContainerArchiveFile: TpsContainerArchiveFile;
    psContainerDestDir: TpsContainerDestDir;
    psDesktopMenu: TpsDesktopMenu;
    psInstallSource: TpsInstallSource;
    psMainInstall: TpsMainInstall;
    psProgramFiles: TpsProgramFiles;
    psProgramMenu: TpsProgramMenu;
    psStartMenu: TpsStartMenu;
    psStartupMenu: TpsStartupMenu;
    psSystem: TpsSystem;
    psMainArchiveFile: TpsMainArchiveFile;
    psWindow: TpsWindow;
    MainTranslator: TTranslator;
    Install1: TInstall;
    psFileContainer: TpsFileContainer;
    idMiscellaneous: TInstallDirectory;
    ifUninstallEXE: TUninstallEXE;
    BackDrop: TBackdrop;
    ProductLabel: TRotate3DLabel;
    psFileContainer1: TpsFileContainer;
    Directory: TInstallDirectory;
    InstallFile2: TInstallFile;
    InstallFile3: TInstallFile;
    psFileContainer2: TpsFileContainer;
    Directory1: TInstallDirectory;
    InstallFile4: TInstallFile;
    InstallFile5: TInstallFile;
    InstallFile6: TInstallFile;
    InstallFile7: TInstallFile;
    InstallFile8: TInstallFile;
    InstallFile9: TInstallFile;
    InstallFile10: TInstallFile;
    psFileContainer3: TpsFileContainer;
    Directory2: TInstallDirectory;
    InstallFile12: TInstallFile;
    InstallFile13: TInstallFile;
    psFileContainer4: TpsFileContainer;
    Directory3: TInstallDirectory;
    InstallFile14: TInstallFile;
    InstallFile15: TInstallFile;
    InstallFile16: TInstallFile;
    InstallFile17: TInstallFile;
    InstallFile18: TInstallFile;
    InstallFile19: TInstallFile;
    InstallFile20: TInstallFile;
    InstallFile21: TInstallFile;
    InstallFile22: TInstallFile;
    InstallFile23: TInstallFile;
    InstallFile24: TInstallFile;
    InstallFile25: TInstallFile;
    InstallFile26: TInstallFile;
    InstallFile27: TInstallFile;
    InstallFile28: TInstallFile;
    InstallFile29: TInstallFile;
    InstallFile30: TInstallFile;
    InstallFile31: TInstallFile;
    InstallFile32: TInstallFile;
    InstallFile33: TInstallFile;
    InstallFile34: TInstallFile;
    InstallFile35: TInstallFile;
    InstallFile36: TInstallFile;
    InstallFile37: TInstallFile;
    InstallFile38: TInstallFile;
    InstallFile39: TInstallFile;
    InstallFile40: TInstallFile;
    InstallFile41: TInstallFile;
    InstallFile42: TInstallFile;
    InstallFile43: TInstallFile;
    InstallFile44: TInstallFile;
    InstallFile45: TInstallFile;
    InstallFile46: TInstallFile;
    InstallFile47: TInstallFile;
    InstallFile48: TInstallFile;
    InstallFile49: TInstallFile;
    InstallFile50: TInstallFile;
    InstallFile51: TInstallFile;
    InstallFile52: TInstallFile;
    InstallFile53: TInstallFile;
    InstallFile54: TInstallFile;
    InstallFile55: TInstallFile;
    InstallFile56: TInstallFile;
    InstallFile57: TInstallFile;
    InstallFile58: TInstallFile;
    InstallFile59: TInstallFile;
    InstallFile60: TInstallFile;
    InstallFile61: TInstallFile;
    InstallFile62: TInstallFile;
    InstallFile63: TInstallFile;
    InstallFile64: TInstallFile;
    InstallFile65: TInstallFile;
    InstallFile66: TInstallFile;
    InstallFile67: TInstallFile;
    InstallFile68: TInstallFile;
    InstallFile69: TInstallFile;
    InstallFile70: TInstallFile;
    InstallFile71: TInstallFile;
    InstallFile72: TInstallFile;
    InstallFile73: TInstallFile;
    InstallFile74: TInstallFile;
    InstallFile75: TInstallFile;
    InstallFile76: TInstallFile;
    InstallFile77: TInstallFile;
    InstallFile78: TInstallFile;
    InstallFile79: TInstallFile;
    InstallFile80: TInstallFile;
    InstallFile81: TInstallFile;
    InstallFile82: TInstallFile;
    InstallFile83: TInstallFile;
    InstallFile84: TInstallFile;
    InstallFile85: TInstallFile;
    InstallFile86: TInstallFile;
    InstallFile87: TInstallFile;
    InstallFile88: TInstallFile;
    InstallFile89: TInstallFile;
    InstallFile90: TInstallFile;
    InstallFile91: TInstallFile;
    InstallFile92: TInstallFile;
    InstallFile93: TInstallFile;
    InstallFile94: TInstallFile;
    InstallFile95: TInstallFile;
    InstallFile96: TInstallFile;
    InstallFile97: TInstallFile;
    InstallFile98: TInstallFile;
    InstallFile99: TInstallFile;
    InstallFile100: TInstallFile;
    InstallFile101: TInstallFile;
    InstallFile102: TInstallFile;
    InstallFile103: TInstallFile;
    NetLocation: TNetInstallLocation;
    MainFolder: TMainLinkGroup;
    psObjectLink: TpsObjectLink;
    InstallMainLink: TInstallMainLink;
    InstallMainLink1: TInstallMainLink;
    InstallMainLink2: TInstallMainLink;
    InstallMainLink3: TInstallMainLink;
    InstallShellLink: TInstallShellLink;
    DialogManager: TDialogManager;
    DialogManager1: TDialogManager;
    DialogManager2: TDialogManager;
    DialogManager3: TDialogManager;
    DialogManager4: TDialogManager;
    DialogManager5: TDialogManager;
    psFileContainer5: TpsFileContainer;
    Directory4: TInstallDirectory;
    InstallFile104: TInstallFile;
    InstallFile105: TInstallFile;
    InstallFile106: TInstallFile;
    InstallFile107: TInstallFile;
    InstallFile108: TInstallFile;
    InstallFile109: TInstallFile;
    InstallFile110: TInstallFile;
    InstallFile111: TInstallFile;
    InstallFile112: TInstallFile;
    InstallFile113: TInstallFile;
    InstallFile114: TInstallFile;
    InstallFile115: TInstallFile;
    InstallFile116: TInstallFile;
    InstallFile117: TInstallFile;
    InstallFile118: TInstallFile;
    InstallFile119: TInstallFile;
    InstallFile120: TInstallFile;
    InstallFile121: TInstallFile;
    InstallFile122: TInstallFile;
    InstallFile123: TInstallFile;
    InstallFile124: TInstallFile;
    InstallFile125: TInstallFile;
    InstallFile126: TInstallFile;
    InstallFile127: TInstallFile;
    InstallFile128: TInstallFile;
    InstallFile129: TInstallFile;
    InstallFile130: TInstallFile;
    InstallFile131: TInstallFile;
    InstallFile132: TInstallFile;
    InstallFile133: TInstallFile;
    InstallFile134: TInstallFile;
    InstallFile135: TInstallFile;
    InstallFile136: TInstallFile;
    InstallFile137: TInstallFile;
    InstallFile138: TInstallFile;
    InstallFile139: TInstallFile;
    InstallFile140: TInstallFile;
    InstallFile141: TInstallFile;
    InstallFile142: TInstallFile;
    InstallFile143: TInstallFile;
    InstallFile144: TInstallFile;
    InstallFile1441: TInstallFile;
    InstallFile145: TInstallFile;
    InstallMainLink4: TInstallMainLink;
    InstallFile146: TInstallFile;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
