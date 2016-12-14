unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ToolEdit, ComCtrls, FileCtrl, Buttons, ExtCtrls,
  ActnList, ImgList, TB97Ctls, Wordcap, AMTipDlg;

type TestStructure   = record
                         // Numele fisierului .TST
                         FileName:string;

                         // Numele si domeniul testului
                         Name:string;
                         DomainShort:string;
                         DomainLong:string;

                         // Calea catre directorul cu probleme
                         PbsPath:string;

                         // Timpul de lucru
                         Time:integer;

                         // Problemele fixe declarate cu .problem
                         ListaProblemeFixe:string;

                         // Nr. de pb. aleatoare si criteriile de selectie
                         NrPbRandom:integer;
                         ListaCategorii:string;
                         Author:string;
                         Dificulty:integer;

                         // Comentariu
                         Comment:string;
                       end;

                      
Procedure LoadTesttoStructure(filename:string;var struct:TestStructure);
Function  SaveStructToFile(filename:string;struct:TestStructure):boolean;
Procedure ClearTestStrucure(var struct:TestStructure);

type TestDescription = record      // ar cam trebui sa sterg type-ul asta
                         FileName:string;  // si sa folosesc TestStructure
                         Name:string;        // in loc
                         DomainShort:string;
                         Author:string;
                         Time:integer;
                         Dificulty:integer;
                         NrPbRandom:integer;
                         NrProblems:integer;
                       end;


type TSettings=class
                 Sounds       : Boolean;
                 ShowTipOfDay : Boolean;
                 BrowserDir   : String;
                 Constructor Create;
                 Procedure   LoadFromRegistry;
                 Procedure   SaveToRegistry;
               end;


type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    Pag2: TTabSheet;
    Pag3: TTabSheet;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    About1: TMenuItem;
    FileListBox: TFileListBox;
    FixPbListBox: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label8: TLabel;
    pag4: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    NrRandom: TEdit;
    PopupMenu1: TPopupMenu;
    Editcategory1: TMenuItem;
    Etich1: TLabel;
    Etich2: TLabel;
    SaveDialog1: TSaveDialog;
    Help2: TMenuItem;
    Pag0: TTabSheet;
    pag5: TTabSheet;
    gruptime: TGroupBox;
    timeunlim: TRadioButton;
    timelim: TRadioButton;
    Time: TEdit;
    GroupBox7: TGroupBox;
    Memo1: TMemo;
    TabControl1: TTabControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    NewTstBut: TToolbarButton97;
    NewDomBut: TToolbarButton97;
    GroupBox5: TGroupBox;
    Memo2: TMemo;
    ListView2: TListView;
    TestMenu1: TPopupMenu;
    Newtest1: TMenuItem;
    Deletetest1: TMenuItem;
    Renametest1: TMenuItem;
    MenuItem1: TMenuItem;
    Sendtodomain1: TMenuItem;
    DomainMenu1: TPopupMenu;
    NewDomain1: TMenuItem;
    Deletedom1: TMenuItem;
    Renamedomain1: TMenuItem;
    ActionList1: TActionList;
    a_newtest: TAction;
    a_newdom: TAction;
    a_deldomain: TAction;
    a_deltest: TAction;
    a_rentest: TAction;
    a_rendom: TAction;
    ListViewPopUp: TPopupMenu;
    Newtest2: TMenuItem;
    Deletetests1: TMenuItem;
    Rentest1: TMenuItem;
    Sendtodomain2: TMenuItem;
    N2: TMenuItem;
    Newdom1: TMenuItem;
    Deldomain1: TMenuItem;
    Rendomain1: TMenuItem;
    DomainInfo: TLabel;
    Pag1: TTabSheet;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel1: TPanel;
    PbsListView: TListView;
    Splitter1: TSplitter;
    ListView4: TListView;
    SpeedButton4: TSpeedButton;
    SpeedButton12: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LabInfo9: TLabel;
    LabInfo1: TLabel;
    LabInfo2: TLabel;
    LabInfo3: TLabel;
    LabInfo4: TLabel;
    LabInfo5: TLabel;
    LabInfo6: TLabel;
    LabInfo7: TLabel;
    LabInfo8: TLabel;
    MSCaption: TMSOfficeCaption;
    Page1: TMenuItem;
    StartOpentest1: TMenuItem;
    Problemsfolder1: TMenuItem;
    Allwaysproblems1: TMenuItem;
    Randomproblems1: TMenuItem;
    Miscellaneous1: TMenuItem;
    EndSave1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    N3: TMenuItem;
    Openselectedtest1: TMenuItem;
    Closecurenttest1: TMenuItem;
    N4: TMenuItem;
    Openselectedtest2: TMenuItem;
    Closecurenttest2: TMenuItem;
    TipDialog: TAMTipDialog;
    Settings1: TMenuItem;
    Settings2: TMenuItem;
    Refreshlistoftests1: TMenuItem;
    N5: TMenuItem;
    Showtipofday1: TMenuItem;
    ImageList1: TImageList;
    ImageList2: TImageList;
    OpenBut: TSpeedButton;
    SpeedButton13: TSpeedButton;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    authoredit: TEdit;
    Label17: TLabel;
    Label12: TLabel;
    dificultyedit: TEdit;
    Label18: TLabel;
    GroupBox3: TGroupBox;
    ListView1: TListView;
    SpeedButton14: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure timeunlimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure dificultyeditKeyPress(Sender: TObject; var Key: Char);
    procedure NrRandomKeyPress(Sender: TObject; var Key: Char);
    procedure TimeKeyPress(Sender: TObject; var Key: Char);
    procedure Save1Click(Sender: TObject);
    procedure FileListBoxChange(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure TstNameChange(Sender: TObject);
    procedure DomainShortChange(Sender: TObject);
    procedure DomainLongChange(Sender: TObject);
    procedure NrRandomChange(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure authoreditChange(Sender: TObject);
    procedure dificultyeditChange(Sender: TObject);
    procedure TimeChange(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure a_newtestExecute(Sender: TObject);
    procedure a_newdomExecute(Sender: TObject);
    procedure a_deldomainExecute(Sender: TObject);
    procedure a_deltestExecute(Sender: TObject);
    procedure a_rentestExecute(Sender: TObject);
    procedure a_rendomExecute(Sender: TObject);
    procedure ListView2Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Memo2Enter(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure PbsListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListView4Enter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure OpenButClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton13Click(Sender: TObject);
    procedure StartOpentest1Click(Sender: TObject);
    procedure Problemsfolder1Click(Sender: TObject);
    procedure Allwaysproblems1Click(Sender: TObject);
    procedure Randomproblems1Click(Sender: TObject);
    procedure Miscellaneous1Click(Sender: TObject);
    procedure EndSave1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Openselectedtest1Click(Sender: TObject);
    procedure Closecurenttest1Click(Sender: TObject);
    procedure Openselectedtest2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure Refreshlistoftests1Click(Sender: TObject);
    procedure TipDialogExecuted(Sender: TObject; StartNextTime: Boolean);
    procedure Showtipofday1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Help2Click(Sender: TObject);
  private
    { Private declarations }


    li:array[1..51] of TListItem;
    Pages: array[0..51] of record
                             nrtst:integer;
                             longdescription:string;
                             tst:array[1..200] of TestDescription;
                           end;
    trvar1,trvar2,trvar3:integer;
    MyTest : TestStructure;
    OpenTab,OpenTst:Integer;

    MustSave:boolean;
    ListProblemsMustUpdated:boolean;
    ListCategoryMustUpdated:boolean;
    FontLoaded:boolean;

    procedure ListView2ItemEdited(Sender:TObject;Item:TListItem;var S:string);
    procedure FillMenuWithDomains;
    procedure DomainsListMnuHandler(Sender: TObject);
    procedure ShowTstInfo;
    Procedure ShowPage(pag:integer);
    Procedure ReadTests;
    Procedure NewDomain;
    Procedure DeleteDomain;
    Procedure NewTest;
    Procedure DeleteTest;
    Procedure RenameTest;
    Procedure RenameDomain;

    procedure NewTestAll;
    procedure UpdateTabFix;
    procedure UpdateTabRandom;
    procedure PutTestInControls(stru:TestStructure);
    procedure UpdateEtich;
    procedure AcceptaDoarNumere(Sender: TObject; var Key: Char);
    procedure ClearTestControls;
    procedure SeekCategories;
    function  SaveTestDlg:boolean;
    function  SaveTest(filename:string):boolean;
    procedure SeekPbsFolders;

    procedure winmsg(var msg:tmsg;var handled:boolean);
  public
    { Public declarations }
    TestsFolder:string;
  end;

var
  MainForm: TMainForm;
  TestInEdit: TestStructure;
  Settings: TSettings;


implementation
uses registry, mmsystem,
     fileutil, {fileutil din RX}
     problems,inppb,inpdom, win95, about, setform,
     uNagScreen;

{$R *.DFM}
{$R SOUNDS.RES}

const AboutID=99;

procedure TMainForm.winmsg(var msg:tmsg;var handled:boolean);
begin
  if msg.message=wm_syscommand then{if the message is a system one...}
   if msg.wparam = AboutID then ShowAboutBox;{then check if its parameter is AboutID,}
end;


function  GetLastSubdir(s:string):string;
var i:integer;
begin
 if s='' then begin
                result:='';
                exit;
              end;

 i:=Length(s);
 repeat
  if s[i]='\' then break;
  dec(i);
 until i=0;

 if i=0 then begin
                result:=s;
                exit;
              end;
 result:=Copy(s,i+1,Length(s)-i);
end;



procedure TMainForm.ClearTestControls;
begin
 FileListBox.Clear;
 FixPbListBox.Clear;

 ListView1.Items.Clear;

 NrRandom.Text:='0';
 AuthorEdit.Text:='';
 DificultyEdit.Text:='0';

 TimeUnLim.Checked:=false;
 TimeLim.Checked:=true;
 Time.Text:='60';

 Memo1.Clear;
end;


procedure TMainForm.Button1Click(Sender: TObject);
var i:integer;
begin
 if FileListBox.SelCount=-1 then exit;
 if FileListBox.Items.Count=0 then exit;

  i:=FileListBox.Items.Count-1;
  repeat
    if FileListBox.Selected[i] then
      if FixPBListbox.Items.IndexOf(FileListBox.Items[i])=-1 then
          begin
            FixPBListbox.Items.Add(FileListBox.Items[i]);
            FileListBox.Items.Delete(i);
          end;
    dec(i);
  until i<=-1;
 UpdateEtich;
 MustSave:=true;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var i:integer;
begin
 if FixPBListbox.SelCount=-1 then exit;
 if FixPBListbox.Items.Count=0 then exit;

 i:=FixPBListbox.Items.Count-1;
 repeat
   if FixPBListbox.Selected[i] then
      if FileListbox.Items.IndexOf(FixPBListBox.Items[i])=-1 then
          begin
            FileListbox.Items.Add(FixPBListBox.Items[i]);
            FixPBListBox.Items.Delete(i);
          end;
   dec(i);
 until i<=-1;
 UpdateEtich;
 MustSave:=true;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var i:integer;
begin
 if FileListBox.SelCount=-1 then exit;
 if FileListBox.Items.Count=0 then exit;

 for i:=0 to FileListBox.Items.Count-1 do
   if FixPBListbox.Items.IndexOf(FileListBox.Items[i])=-1 then
        FixPBListbox.Items.Add(FileListBox.Items[i]);
 FileListBox.Items.Clear;
 UpdateEtich;
 MustSave:=true;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var i:integer;
begin
 if FixPBListBox.SelCount=-1 then exit;
 if FixPBListBox.Items.Count=0 then exit;

 for i:=0 to FixPBListBox.Items.Count-1 do
   if FileListbox.Items.IndexOf(FixPBListBox.Items[i])=-1 then
        FileListbox.Items.Add(FixPBListBox.Items[i]);
 FixPBListBox.Items.Clear;
 UpdateEtich;
 MustSave:=true;
end;

procedure TMainForm.timeunlimClick(Sender: TObject);
begin
 if timeunlim.Checked then
   begin
     Time.Enabled:=false;
     TestInEdit.Time:=0;
   end
 else
   begin
     Time.Enabled:=true;
     try
      TestInEdit.Time:=StrToInt(Time.Text);
     except
      if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
      MessageDlg(NrRandom.Text+' nu este un numar intreg valid',mtError,[mbOK],0);
      Time.Text:='60';
     end;
   end;
 MustSave:=true;
end;

procedure TMainForm.SeekCategories;
var i:integer;
    p1:TProblem;
    ts:TStringList;
    sr:TSearchRec;found:integer;
begin
 ListView1.Items.Clear;

 ts := TStringList.Create;

 Found := FindFirst(ExtractFilePath(TestsFolder+'\'+TestInEdit.PbsPath+'\')+'*.pb', faReadOnly+faArchive, sr);
 while (Found = 0) do
   begin
    p1:=TProblem.Create(ExtractFilePath(TestsFolder+'\'+TestInEdit.PbsPath+'\')+sr.name);
    p1.LoadDescriptions;
    if (p1.Category<>'')and(ts.IndexOf(p1.Category)=-1) then ts.Add(p1.Category);
    p1.free;
    Found := FindNext(SR);
   end;
 FindClose(SR);

 for i:=0 to ts.Count-1 do
   begin
      ListView1.Items.Add;
      ListView1.Items[i].ImageIndex:=3;
      ListView1.Items[i].Caption:=ts.Strings[i];
      ListView1.Items[i].SubItems.Add('Nelimitata');
   end;

 ts.free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 fontloaded:=false;
 if not LoadFont(extractfilepath(Application.ExeName)+'times.ttf',true)
   then MessageDlg('Can not load Times New Roman font.'#13#10+
              'The program will work, but some text may be not proportional.',
              mtWarning,[mbOK],0)
   else fontloaded:=true;

 Application.HelpFile:=ExtractFilePath(paramstr(0))+'powtests.hlp';

 NewTestAll;

 Settings:=TSettings.Create;
 Settings.LoadFromRegistry;
 TestsFolder:=RemoveBackSlash(Settings.BrowserDir);
 if not DirExists(TestsFolder) then
   begin
     if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
     MessageDlg(Format('Tests folder %s is invalid.'#13#10'Using default folder: %s',[TestsFolder,ExtractFilePath(ParamStr(0))+'Tests']),mtError,[mbOK],0);
     TestsFolder:=ExtractFilePath(ParamStr(0))+'Tests';
   end;

 ReadTests;
 SeekPbsFolders;

 application.onmessage:=winmsg;
 AppendMenu(GetSystemMenu(MainForm.handle,false),mf_separator,0,'');
 AppendMenu(GetSystemMenu(MainForm.handle,false),mf_byposition,AboutID,'About...');

 if not IsRegistred then ShowNagScreen;

end;

procedure TMainForm.UpdateTabFix;
var curs:TCursor;
    ts:TStringList;
    i:integer;
begin
  curs:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;

      try
       FileListBox.Directory:=TestsFolder+'\'+TestInEdit.PbsPath;
       if TestInEdit.PbsPath<>'' then FileListBox.Update;
       FixPBListBox.Items.Clear;
       if TestInEdit.ListaProblemeFixe<>'' then
          begin
            ts:=TStringList.Create;
            BreakString(TestInEdit.ListaProblemeFixe,ts);

            for i:=0 to ts.Count-1 do
              if FileExists(FileListBox.Directory+'\'+ts[i])
                 then FixPbListBox.Items.Add(ts[i])
                 else MessageDlg('File not found: '+FileListBox.Directory+'\'+ts[i],mtWarning,[mbOk],0);

            for i:=0 to ts.Count-1 do
              FileListBox.Items.Delete(FileListBox.Items.IndexOf(ts[i]));
            ts.free;
          end;
       ListProblemsMustUpdated:=false;
      except
      end;
  Screen.Cursor:=curs;
end;


procedure TMainForm.UpdateTabRandom;
var curs:TCursor;
    ts,ts2:TStringList;
    i,j,k:integer;
begin
   curs:=Screen.Cursor;
   Screen.Cursor:=crHourGlass;

      SeekCategories;
      if TestInEdit.ListaCategorii<>'' then
        begin
          ts:=TStringList.Create;
          ts2:=TStringList.Create;
          BreakString(TestInEdit.ListaCategorii,ts);
          for i:=0 to ts.Count-1 do
              begin
                ts2.Clear;
                BreakString(ts[i],ts2);
                for j:=0 to ListView1.Items.Count-1 do
                  if LowerCase(ListView1.Items[j].Caption)=
                     LowerCase(ts2[0]) then
                        begin
                          try
                            k:=StrtoInt(ts2[1]);
                          except
                            if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
                            MessageDlg('Number format error: '+ts2[0]+' '+ts2[1]+#13#10+'Using defaults.',mtWarning,[mbOk],0);
                            k:=9999;
                          end;
                          if (k>=9999) or (k<=-1)
                            then begin
                                   ListView1.Items[j].SubItems[0]:='Nelimitata';
                                   ListView1.Items[j].ImageIndex:=3;
                                 end
                            else begin
                                   ListView1.Items[j].SubItems[0]:=ts2[1];
                                   if k=0 then ListView1.Items[j].ImageIndex:=5
                                          else ListView1.Items[j].ImageIndex:=4;
                                 end
                        end;
              end;
          ts2.free;
          ts.free;
        end;
      ListCategoryMustUpdated:=false;

   Screen.Cursor:=curs;
end;


procedure TMainForm.PageControl1Change(Sender: TObject);
begin
 if Settings.Sounds then PlaySound('PAGE', hInstance, snd_ASync or snd_Resource);

 if (PageControl1.ActivePage.TabIndex=2)
    and ListProblemsMustUpdated
      then UpdateTabFix;

  if (PageControl1.ActivePage.TabIndex=3)
    and ListCategoryMustUpdated
      then UpdateTabRandom;

  if PageControl1.ActivePage.TabIndex=5 then
      begin
        LabInfo1.Caption:=TestInEdit.Name;
        LabInfo2.Caption:=TestInEdit.DomainShort;
        LabInfo3.Caption:=TestInEdit.DomainLong;
        if TestInEdit.PbsPath='' then LabInfo4.Caption:='Necunoscut'
                                 else LabInfo4.Caption:=TestInEdit.PbsPath;
        LabInfo5.Caption:=IntToStr(FixPbListBox.Items.Count);
        LabInfo6.Caption:=IntToStr(TestInEdit.NrPbRandom);
        if TestInEdit.Time=0 then LabInfo7.Caption:='Nelimitata'
                             else LabInfo7.Caption:=IntToStr(TestInEdit.Time);
        if Memo1.Text<>'' then LabInfo8.Caption:='Prezent'
                          else LabInfo8.Caption:='Absent';
        if TestInEdit.FileName='' then LabInfo9.Caption:='Nesalvat inca'
                                  else LabInfo9.Caption:=TestInEdit.FileName;
      end;
end;



procedure TMainForm.ListView1DblClick(Sender: TObject);
var valo:string;
    v,c:integer;
begin
 if ListView1.SelCount=0 then exit;

 if ListView1.SelCount=1 then
   begin
     valo:=ListView1.Selected.SubItems[0];
     c:=0;
     if valo='Nelimitata' then v:=9999
                         else val(valo,v,c);
     if c<>0 then v:=9999;
   end
 else v:=9999;

 v:=InputPbperCateg(ListView1.Selected.Caption,v);
 if v=-1 then exit;


 for c:=0 to ListView1.Items.Count-1 do
   if ListView1.Items[c].Selected then
 begin
   if v=9999 then begin
          ListView1.Items[c].SubItems[0]:='Nelimitata';
          ListView1.Items[c].ImageIndex:=3;
        end
   else begin
          ListView1.Items[c].SubItems[0]:=inttostr(v);
          if v=0 then ListView1.Items[c].ImageIndex:=5
                 else ListView1.Items[c].ImageIndex:=4;
   end;
 end;

end;








procedure TMainForm.AcceptaDoarNumere(Sender: TObject; var Key: Char);
begin
 if ((key<'0') or (key>'9')) and (key<>#8) then
   begin beep;key:=#0;end;
end;

procedure TMainForm.dificultyeditKeyPress(Sender: TObject; var Key: Char);
begin
 AcceptaDoarNumere(Sender,Key);
end;

procedure TMainForm.NrRandomKeyPress(Sender: TObject; var Key: Char);
begin
 AcceptaDoarNumere(Sender,Key);
end;

procedure TMainForm.TimeKeyPress(Sender: TObject; var Key: Char);
begin
 AcceptaDoarNumere(Sender,Key);
end;


function TMainForm.SaveTest(filename:string):boolean;
var i:integer;
begin
  if ListProblemsMustUpdated then UpdateTabFix;
  if ListCategoryMustUpdated then UpdateTabRandom;

  TestInEdit.ListaProblemeFixe:=' ';
  if FixPbListBox.Items.Count>0 then
    for i:=0 to FixPbListBox.Items.Count-1 do
      TestInEdit.ListaProblemeFixe:=TestInEdit.ListaProblemeFixe+' "'+FixPbListBox.Items[i]+'"';
  LTrim(TestInEdit.ListaProblemeFixe);

  TestInEdit.ListaCategorii:=' ';
  if ListView1.Items.Count>0 then
    for i:=0 to ListView1.Items.Count-1 do
      if ListView1.Items[i].SubItems[0]<>'Nelimitata' then
        TestInEdit.ListaCategorii:=TestInEdit.ListaCategorii+' "'+ListView1.Items[i].Caption+' '+ListView1.Items[i].SubItems[0]+'"';
  LTrim(TestInEdit.ListaCategorii);

  TestInEdit.Comment:=' ';
  for i:=0 to Memo1.Lines.Count-1 do
    TestInEdit.Comment:=TestInEdit.Comment+' "'+Memo1.Lines[i]+'"';
  LTrim(TestInEdit.Comment);


  if NrRandom.Text='' then
       begin
         if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
         MessageDlg('Field "No. of random problems" is empty',mtError,[mbOK],0);
         result:=false;
         exit;
       end;
  if DificultyEdit.Text='' then
       begin
         if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
         MessageDlg('Field "Dificulty restriction" is empty. Enter 0 for no dificulty restriction.',mtError,[mbOK],0);
         result:=false;
         exit;
       end;
  if Time.Text='' then
       begin
         if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
         MessageDlg('Field "Time" is empty',mtError,[mbOK],0);
         result:=false;
         exit;
       end;

  if not SaveStructToFile(FileName,TestInEdit)
    then begin
          result:=false;
          exit;
         end;

  MustSave:=false;
  result:=true;
end;


Procedure TMainForm.UpdateEtich;
begin
 Etich1.Caption:='Pb. disponibile.: '+
                 IntToStr(FileListBox.Items.Count)+
                 ' ('+
                 IntToStr(FileListBox.Items.Count+FixPbListBox.Items.Count)+
                 ' in folder)';
 Etich2.Caption:='Pb. permanente de inclus: '+
                 IntToStr(FixPbListBox.Items.Count);
end;


procedure TMainForm.FileListBoxChange(Sender: TObject);
begin
 UpdateEtich;
 if not ListProblemsMustUpdated then MustSave:=true;
end;


function TMainForm.SaveTestDlg:boolean;
var tfn:string;
begin
 result:=true;
 SaveDialog1.InitialDir:=TestsFolder;
 if TestInEdit.FileName='' then
    if not SaveDialog1.Execute then
         begin
           result:=false;
           exit;
         end;
 if TestInEdit.FileName<>'' then tfn:=TestInEdit.FileName
                            else tfn:=SaveDialog1.Filename;
 if SaveTest(tfn) then
   begin
     TestInEdit.FileName:=tfn;
     LabInfo9.Caption:=TestInEdit.FileName;
     pages[opentab].tst[opentst+1].FileName:=TestInEdit.FileName;
     pages[opentab].tst[opentst+1].Author:=TestInEdit.Author;
     pages[opentab].tst[opentst+1].Time:=TestInEdit.Time;
     pages[opentab].tst[opentst+1].Dificulty:=TestInEdit.Dificulty;
     pages[opentab].tst[opentst+1].NrPbRandom:=TestInEdit.NrPbRandom;
     pages[opentab].tst[opentst+1].NrProblems:=FixPbListBox.Items.Count;
     MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';
   end
 else begin
       result:=false;
       exit;
      end;

 if UpperCase(ExtractFilePath(TestInEdit.FileName))<>
    UpperCase(TestsFolder+'\')
      then MessageDlg('Testul a fost salvat inafara directorului special cu teste.'#13#10+
                      'Pentru buna functionare copiati fisierul in: '+testsfolder,
                      mtWarning,[mbOk],0);
end;


procedure TMainForm.Save1Click(Sender: TObject);
begin
 SaveTestDlg;
end;


procedure TMainForm.Saveas1Click(Sender: TObject);
var tfn:string;
begin                     
 SaveDialog1.InitialDir:=TestsFolder;
 if not SaveDialog1.Execute then exit;
 tfn:=SaveDialog1.Filename;
 if SaveTest(tfn) then
   begin
     TestInEdit.FileName:=tfn;
     if TestInEdit.FileName=''
        then MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - Nesalvat)'
        else MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';
   end;

 if UpperCase(ExtractFilePath(TestInEdit.Filename))<>
    UpperCase(TestsFolder+'\')
      then MessageDlg('Testul a fost salvat inafara directorului special cu teste.'#13#10+
                      'Pentru buna functionare copiati fisierul in: '+testsfolder,
                      mtWarning,[mbOk],0);

end;


procedure TMainForm.NewTestAll;
begin
 ListProblemsMustUpdated:=false;
 ListCategoryMustUpdated:=false;
 ClearTestControls;  // nu se sterg mereu itemii din ListView creati la designtime
 MSCaption.CaptionText.Caption:='Test Composer (No test loaded)';

 NewTstBut.Caption:='';
 NewDomBut.Caption:='';

 OpenTab:=-1;OpenTst:=-1;
 MustSave:=false;
end;

procedure TMainForm.TstNameChange(Sender: TObject);
begin
 MustSave:=true;
end;

procedure TMainForm.DomainShortChange(Sender: TObject);
begin
 MustSave:=true;
end;

procedure TMainForm.DomainLongChange(Sender: TObject);
begin
 MustSave:=true;
end;

procedure TMainForm.NrRandomChange(Sender: TObject);
begin
 MustSave:=true;
 try
   TestInEdit.NrPbRandom:=StrToInt(NrRandom.Text);
 except
   if NrRandom.Text<>'' then
    begin
     if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
     MessageDlg(NrRandom.Text+' nu este o valoare intreaga valida',mtError,[mbOK],0);
     TestInEdit.NrPbRandom:=0;
     NrRandom.Text:='0';
    end; 
 end;
end;

procedure TMainForm.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
 if Change=ctState then exit;
 if not ListCategoryMustUpdated then MustSave:=true;
end;

procedure TMainForm.authoreditChange(Sender: TObject);
begin
 MustSave:=true;
 TestInEdit.Author:=AuthorEdit.Text;
end;

procedure TMainForm.dificultyeditChange(Sender: TObject);
begin
 MustSave:=true;
 try
   TestInEdit.Dificulty:=StrToInt(DificultyEdit.Text);
 except
   if DificultyEdit.Text<>'' then
    begin
     if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
     MessageDlg(DificultyEdit.Text+' nu este o valoare intreaga valida',mtError,[mbOK],0);
     TestInEdit.Dificulty:=0;
     DificultyEdit.Text:='0';
    end;
 end;
end;

procedure TMainForm.TimeChange(Sender: TObject);
begin
 try
   TestInEdit.Time:=StrToInt(Time.Text);
 except
   if Time.Text<>'' then
     begin
      if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
      MessageDlg(Time.Text+' nu este o valoare intreaga valida',mtError,[mbOK],0);
      TestInEdit.Time:=60;
      Time.Text:='60';
     end;
 end;
 MustSave:=true;
end;

procedure TMainForm.Memo1Change(Sender: TObject);
begin
 MustSave:=true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if MustSave then
 begin
   if Settings.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Testul s-a modificat. Doriti sa-l salvati ?',
                    mtConfirmation,mbYesNoCancel,0)of
   mrYes:    if not SaveTestDlg then begin Action:=caNone;exit;end;
   mrCancel: Action:=caNone;
   end;
 end;
 Settings.SaveToRegistry;    
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
 ShowAboutBox;
end;


Procedure ClearTestStrucure(var struct:TestStructure);
begin
  struct.FileName:='';
  struct.Name:='';
  struct.DomainShort:='';
  struct.DomainLong:='';
  struct.PbsPath:='';
  struct.Time:=60;
  struct.ListaProblemeFixe:='';
  struct.NrPbRandom:=0;
  struct.ListaCategorii:='';
  struct.Author:='';
  struct.Dificulty:=0;
  struct.Comment:='';
end;


Procedure LoadTestToStructure(filename:string;var struct:TestStructure);
var tst:TTest;
begin
 tst:=TTest.Create;
 tst.LoadDescription(filename);

 struct.FileName:=filename;
 struct.Name:=tst.testname;
 struct.DomainShort:=tst.Domain.shortname;
 struct.DomainLong:=tst.Domain.longname;
 struct.PbsPath:=tst.Path;
 struct.Time:=tst.Time;
 struct.ListaProblemeFixe:=tst.PbsArray;
 struct.NrPbRandom:=tst.NrPbRandom;
 struct.ListaCategorii:=tst.CatArray;
 struct.Author:=tst.Author;
 struct.Dificulty:=tst.Dificulty;
 struct.Comment:=tst.Comment;

 tst.Free;
end;



Function SaveStructToFile(filename:string;struct:TestStructure):boolean;
var ts,ts2:TStringList;
    i:integer;
begin
  result:=true;
  ts:=TStringList.Create;

  // Adauga headerul
  ts.Add('# PowerTests test file'#13#10'# (c) VMA soft'#13#10'# Automatically generated file. Do not edit !'#13#10);

  // Adauga .path
  if struct.PbsPath<>''
    then ts.Add('.path "'+GetLastSubdir(struct.PbsPath)+'"')
    else begin
           if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
           MessageDlg('Field "Path to problems folder" is empty or invalid',mtError,[mbOk],0);
           result:=false;
           exit;
         end;

  // Adauga .name
  if struct.Name<>''
    then ts.Add('.testname "'+struct.Name+'"')
    else begin
           if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
           MessageDlg('Field "Test Name" is empty',mtError,[mbOk],0);
           result:=false;
           exit;
         end;

  // Adauga .domain
  if (struct.DomainShort<>'')and(struct.DomainLong<>'')
    then ts.Add('.domain "'+struct.DomainShort+'" "'+struct.DomainLong+'"')
    else begin
           if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
           MessageDlg('Field(s) Domain is(are) empty !',mtError,[mbOk],0);
           result:=false;
           exit;
         end;

  // Adauga .time
  ts.Add('.time '+IntToStr(struct.Time));

  // Adauga toate directivele .problem
  if struct.ListaProblemeFixe<>'' then
    begin
      ts2:=TStringList.Create;
      BreakString(struct.ListaProblemeFixe,ts2);
      for i:=0 to ts2.Count-1 do ts.Add('.problem "'+ts2[i]+'"');
      ts2.free;
    end;

  // Adauga .random
  if struct.NrPbRandom>0 then
    ts.Add('.random '+IntToStr(struct.NrPbRandom));

  // Adauga restrictiile .author si .dificulty
  if struct.Author<>'' then ts.Add('.author "'+struct.Author+'"');
  if struct.Dificulty<>0 then ts.Add('.dificulty '+IntToStr(struct.Dificulty));

  // Adauga restrictia .category
  if struct.ListaCategorii<>'' then
    begin
      ts2:=TStringList.Create;
      BreakString(struct.ListaCategorii,ts2);
      for i:=0 to ts2.Count-1 do ts.Add('.category '+ts2[i]);
      ts2.free;
    end;

  // Adauga .rem
  if struct.Comment<>'' then
    begin
      ts2:=TStringList.Create;
      BreakString(struct.Comment,ts2);
      for i:=0 to ts2.Count-1 do ts.Add('.rem "'+ts2[i]+'"');
      ts2.free;
    end;

  if (LTrim(struct.ListaProblemeFixe)='') and
     (struct.NrPbRandom=0) then
        begin
          if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
          MessageDlg('Test incorect:'#13#10'- nici o problema permanenta'#13#10'- nici o problema aleatoare',mtError,[mbOK],0);
          result:=false;
          exit;
        end;


  ts.SaveToFile(filename);

  ts.Free;
end;


procedure TMainForm.RenameDomain;
var i,curtab:integer;
    fname,short,long:string;
    Stru:TestStructure;
begin
 curtab:=TabControl1.TabIndex;
 if curtab=-1 then begin beep;exit;end;

 short:=TabControl1.Tabs[curtab];
 long:=pages[curtab].LongDescription;
 if not InputDomain(short,long) then exit;

 TabControl1.Tabs[curtab]:=short;
 pages[curtab].LongDescription:=long;
 DomainInfo.Caption:='Domeniu: '+long;

 if (OpenTab=TabControl1.TabIndex)
    then begin
          TestInEdit.DomainShort:=short;
          TestInEdit.DomainLong:=long;
          if TestInEdit.FileName=''
             then MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - Nesalvat)'
             else MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';
          MustSave:=true;
         end;


 if ListView2.Items.Count>0 then
   for i:=0 to ListView2.Items.Count-1 do
     begin
      fname:=TestDescription(ListView2.Items[i].Data^).FileName;
      if fname<>'' then
        begin
         LoadTesttoStructure(fname,stru);
         stru.DomainShort:=short;
         stru.DomainLong:=long;
         SaveStructToFile(fname,stru);
        end;
     end;
end;


procedure TMainForm.RenameTest;
var curtab:integer;
    curtst:integer;
begin
 curtab:=TabControl1.TabIndex;
 if curtab=-1 then begin beep;exit;end;
 if ListView2.SelCount<>1 then begin beep;exit;end;

 curtst:=ListView2.Items.IndexOf(ListView2.Selected);
 ListView2.Items[curtst].EditCaption;
 trvar1:=curtab;trvar2:=curtst+1;
 if pages[curtab].tst[curtst+1].FileName<>''
   then trvar3:=1
   else trvar3:=0;
 ListView2.OnEdited:=ListView2ItemEdited;
end;


procedure TMainForm.DeleteTest;
var curtab:integer;
    i:integer;
    fname:string;
    myitem:TListItem;
begin
 curtab:=TabControl1.TabIndex;
 if curtab=-1 then begin beep;exit;end;
 if ListView2.SelCount=0 then begin beep;exit;end;


 // Aici e cam neoptimizat,
 // eu parcurg lista de 2 ori !!!
 for i:=0 to ListView2.Items.Count-1 do
     if (ListView2.Items[i].Selected) and
        (OpenTab=TabControl1.TabIndex) and
        (OpenTst=i)
           then begin
                  if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
                  MessageDlg('Nu se poate sterge un test deschis',mtError,[mbOK],0);
                  exit;
                end;


 MyItem:=nil;
 if (OpenTst in [0..ListView2.Items.Count-1])
  then MyItem:=ListView2.Items[OpenTst];

 for i:=ListView2.Items.Count-1 downto 0 do
     if ListView2.Items[i].Selected then
       begin
         fname:=TestDescription(ListView2.Items[i].Data^).FileName;
         if fname='' then ListView2.Items[i].Delete
          else if Win95Erase(MainForm.Handle, fname, True, True) then
                  ListView2.Items[i].Delete;
       end;

 pages[curtab].nrtst:=ListView2.Items.Count;
 for i:=0 to ListView2.Items.Count-1 do
   Move(TestDescription(ListView2.Items[i].Data^),
        Pages[curtab].Tst[i+1],
        SizeOf(TestDescription));

 if MyItem<>nil then OpenTst:=ListView2.Items.IndexOf(myItem);

 ShowPage(curtab);
end;

procedure TMainForm.NewTest;
var curtab:integer;
    curtst:integer;
begin
 curtab:=TabControl1.TabIndex;
 if curtab=-1 then begin beep;exit;end;
 inc(pages[curtab].nrtst);curtst:=pages[curtab].nrtst;
 pages[curtab].tst[curtst].filename:='';
 pages[curtab].tst[curtst].name:='Untitled';
 pages[curtab].tst[curtst].DomainShort:=TabControl1.Tabs[curtab];
 ShowPage(curtab);

 ListView2.Items[curtst-1].EditCaption;
 trvar1:=curtab;trvar2:=curtst;
 trvar3:=0;
 ListView2.OnEdited:=ListView2ItemEdited;
end;


procedure TMainForm.ListView2ItemEdited(Sender:TObject;Item:TListItem;var S:string);
var fname:string;
    stru:TestStructure;
begin
  if s='' then
     MessageDlg('Trebuie sa introduceti un nume pentru identificarea usoara a testului.',mtWarning,[mbOK],0);
  pages[trvar1].tst[trvar2].name:=s;
  ShowTstInfo;

  if (OpenTab=TabControl1.TabIndex) and
     (OpenTst=ListView2.Items.IndexOf(Item))
     then begin
            TestInEdit.Name:=s;
            if TestInEdit.FileName=''
              then MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - Nesalvat)'
              else MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';
            MustSave:=true;
          end;


  if trvar3=1 then
    begin
      fname:=pages[trvar1].tst[trvar2].FileName;
      LoadTesttoStructure(fname,stru);
      stru.Name:=s;
      SaveStructToFile(fname,stru);
    end;
end;


procedure TMainForm.DeleteDomain;
var i:integer;
begin
  if  TabControl1.TabIndex=-1 then begin beep;exit;end;
  if  Pages[TabControl1.TabIndex].nrtst>0
      then begin
             if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
             MessageDlg('Domeniul '+TabControl1.Tabs[TabControl1.TabIndex]+' nu este gol',mtError,[mbOk],0);
             exit;
           end;
  for i:=TabControl1.TabIndex to 50 do
      begin
       Pages[i].nrtst:=Pages[i+1].nrtst;
       Pages[i].longdescription:=Pages[i+1].longdescription;
       Pages[i].tst:=Pages[i+1].tst;
      end;
  i:=TabControl1.TabIndex;
  TabControl1.Tabs.Delete(i);
  if i>0 then dec(i);
  TabControl1.TabIndex:=i;ShowPage(i);
  FillMenuWithDomains;
end;

procedure TMainForm.NewDomain;
var short,long:string;
    i:integer;
begin
  if TabControl1.Tabs.Count>=50 then
    begin MessageDlg('You can''t create more than 50 domains',mtError,[mbOk],0);exit;end;
  short:='';long:='';
  if not InputDomain(short,long) then exit;
  if short=''then
    begin
      if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
      MessageDlg('Trebuie sa introduceti un nume de domeniu valid',mtError,[mbOk],0);
      exit;
    end;
  if TabControl1.Tabs.IndexOf(short)<>-1 then
    begin
      if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
      MessageDlg('Domeniul '+short+' exista deja',mtError,[mbOk],0);
      exit;
    end;

  TabControl1.Tabs.Add(short);
  i:=TabControl1.Tabs.Count-1;
  Pages[i].nrtst:=0;
  Pages[i].longdescription:=long;
  TabControl1.TabIndex:=i;ShowPage(i);
  FillMenuWithDomains;
end;

procedure TMainForm.ShowPage(pag:integer);
var i:integer;
begin
 DomainInfo.Caption:='Domeniu: '+pages[pag].LongDescription;

 if ListView2.Items.Count<> 0 then ListView2.Items.Clear;
 for i:=1 to pages[pag].nrtst do begin
   li[i]:=ListView2.Items.Add;
   li[i].caption:=pages[pag].tst[i].name;
   li[i].Data:=@pages[pag].Tst[i];

   if (OpenTab=TabControl1.TabIndex) and
      (OpenTst=i-1) then li[i].imageindex:=1
                    else li[i].imageindex:=0;
 end;
 {ActiveControl:=ListView2;
 if ListView2.Items.Count>0 then
   begin
      ListView2.ItemFocused:=ListView2.Items[0];
      ListView2.Selected:=ListView2.Items[0];
   end;}

  if ListView2.Items.Count>0 then
      ListView2.ItemFocused:=ListView2.Items[0];

end;

procedure TMainForm.ReadTests;
var found:integer;sr:tsearchrec;tst:TTest;
    curpage,curtst,i:integer;
begin
 for i:=0 to High(Pages) do Pages[i].nrtst:=0;
 TabControl1.Tabs.Clear;
 Found := FindFirst(TestsFolder+'\*.tst', faReadOnly+faArchive, sr);
 while (Found = 0) do
   begin
      tst:=TTest.Create;
      tst.LoadDescription(TestsFolder+'\'+sr.name);
      if TabControl1.Tabs.IndexOf(tst.Domain.ShortName)=-1 then
          TabControl1.Tabs.Add(tst.Domain.ShortName);
      curpage:=TabControl1.Tabs.IndexOf(tst.Domain.ShortName);
      pages[curpage].LongDescription:=tst.Domain.LongName;

      inc(pages[curpage].nrtst);curtst:=pages[curpage].nrtst;

      pages[curpage].tst[curtst].filename:=tst.TSTFilename;
      pages[curpage].tst[curtst].name:=tst.TestName;
      pages[curpage].tst[curtst].author:=tst.Author;
      pages[curpage].tst[curtst].dificulty:=tst.Dificulty;
      pages[curpage].tst[curtst].time:=tst.Time;
      pages[curpage].tst[curtst].nrpbrandom:=tst.NrPbRandom;
      pages[curpage].tst[curtst].nrproblems:=tst.NrProblems;
      pages[curpage].tst[curtst].DomainShort:=tst.Domain.shortname;

      tst.Free;
      Found := FindNext(SR);
   end;
 FindClose(SR);
 ShowPage(0);
 FillMenuWithDomains;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
var Selectat:Integer;
begin
 Selectat:=TabControl1.TabIndex;
 if Selectat>=0 then
   begin
     if Settings.Sounds then PlaySound('PAGE2', hInstance, snd_ASync or snd_Resource);
     ShowPage(Selectat);
   end;
end;


procedure TMainForm.ShowTstInfo;
begin
 case ListView2.SelCount of
  0:   begin
         Memo2.Font.Color:=clBlack;
         memo2.Clear;
         memo2.Lines.Add(#13#10);
         memo2.Lines.Add('   Selectati un test din lista');
       end;
  1:   begin
         MyTest.FileName:=TestDescription(ListView2.Selected.Data^).FileName;
         MyTest.Name:=TestDescription(ListView2.Selected.Data^).Name;
         MyTest.DomainShort:=TestDescription(ListView2.Selected.Data^).DomainShort;
         MyTest.DomainLong:=Pages[TabControl1.TabIndex].LongDescription;

         if MyTest.FileName=''
           then Memo2.Font.Color:=clBlue
           else Memo2.Font.Color:=clBlack;
         memo2.Clear;
         memo2.Lines.Add(#13#10);
         memo2.Lines.Add(' Nume: '+TestDescription(ListView2.Selected.Data^).Name);
         memo2.Lines.Add(' Autor: '+TestDescription(ListView2.Selected.Data^).Author);
         memo2.Lines.Add(' Timp: '+InttoStr(TestDescription(ListView2.Selected.Data^).Time));
         memo2.Lines.Add(' Dificultate: '+InttoStr(TestDescription(ListView2.Selected.Data^).Dificulty));
         memo2.Lines.Add(' Pb. permanente: '+InttoStr(TestDescription(ListView2.Selected.Data^).NrProblems));
         memo2.Lines.Add(' Pb. aleatoare: '+InttoStr(TestDescription(ListView2.Selected.Data^).NrPbRandom));
         memo2.Lines.Add(' Fisier: '+ExtractFileName(TestDescription(ListView2.Selected.Data^).FileName));
         memo2.Lines.Add(' Domeniu: '+TestDescription(ListView2.Selected.Data^).DomainShort);
       end;
  else begin
         Memo2.Font.Color:=clBlack;
         memo2.Clear;
         memo2.Lines.Add(#13#10);
         memo2.Lines.Add('   '+IntToStr(ListView2.SelCount)+' objects selected');
       end;
 end;
end;


procedure TMainForm.ListView2Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
 if Change=ctState then ShowTstInfo;
end;

procedure TMainForm.Memo2Enter(Sender: TObject);
begin
 ActiveControl:=ListView2;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
 if SpeedButton1.Down then ListView2.ViewStyle:=vsIcon
 else if SpeedButton2.Down then ListView2.ViewStyle:=vsSmallIcon
 else if SpeedButton3.Down then ListView2.ViewStyle:=vsList
end;

procedure TMainForm.a_newdomExecute(Sender: TObject);
begin
 if PageControl1.ActivePage.TabIndex<>0 then exit;
 NewDomain;
end;

procedure TMainForm.a_newtestExecute(Sender: TObject);
begin
 if PageControl1.ActivePage.TabIndex<>0 then exit;
 NewTest;
end;

procedure TMainForm.a_deldomainExecute(Sender: TObject);
begin
 if PageControl1.ActivePage.TabIndex<>0 then exit;
 DeleteDomain;
end;

procedure TMainForm.a_deltestExecute(Sender: TObject);
begin
 if PageControl1.ActivePage.TabIndex<>0 then exit;
 DeleteTest;
end;

procedure TMainForm.a_rentestExecute(Sender: TObject);
begin
 RenameTest;
end;

procedure TMainForm.a_rendomExecute(Sender: TObject);
begin
 RenameDomain;
end;


procedure TMainForm.FillMenuWithDomains;
var MyItem: array[0..51] of TMenuItem;
    MyItem2: array[0..51] of TMenuItem;
    i:integer;
begin
 // Umplu meniul butonasului cu dropdown
 if TestMenu1.Items[4].Count>0 then
   for i:=TestMenu1.Items[4].Count-1 downto 0 do
     TestMenu1.Items[4].Delete(i);

  for i := 0 to TabControl1.Tabs.Count-1 do
    begin
     MyItem[i] := TMenuItem.Create(Self);
     MyItem[i].Caption := TabControl1.Tabs[i];
     MyItem[i].OnClick := DomainsListMnuHandler;
     TestMenu1.Items[4].Add(MyItem[i]);
    end;


 // Acum umplu meniul lui ListView
 if ListViewPopUp.Items[3].Count>0 then
   for i:=ListViewPopUp.Items[3].Count-1 downto 0 do
     ListViewPopUp.Items[3].Delete(i);

  for i := 0 to TabControl1.Tabs.Count-1 do
    begin
     MyItem2[i] := TMenuItem.Create(Self);
     MyItem2[i].Caption := TabControl1.Tabs[i];
     MyItem2[i].OnClick := DomainsListMnuHandler;
     ListViewPopUp.Items[3].Add(MyItem2[i]);
    end;

end;


procedure TMainForm.DomainsListMnuHandler(Sender: TObject);
var curtab,desttab,desttst,i:integer;
    fname:string;
    Stru:TestStructure;
    wasmoved:boolean;
    myitem:TListItem;
begin
 curtab:=TabControl1.TabIndex;
 desttab:=TabControl1.Tabs.IndexOf((Sender as TMenuItem).Caption);
 if curtab=-1 then begin beep;exit;end;
 if desttab=curtab then begin beep;exit;end;
 if ListView2.SelCount=0 then begin beep;exit;end;

 WasMoved:=false;
 MyItem:=nil;
 if (OpenTst in [0..ListView2.Items.Count-1])
  then MyItem:=ListView2.Items[OpenTst];

 with Sender as TMenuItem do
   for i:=ListView2.Items.Count-1 downto 0 do
     if ListView2.Items[i].Selected then
        begin
          inc(pages[desttab].nrtst);desttst:=pages[desttab].nrtst;
          move(TestDescription(pages[curtab].tst[i+1]) ,
               pages[desttab].tst[desttst],
               sizeof(TestDescription));
          pages[desttab].tst[desttst].DomainShort:=Caption;
          if (OpenTab=TabControl1.TabIndex)and
             (OpenTst=i) then begin
                                WasMoved:=true;
                                OpenTab:=desttab;
                                OpenTst:=desttst-1;
                                TestInEdit.DomainShort:=TabControl1.Tabs[desttab];
                                TestInEdit.DomainLong:=Pages[desttab].LongDescription;
                                if TestInEdit.FileName=''
                                  then MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - Nesalvat)'
                                  else MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';
                                MustSave:=true;
                              end;

          fname:=TestDescription(ListView2.Items[i].Data^).FileName;
          if fname<>'' then
            begin
             LoadTesttoStructure(fname,stru);
             stru.DomainShort:=Caption;
             stru.DomainLong:=pages[desttab].LongDescription;
             SaveStructToFile(fname,stru);
            end;

          ListView2.Items[i].Delete;
        end;

 pages[curtab].nrtst:=ListView2.Items.Count;
 for i:=0 to ListView2.Items.Count-1 do
   Move(TestDescription(ListView2.Items[i].Data^),
        Pages[curtab].Tst[i+1],
        SizeOf(TestDescription));

 if (not wasmoved) and (MyItem<>nil)
   then OpenTst:=ListView2.Items.IndexOf(myitem);

 ShowPage(curtab);
end;


procedure TMainForm.SpeedButton5Click(Sender: TObject);
begin
 if SpeedButton5.Down then PbsListView.ViewStyle:=vsIcon
 else if SpeedButton6.Down then PbsListView.ViewStyle:=vsSmallIcon
 else if SpeedButton7.Down then PbsListView.ViewStyle:=vsList
end;


procedure TMainForm.SeekPbsFolders;
var i:integer;
    sr:TSearchRec;found:integer;
begin
 if PbsListView.Items.Count<> 0 then PbsListView.Items.Clear;

 i:=1;
 Found := FindFirst(ExtractFilePath(TestsFolder+'\')+'*.*', faDirectory, sr);
 while (Found = 0) do
   begin
    if (sr.Attr=faDirectory) and (sr.name<>'.') and (sr.Name<>'..') then
      begin
       li[i]:=PbsListView.Items.Add;
       li[i].caption:=sr.name;
       li[i].imageindex:=2;
      end;
    Found := FindNext(SR);
   end;
 FindClose(SR);
end;


procedure TMainForm.PbsListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var i:integer;
    sr:TSearchRec;found:integer;
begin
 if (Change=ctState) and (PbsListView.SelCount=1) then
  begin
    ListProblemsMustUpdated:=true;
    ListCategoryMustUpdated:=true;
    MustSave:=true;

    if ListView4.Items.Count<> 0 then ListView4.Items.Clear;
    i:=1;
    Found := FindFirst(ExtractFilePath(TestsFolder+'\'+PbsListView.Selected.Caption+'\')+'*.pb', faReadOnly+faArchive, sr);
    while (Found = 0) do
      begin
       li[i]:=ListView4.Items.Add;
       li[i].caption:=sr.name;
       Found := FindNext(SR);
      end;
    FindClose(SR);

    if ListView4.Items.Count>0 then
      begin
        TestInEdit.PbsPath:=PbsListView.Selected.Caption;
        Label13.Caption:='Folder probleme: '+TestsFolder+'\'+PbsListView.Selected.Caption;
      end
    else begin
           TestInEdit.PbsPath:='';
           Label13.Caption:='Folder invalid: NICI O PROBLEMA IN ACEST FOLDER';
         end;

  end;
end;

procedure TMainForm.ListView4Enter(Sender: TObject);
begin
 ActiveControl:=PbsListView;
end;

procedure TMainForm.SpeedButton8Click(Sender: TObject);
begin
 if SpeedButton8.Down then ListView1.ViewStyle:=vsIcon
 else if SpeedButton9.Down then ListView1.ViewStyle:=vsSmallIcon
 else if SpeedButton10.Down then ListView1.ViewStyle:=vsList
 else if SpeedButton11.Down then ListView1.ViewStyle:=vsReport;
end;

procedure TMainForm.OpenButClick(Sender: TObject);
begin
 if MustSave then
 begin
   if Settings.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Testul s-a modificat. Doriti sa-l salvati ?',
                    mtConfirmation,mbYesNoCancel,0)of
   mrYes:    if not SaveTestDlg then exit;
   mrCancel: exit;
   end;
 end;

 if ListView2.SelCount=0 then
     begin
        if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
        MessageDlg('Nu se poate deschide testul. Trebuie sa:'#13#10#13#10+
                   '1. Selectati un test din lista - daca vreti sa incarcati un test existent'#13#10+
                   #13#10'   SAU'#13#10#13#10+
                   '2. Creati un test nou - daca doriti un test nou intr-un domeniu existent'#13#10+
                   #13#10'   SAU'#13#10#13#10+
                   '3. Creati un nou domeniu, apoi un nou test in acel domeniu - daca doriti un test nou in alt domeniu',
                   mtError,[mbOK],0);
        exit;
     end;
  if ListView2.SelCount>1 then
     begin
        if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
        MessageDlg('Nu se poate deschide mai mult de un test odata',mtError,[mbOK],0);
        exit;
     end;


 if (OpenTab=TabControl1.TabIndex)and
    (OpenTst in [0..ListView2.Items.Count-1])
    then ListView2.Items[OpenTst].ImageIndex:=0;
 OpenTab:=TabControl1.TabIndex;
 OpenTst:=ListView2.Items.IndexOf(ListView2.Selected);
 ListView2.Selected.ImageIndex:=1;

 if MyTest.FileName=''
   then begin
          ClearTestStrucure(TestInEdit);
          TestInEdit.Name:=MyTest.Name;
          TestInEdit.DomainShort:=MyTest.DomainShort;
          TestInEdit.DomainLong:=MyTest.DomainLong;
        end
   else LoadTesttoStructure(MyTest.FileName, TestInEdit);

 if TestInEdit.FileName=''
  then MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - Nesalvat)'
  else MSCaption.CaptionText.Caption:='Test Composer ('+TestInEdit.DomainShort+'\'+TestInEdit.Name+' - '+GetLastSubdir(TestInEdit.FileName)+')';

 PutTestInControls(TestInEdit);
 if Settings.Sounds then PlaySound('NEW', hInstance, snd_ASync or snd_Resource);
 MustSave:=false;
end;

procedure TMainForm.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ((Sender as TPageControl).ActivePage.TabIndex=0)
    and (OpenTst=-1) then
      begin
        MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',
                   mtInformation,[mbOK],0);
        AllowChange:=false;
      end;
end;



procedure TMainForm.PutTestInControls(stru:TestStructure);
var i:integer;
begin
 ListProblemsMustUpdated:=true;
 ListCategoryMustUpdated:=true;

 ListView4.Items.Clear;
 Label13.Caption:='Folder probleme:';
 for i:=0 to PbsListView.Items.Count-1 do
   PbsListView.Items[i].Selected:=false;

 if TestInEdit.PbsPath<>'' then
  begin
    for i:=0 to PbsListView.Items.Count-1 do
     if LowerCase(PbsListView.Items[i].Caption)=LowerCase(GetLastSubdir(TestInEdit.PbsPath))
       then PbsListView.Items[i].Selected:=true;

   if PbsListView.Items.IndexOf(PbsListView.Selected)=-1 then
     begin
       if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
       MessageDlg('Folderul '+TestInEdit.PbsPath+' lipseste sau este incorect',mtWarning,[mbOK],0);
       TestInEdit.PbsPath:='';
     end;
  end;

 NrRandom.Text:=IntToStr(TestInEdit.NrPbRandom);
 AuthorEdit.Text:=TestInEdit.Author;
 DificultyEdit.Text:=IntToStr(TestInEdit.Dificulty);

 if TestInEdit.Time=0
   then begin
         timeunlim.Checked:=true;
         time.Enabled:=false;
        end
   else begin
         timelim.Checked:=true;
         time.Text:=IntToStr(TestInEdit.Time);
        end;

 if TestInEdit.Comment<>'' then Memo1.Text:=TestInEdit.Comment
                           else Memo1.Clear;

end;


procedure TMainForm.Label2Click(Sender: TObject);
begin
 PageControl1.ActivePage:=Pag0;
 if (OpenTab in [0..TabControl1.Tabs.Count-1])
  then begin
        TabControl1.TabIndex:=OpenTab;
        ShowPage(OpenTab);
       end;
 if (OpenTst in [0..ListView2.Items.Count-1])
  then ListView2.Selected:=ListView2.Items[OpenTst];
 ActiveControl:=ListView2;
end;

procedure TMainForm.Label5Click(Sender: TObject);
begin
 if OpenTst=-1 then
  begin
    MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',mtInformation,[mbOK],0);
    exit;
  end;
 PageControl1.ActivePage:=Pag1;
end;

procedure TMainForm.Label6Click(Sender: TObject);
begin
 if OpenTst=-1 then
  begin
    MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',mtInformation,[mbOK],0);
    exit;
  end;
 PageControl1.ActivePage:=Pag2;
 PageControl1Change(Sender);
end;

procedure TMainForm.Label7Click(Sender: TObject);
begin
 if OpenTst=-1 then
  begin
    MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',mtInformation,[mbOK],0);
    exit;
  end;
 PageControl1.ActivePage:=Pag3;
 PageControl1Change(Sender);
end;

procedure TMainForm.Label14Click(Sender: TObject);
begin
 if OpenTst=-1 then
  begin
    MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',mtInformation,[mbOK],0);
    exit;
  end;
 PageControl1.ActivePage:=Pag4;
end;

procedure TMainForm.Label2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TLabel).Font.Color:=clRed;
end;

procedure TMainForm.Label2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TLabel).Font.Color:=clBlue;
end;


procedure TMainForm.SpeedButton13Click(Sender: TObject);
begin
 NewTest;
 OpenButClick(Sender);
end;

procedure TMainForm.StartOpentest1Click(Sender: TObject);
begin
 Label2Click(Sender);
end;

procedure TMainForm.Problemsfolder1Click(Sender: TObject);
begin
 Label5Click(Sender);
end;

procedure TMainForm.Allwaysproblems1Click(Sender: TObject);
begin
 Label6Click(Sender);
end;

procedure TMainForm.Randomproblems1Click(Sender: TObject);
begin
 Label7Click(Sender);
end;

procedure TMainForm.Miscellaneous1Click(Sender: TObject);
begin
 Label14Click(Sender);
end;

procedure TMainForm.EndSave1Click(Sender: TObject);
begin
 if OpenTst=-1 then
  begin
    MessageDlg('Pentru a trece la pagina urmatoare trebuie sa incarcati un test',mtInformation,[mbOK],0);
    exit;
  end;
 PageControl1.ActivePage:=Pag5;
end;

procedure TMainForm.SpeedButton14Click(Sender: TObject);
begin
 ListView1DblClick(Sender);
end;

procedure TMainForm.Openselectedtest1Click(Sender: TObject);
begin
 OpenBut.Click;
end;

procedure TMainForm.Closecurenttest1Click(Sender: TObject);
begin
 if (OpenTst=-1) then exit;

 if MustSave then
 begin
    if Settings.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
    case messagedlg('Testul s-a modificat. Doriti sa-l salvati ?',
                     mtConfirmation,mbYesNoCancel,0)of
    mrYes:    if not SaveTestDlg then exit;
    mrCancel: exit;
    end;
 end;

 if (OpenTab in [0..TabControl1.Tabs.Count-1])
  then begin
        TabControl1.TabIndex:=OpenTab;
        ShowPage(OpenTab);
       end;
 if (OpenTst in [0..ListView2.Items.Count-1])
  then ListView2.Selected:=ListView2.Items[OpenTst];
 ActiveControl:=ListView2;
 ListView2.Items[OpenTst].ImageIndex:=0;

 NewTestAll;

end;

procedure TMainForm.Openselectedtest2Click(Sender: TObject);
begin
 OpenButClick(Sender);
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 TipDialog.OnAtStart:=Settings.ShowTipOfDay;
 TipDialog.Color:=RGB(243,251,215);
 TipDialog.Execute;
end;


Constructor TSettings.Create;
begin
  Sounds:=true;
  ShowTipOfDay:=true;
end;

Procedure TSettings.LoadFromRegistry;
var Reg: TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;

   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Test composer',True);
   if not Reg.ValueExists('sounds') then Reg.WriteBool('sounds', true);
   if not Reg.ValueExists('showtipofday') then Reg.WriteBool('showtipofday', true);
   Sounds        := Reg.ReadBool('sounds');
   ShowTipOfDay  := Reg.ReadBool('showtipofday');

   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);
   if not Reg.ValueExists('browserdir') then Reg.WriteString('browserdir',ExtractFilePath(paramstr(0))+'Tests');
   BrowserDir:=Reg.ReadString('browserdir');

 finally
   Reg.Free;
 end;
end;


Procedure TSettings.SaveToRegistry;
var Reg: TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;

   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Test composer',True);
   Reg.WriteBool('sounds', sounds);
   Reg.WriteBool('showtipofday', showtipofday);

   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);
   Reg.WriteString('browserdir',browserdir);

 finally
   Reg.Free;
 end;
end;



procedure TMainForm.Settings2Click(Sender: TObject);
begin
 ShowOptionsDialog;
end;

procedure TMainForm.Refreshlistoftests1Click(Sender: TObject);
begin
 if OpenTst<>-1 then
   begin
     if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
     MessageDlg('Nu se poate reciti lista pt. ca este un test deschis.'#13#10'Inchideti testul si reincercati.',mtError,[mbOK],0);
     exit;
   end;
 ReadTests;
 SeekPbsFolders;
end;

procedure TMainForm.TipDialogExecuted(Sender: TObject;
  StartNextTime: Boolean);
begin
 Settings.ShowTipOfDay:=StartNextTime;
end;

procedure TMainForm.Showtipofday1Click(Sender: TObject);
begin
 TipDialog.OnAtStart:=True;
 TipDialog.Execute;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 if fontloaded
   then LoadFont(extractfilepath(Application.ExeName)+'times.ttf',false);
end;

procedure TMainForm.Help2Click(Sender: TObject);
begin
 Application.HelpCommand(HELP_FINDER,0);
end;

end.


