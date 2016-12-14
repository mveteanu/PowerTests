unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Registry,
  Problems, RxCalc, MMSystem, Wordcap, AMTipDlg,
  RichEdit, RichEdit2, ImgList;


Type TInterfaceLook=class
                      public
                       FormColor        : TColor;
                       ScrollBox1Color  : TColor;
                       Label1Color      : TColor;
                       Spliter1Color    : TColor;
                       MySpliter1Color  : TColor;
                       RichEditColor    : TColor;
                       MyScrollBoxColor : TColor;
                       ABCDEColor       : TColor;
                       Sounds           : Boolean;
                       editincludeole   : Boolean;
                       editurldetect    : Boolean;
                       editwordwrap     : Boolean;
                       browserdir       : AnsiString;
                       Constructor Create;
                       Procedure SaveColorsToRegistry;
                       Procedure LoadColorsFromRegistry;
                       Procedure ApplyColors;
                       Procedure ApplyEditorSettings;
                    end;


type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fisiere1: TMenuItem;
    Incarcatest1: TMenuItem;
    Iesire1: TMenuItem;
    Info1: TMenuItem;
    Despreprogram1: TMenuItem;
    NavigatorImages: TImageList;
    NavigatorHotImages: TImageList;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Timer1: TTimer;
    Label1: TLabel;
    Repormiretest1: TMenuItem;
    Informatiitest1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Rezultate1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Arataimaginea1: TMenuItem;
    Imaginemicsorata1: TMenuItem;
    Afisare1: TMenuItem;
    Arataimagineainfullscreen1: TMenuItem;
    Arataimagineamicsorata1: TMenuItem;
    Rasfoire1: TMenuItem;
    Inainte1: TMenuItem;
    Inapoi1: TMenuItem;
    Primaproblema1: TMenuItem;
    Problemanr1: TMenuItem;
    RxCalculator1: TRxCalculator;
    Incarcatest2: TMenuItem;
    Panel2: TPanel;
    PaintBox1: TImage;
    ToolBar1: TToolBar;
    BackBtn: TToolButton;
    ForwardBtn: TToolButton;
    StopBtn: TToolButton;
    RefreshBtn: TToolButton;
    ToolButton2: TToolButton;
    RezultateBtn: TToolButton;
    ToolButton1: TToolButton;
    CalcBtn1: TToolButton;
    Setarigenerale1: TMenuItem;
    MainCaption: TMSOfficeCaption;
    TipDialog: TAMTipDialog;
    ShowTips: TMenuItem;
    Closetest1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Contents1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PopupMenu2: TPopupMenu;
    Whatsthis1: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu4: TPopupMenu;
    MenuItem2: TMenuItem;
    N6: TMenuItem;
    Whatsthis2: TMenuItem;
    RegistrationTimer: TTimer;
    procedure Iesire1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ForwardBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure Despreprogram1Click(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure Repormiretest1Click(Sender: TObject);
    procedure Informatiitest1Click(Sender: TObject);
    procedure RezultateBtnClick(Sender: TObject);
    procedure Incarcatest1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Arataimaginea1Click(Sender: TObject);
    procedure Imaginemicsorata1Click(Sender: TObject);
    procedure Arataimagineainfullscreen1Click(Sender: TObject);
    procedure Arataimagineamicsorata1Click(Sender: TObject);
    procedure Inainte1Click(Sender: TObject);
    procedure Inapoi1Click(Sender: TObject);
    procedure Problemanr1Click(Sender: TObject);
    procedure Primaproblema1Click(Sender: TObject);
    procedure CalcBtn1Click(Sender: TObject);
    procedure Setarigenerale1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TipDialogExecuted(Sender: TObject; StartNextTime: Boolean);
    procedure ShowTipsClick(Sender: TObject);
    procedure Closetest1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Whatsthis2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Whatsthis1Click(Sender: TObject);
    procedure RegistrationTimerTimer(Sender: TObject);
  private
    { Private declarations }
    myrichedit1  : TRichEdit98;   ismyrichedit1  : boolean;
    myscrollbox1 : TScrollBox;  ismyscrollbox1 : boolean;
    mysplitter1  : TSplitter;   ismysplitter1  : boolean;
    myimage1     : TImage;
    showstartuptips : boolean;
    testloaded:boolean;
    oldpb:integer;
    ismybutonase:boolean;
    butonase : array [1..20] of TWinControl;
    labels:array [1..20] of TLabel;
    stoptestare:boolean;
    ismybutonase2:boolean;
    butonase2 : array [1..20] of TWinControl;
    labels2:array [1..20] of TLabel; mylabel1,mylabel2 : TLabel;
    imready:boolean;
    TipDialogFirstRun:boolean;
    fontloaded:boolean;

    procedure DeactivateControls;
    procedure CloseTestImediat;
    procedure ArataRaspunsuri;
    procedure OnTestStop;
    procedure DisableInput;
    procedure UpdatePb;
    procedure CitesteButonase(Sender:TObject);
    procedure CitesteButonaseRestrictiv(Sender:TObject;var key:Char);
    procedure FreeTest;
    procedure MyScrollBoxResize(Sender: TObject);
    procedure myrichedit1onenter(sender:TObject);
    procedure MyImageResize;
    procedure Ceas(pb:TImage;min,total:integer);

    procedure winmsg(var msg:tmsg;var handled:boolean);

  public
    { Public declarations }
    test1 : TTest;
    curentpb:integer;
    curenttime:integer;
    puncteobtinute:extended;
    notaobtinuta:extended;

    calcpermis,calcintern:boolean;calcpath:string;
    acceptadoarvaloarea:boolean;
    erracceptata:extended;
    notadinoficiu:integer;
    permisrebegin,permisreopen:boolean;
    multiuser:boolean;
    arataraspunsuricorecte:boolean;
    ProfPasswd:string;

    Function IsPbCorect(nrpb:integer):extended;
    function GotoProblem(pbtojmp:integer):boolean;
  end;

var
  Form1: TForm1;
  InterfaceColors: TInterfaceLook;
  ProgramInregistrat:boolean;
  RegistrationCount:Integer;

implementation

uses ShellApi, Win95, ViewFull,
     About, InfoTest, ShowRez, Passwd2,
     Crypt, JmpToPb, NewTest, Setings,
     FileUtil {FileUtil din RX},
     uNagScreen;

{$R *.DFM}
{$R SOUNDS.RES}


const AboutID=99;

procedure tform1.winmsg(var msg:tmsg;var handled:boolean);
begin
  if msg.message=wm_syscommand then{if the message is a system one...}
   if msg.wparam = AboutID then ShowAboutBox;{then check if its parameter is AboutID,}
end;



Function Confirm(mesaj:string):boolean;
begin
 if InterfaceColors.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
 if MessageDlg(mesaj,mtConfirmation,[mbYes,mbNo],0)=mrYes
   then result:=true
   else result:=false;
end;


procedure TForm1.Iesire1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Reg : TRegistry;
begin
 if not SmallFonts then
   MessageDlg('Acest program a fost proiectat sa functioneze corect doar daca Windows este setat sa foloseasca SmallFonts'#13#10+
              'Programul functioneaza si cu LargeFonts dar s-ar putea ca ferestrele si textele sa apara disproportionate.',
              mtWarning,[mbOK],0);

 fontloaded:=false;
 if not LoadFont(extractfilepath(Application.ExeName)+'times.ttf',true)
   then MessageDlg('Can not load Times New Roman font.'#13#10+
              'The program will work, but some text may be not proportional.',
              mtWarning,[mbOK],0)
   else fontloaded:=true;


 //KeyPreview:=True;
 Form1.SetBounds(0,0,Screen.Width,Screen.Height);
 Application.HelpFile:=ExtractFilePath(paramstr(0))+'powtests.hlp';

 ImReady:=false;
 myimage1:=nil;
 ismyrichedit1:=false;
 ismyscrollbox1:=false;
 ismysplitter1:=false;
 ismybutonase:=false;
 ismybutonase2:=false;
 testloaded:=false;

 ForwardBtn.Enabled:=False; Inainte1.Enabled:=false;
 BackBtn.Enabled:=False; Inapoi1.Enabled:=false;
 Primaproblema1.Enabled:=false;Problemanr1.Enabled:=false;
 StopBtn.Enabled:=False;
 RefreshBtn.Enabled:=False;
 RezultateBtn.Enabled:=False;
 Rezultate1.Enabled:=False;
 InformatiiTest1.Enabled:=false;
 RepormireTest1.Enabled:=false;
 Arataimagineainfullscreen1.enabled:=false;
 Arataimagineamicsorata1.enabled:=false;

 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);

   if not Reg.ValueExists('acceptadoarvaloarea') then Reg.WriteBool('acceptadoarvaloarea', true);
   if not Reg.ValueExists('erracceptata') then Reg.WriteFloat('erracceptata', 0.001);
   if not Reg.ValueExists('arataraspunsuricorecte') then Reg.WriteBool('arataraspunsuricorecte', True);
   if not Reg.ValueExists('permisrebegin') then Reg.WriteBool('permisrebegin', True);
   if not Reg.ValueExists('multiuser') then Reg.WriteBool('multiuser', False);
   if not Reg.ValueExists('permisreopen') then Reg.WriteBool('permisreopen', True);
   if not Reg.ValueExists('notadinoficiu') then Reg.WriteInteger('notadinoficiu', 0);
   if not Reg.ValueExists('profpasswd') then Reg.WriteString('profpasswd', encrypt('',1998));
   if not Reg.ValueExists('calcpermis') then Reg.WriteBool('calcpermis', true);
   if not Reg.ValueExists('calcintern') then Reg.WriteBool('calcintern', true);
   if not Reg.ValueExists('calcpath') then Reg.WriteString('calcpath', 'c:\windows\calc.exe');
   if not Reg.ValueExists('showstartuptips') then Reg.WriteBool('showstartuptips', True);

   acceptadoarvaloarea:=Reg.ReadBool('acceptadoarvaloarea');
   erracceptata:=Reg.ReadFloat('erracceptata');
   arataraspunsuricorecte:=Reg.ReadBool('arataraspunsuricorecte');
   permisrebegin:=Reg.ReadBool('permisrebegin');
   multiuser:=Reg.ReadBool('multiuser');
   permisreopen:=Reg.ReadBool('permisreopen');
   notadinoficiu:=Reg.ReadInteger('notadinoficiu');
   profpasswd:=decrypt(Reg.ReadString('profpasswd'),1998);
   calcpermis:=Reg.ReadBool('calcpermis');
   calcintern:=Reg.ReadBool('calcintern');
   calcpath:=Reg.ReadString('calcpath');
   showstartuptips:=Reg.ReadBool('showstartuptips');
 finally
   Reg.Free;
 end;

 TipDialogFirstRun:=true;
 InterfaceColors:=TInterfaceLook.Create;
 InterfaceColors.LoadColorsFromRegistry;
 InterfaceColors.ApplyColors;
 if calcpermis then CalcBtn1.Enabled:=true else CalcBtn1.Enabled:=false; 

 application.onmessage:=winmsg;
 AppendMenu(GetSystemMenu(form1.handle,false),mf_separator,0,'');
 AppendMenu(GetSystemMenu(form1.handle,false),mf_byposition,AboutID,'About...');



 // Aici verific daca este versiunea inregistrata
 ProgramInregistrat:=IsRegistred;
 if not ProgramInregistrat then ShowNagScreen;
end;


procedure TForm1.FreeTest;
var i:integer;
begin
   if ismyscrollbox1 then begin
                             if myimage1<>nil then myimage1.free;
                             myimage1:=nil;
                             myscrollbox1.free;       // Odata cu distrugerea lui myscrollbox1 se distrug si toate obiectele legate de el
                             ismyscrollbox1:=false;   // si deci se distruge automat si myimage1.
                          end;
   if ismysplitter1 then begin
                             mysplitter1.free;
                             ismysplitter1:=false;
                         end;
   if ismyrichedit1 then begin
                             myrichedit1.free;
                             ismyrichedit1:=false;
                             end;

   if ismybutonase then
       begin
         ismybutonase:=false;
         for i:=1 to test1.problems[curentpb].nranswers do
           begin
             butonase[i].free;
             butonase[i]:=nil;
           end;
         for i:=1 to test1.problems[curentpb].nranswers do
           begin
             labels[i].free;
             labels[i]:=nil;
           end;
       end;

   if ismybutonase2 then
       begin
         for i:=1 to test1.problems[curentpb].nranswers do butonase2[i].free;
         for i:=1 to test1.problems[curentpb].nranswers do labels2[i].free;
         mylabel1.free;
         mylabel2.free;
         ismybutonase2:=false;
       end;
end;


procedure TForm1.CitesteButonaseRestrictiv(Sender:TObject;var key:Char);
var s:string;
begin
 if not ismybutonase then exit;

 if (key='-') and (Length(TEdit(Sender).Text)<>0) then
   begin
    s:=TEdit(Sender).Text;
    if pos('-',s)=1
      then Delete(s,1,1)
      else Insert('-',s,0);
    TEdit(Sender).Text:=s;
    key:=#0;
    exit;
   end;

 if ((key<'0') or (key>'9')) and
    ((key<>'.') or (pos('.',TEdit(Sender).Text)<>0) or (pos(',',TEdit(Sender).Text)<>0)) and
    ((key<>',') or (pos(',',TEdit(Sender).Text)<>0) or (pos('.',TEdit(Sender).Text)<>0)) and
    ((key<>'-') or (Length(TEdit(Sender).Text)<>0)) and
    (key<>#8)
      then begin
             key:=#0;
             beep;
           end;
end;

procedure TForm1.CitesteButonase(Sender:TObject);
var i:integer;
    s:string;
begin
   if not ismybutonase then exit;
   s:=(Sender as TWinControl).name;
   i:=strtoint(copy(s,3,length(s)-2));

   if Sender is TCheckBox then
      if (Sender as TCheckBox).Checked then test1.problems[curentpb].useranswers[i]:='1'
      else test1.problems[curentpb].useranswers[i]:='0'
   else if Sender is TEdit then
      test1.problems[curentpb].useranswers[i]:=(Sender as TEdit).Text
   else if Sender is TComboBox then
      test1.problems[curentpb].useranswers[i]:=inttostr((Sender as TComboBox).ItemIndex);
end;


procedure TForm1.DisableInput;
var i:integer;
begin
for i:=1 to test1.problems[curentpb].nranswers do
  butonase[i].enabled:=false;
end;


procedure TForm1.ArataRaspunsuri;
var i:integer;
    pss:string;
begin
   if ismybutonase2 then
       begin
         for i:=1 to test1.problems[oldpb].nranswers do butonase2[i].free;
         for i:=1 to test1.problems[oldpb].nranswers do labels2[i].free;
         mylabel1.free;
         mylabel2.free;
         ismybutonase2:=false;
       end;

  scrollbox1.vertscrollbar.position:=0;
  mylabel1 := TLabel.Create(Self);
  mylabel1.parent:=scrollbox1;
  mylabel1.top:=0;
  mylabel1.left:=scrollbox1.Width div 2;
  mylabel1.height:=14;
  mylabel1.font.Color:=InterfaceColors.Label1Color;
  mylabel1.caption:='Raspunsuri corecte:';


  ismybutonase2:=true;
  for i:=1 to test1.problems[curentpb].nranswers do
     begin
       labels2[i]:=TLabel.Create(Self);
       labels2[i].visible:=false;
       labels2[i].parent:=scrollbox1;
       labels2[i].Font.Size:=12;
       labels2[i].Font.Style := [fsItalic];
       labels2[i].caption:=char(64+i)+'.';
       labels2[i].left:=scrollbox1.width div 2;
       labels2[i].top:=i*(labels2[i].height+4)-labels2[i].height+16;
       labels2[i].Font.Color:=InterfaceColors.ABCDEColor;
       labels2[i].visible:=true;

       if test1.problems[curentpb].AnswerType = 0 then   // TCheckBox
           begin
             butonase2[i]:=TCheckBox.Create(Self);
             butonase2[i].visible:=false;
             butonase2[i].parent := scrollbox1;
             TCheckBox(butonase2[i]).Caption:='';
             if test1.problems[curentpb].answers[i].value='1' then (butonase2[i] as TCheckBox).Checked:=true
             else (butonase2[i] as TCheckBox).Checked:=false
           end
       else if test1.problems[curentpb].AnswerType = 2 then   // TEdit
           begin
             butonase2[i]:=TEdit.Create(Self);
             butonase2[i].visible:=false;
             butonase2[i].parent := scrollbox1;
             (butonase2[i] as TEdit).Text:=test1.problems[curentpb].answers[i].value;
           end
       else if test1.problems[curentpb].AnswerType = 1 then   // TComboBox
           begin
             butonase2[i]:=TComboBox.Create(Self);
             butonase2[i].visible:=false;
             butonase2[i].parent := scrollbox1;
             TComboBox(butonase2[i]).Style:=csDropDownList;
             BreakString(test1.problems[curentpb].answers[i].ExtraParams,TComboBox(butonase2[i]).Items);
             try
               TComboBox(butonase2[i]).ItemIndex:=strtoint(test1.problems[curentpb].answers[i].value);
             except
               TComboBox(butonase2[i]).ItemIndex:=-1;
             end;
           end;
       butonase2[i].left:=labels2[i].left+24;
       butonase2[i].top:=labels2[i].top;
       butonase2[i].enabled:=false;
       butonase2[i].visible:=true;
     end;

  mylabel2:=TLabel.Create(Self);
  mylabel2.visible:=false;
  mylabel2.parent:=scrollbox1;
  mylabel2.Font.Color:=clRed;
  mylabel2.Font.Size:=14;
  mylabel2.Font.Style := [fsItalic]+[fsBold];
  mylabel2.top:=labels2[test1.problems[curentpb].nranswers].top+labels2[1].height+20;
  mylabel2.left:=24;
  mylabel2.visible:=true;

  if IsPbCorect(curentpb)=test1.problems[curentpb].puncte
     then mylabel2.caption:='Corect.'
  else if IsPbCorect(curentpb)>0
     then mylabel2.caption:='Partial corect !'
  else if IsPbCorect(curentpb)=0
     then mylabel2.caption:='Gresit !';

  pss:='Puncte obtinute la problema: '+floattostrf(IsPbCorect(curentpb),ffGeneral,3,0);
  if test1.problems[curentpb].partialansw then pss:=pss+'  ( S-a acordat punctaj partial )';
  Statusbar1.Panels[2].Text := pss;

end;



Function TForm1.IsPbCorect(nrpb:integer):extended;

function expreqv(stas:string;user:string):boolean; // {**} functioneaza doar pentru cand se introduc valori nu si expresii
var stasv,userv:extended;
    i:integer;
begin
 if DecimalSeparator='.' then   // Daca DecimalSeparator='.' atunci inlocuieste toate ',' cu '.'
   begin
     for i:=0 to Length(stas)-1 do if stas[i]=',' then stas[i]:='.';
     for i:=0 to Length(user)-1 do if user[i]=',' then user[i]:='.';
   end;
 if DecimalSeparator=',' then   // Daca DecimalSeparator=',' atunci inlocuieste toate '.' cu ','
   begin
     for i:=0 to Length(stas)-1 do if stas[i]='.' then stas[i]:=',';
     for i:=0 to Length(user)-1 do if user[i]='.' then user[i]:=',';
   end;

 result:=false;
 try
   stasv:=strtofloat(stas);
   userv:=strtofloat(user);
   if (userv>=stasv-erracceptata) and (userv<=stasv+erracceptata)
    then result:=true;
 except
   result:=false;
 end;
end;

var i:integer;
    p:extended;
    pp:integer;
begin
 if test1.problems[nrpb].partialansw then
 begin
  result:=0;
  p:=test1.problems[nrpb].puncte/test1.problems[nrpb].nranswers;  // p = ce punctaj se acorda pe un subpunct corect
  if test1.problems[nrpb].AnswerType=2 then
    begin
     pp:=0;           // numarul de subpuncte rezolvate corect
     for i:=1 to test1.problems[nrpb].nranswers do
       if expreqv(test1.problems[nrpb].answers[i].value,test1.problems[nrpb].useranswers[i])
          then inc(pp);
     if pp=test1.problems[nrpb].nranswers then result:=test1.problems[nrpb].puncte
                                          else result:=pp*p;
    end;
  if test1.problems[nrpb].AnswerType=1 then
    begin
      pp:=0;          // numarul de subpuncte rezolvate corect
      for i:=1 to test1.problems[nrpb].nranswers do
        if test1.problems[nrpb].answers[i].value=test1.problems[nrpb].useranswers[i]
          then inc(pp);
      if pp=test1.problems[nrpb].nranswers then result:=test1.problems[nrpb].puncte
                                          else result:=pp*p;
    end;
 end
 else
 begin
  result:=test1.problems[nrpb].puncte;
  case test1.problems[nrpb].AnswerType of
  0,1: begin
      for i:=1 to test1.problems[nrpb].nranswers do
      if test1.problems[nrpb].answers[i].value<>test1.problems[nrpb].useranswers[i]
        then result:=0;
     end;
  2: begin
      for i:=1 to test1.problems[nrpb].nranswers do
      if not expreqv(test1.problems[nrpb].answers[i].value,test1.problems[nrpb].useranswers[i])
        then result:=0;
     end;
  end;
 end;
end;


procedure TForm1.MyImageResize;
begin
     if not imready then exit;
     if (MyImage1=nil) or (not isMyScrollBox1) then exit;
     if ((MyImage1.Picture.Width>MyScrollBox1.Width) or
        (MyImage1.Picture.Height>MyScrollBox1.Height)) then
     begin
      MyImage1.Align:=alNone;
      MyImage1.Stretch:=true;
      Myimage1.autosize:=false;
      if MyImage1.Picture.Width>=MyImage1.Picture.Height
         then begin
           MyImage1.Width:=MyScrollBox1.Width-6;
           MyImage1.Height:=trunc(MyImage1.Width/(MyImage1.Picture.Width/MyImage1.Picture.Height));
         end
         else begin
           MyImage1.Height:=MyScrollBox1.Height-6;
           MyImage1.Width:=trunc(MyImage1.Height*(MyImage1.Picture.Width/MyImage1.Picture.Height));
         end;
     end
     else begin
       MyImage1.Align:=alNone;
       MyImage1.Stretch:=false;
       Myimage1.autosize:=true;
     end;
end;



procedure TForm1.myrichedit1onenter(sender:TObject);
begin
 ActiveControl:=scrollBox1;  //toolbar1;
end;


procedure TForm1.MyScrollBoxResize(Sender: TObject);
begin
 if Imaginemicsorata1.checked then
   if (MyImage1<>nil) and IsMyScrollBox1 then
      MyImageResize;
end;



procedure TForm1.UpdatePb;
var isrtf,isimg:boolean;
    i:integer;
    pss:string;
begin
 imready:=false;

 isrtf:=true;
 if test1.problems[curentpb].ImgType<>$FF then isimg:=true else isimg:=false;

 if isrtf and (not isimg) then  // Daca problema are doar text fara imagine
    begin
      Arataimagineainfullscreen1.enabled:=false;
      Arataimagineamicsorata1.enabled:=false;

      if ismyscrollbox1 then begin
                                if myimage1<>nil then myimage1.Free;
                                myimage1:=nil;
                                myscrollbox1.free;       // Odata cu distrugerea lui myscrollbox1 se distrug si toate obiectele legate de el
                                ismyscrollbox1:=false;   // si deci se distruge automat si myimage1.
                             end;
      if ismysplitter1 then begin
                                mysplitter1.free;
                                ismysplitter1:=false;
                            end;
      if not ismyrichedit1 then begin
                                  myrichedit1 := TRichEdit98.Create(Self);
                                  myrichedit1.IncludeOLE:=InterfaceColors.editincludeole;
                                  ismyrichedit1 :=true;
                                end;
      myrichedit1.parent := panel1;
      myrichedit1.onenter := myrichedit1onenter;
      myrichedit1.cursor:=crArrow;
      myrichedit1.align:=alClient;
      myrichedit1.readonly:=true;
      myrichedit1.HelpContext:=103;
      myrichedit1.PopupMenu:=PopupMenu4;
      if InterfaceColors.editurldetect
        then myrichedit1.AutoURLDetect:=adDefault
        else myrichedit1.AutoURLDetect:=adNone;
      myrichedit1.WordWrap:=InterfaceColors.EditWordWrap;
      if myrichedit1.WordWrap then myrichedit1.ScrollBars:=ssVertical
                              else myrichedit1.ScrollBars:=ssBoth;
      myrichedit1.Color:=InterfaceColors.RichEditColor;
      myrichedit1.visible:=true;


      test1.problems[curentpb].LoadRTF(myrichedit1.lines);
    end;

 if isrtf and isimg then        // Daca problema are si text si imagine
    begin

      Arataimagineainfullscreen1.enabled:=true;
      Arataimagineamicsorata1.enabled:=true;


      if isMyScrollBox1 then
       if myimage1<>nil
         then begin myimage1.free;myimage1:=nil;end;  // Daca este prezent scrollbox-ul, inseamna ca este o img. acolo si trebuie sa o sterg pentru ca sa nu se suprapuna

      if not ismyrichedit1 then begin
                                  myrichedit1 := TRichEdit98.Create(Self);
                                  myrichedit1.IncludeOLE:=InterfaceColors.editincludeole;
                                  ismyrichedit1 :=true;
                                end;
      myrichedit1.parent := panel1;
      myrichedit1.onenter:= myrichedit1onenter;
      myrichedit1.cursor := crArrow;
      myrichedit1.align  := alLeft;
      myrichedit1.width  := Screen.Width div 2;
      myrichedit1.readonly:=true;
      myrichedit1.HelpContext:=103;
      myrichedit1.PopupMenu:=PopupMenu4;
      if InterfaceColors.editurldetect
        then myrichedit1.AutoURLDetect:=adDefault
        else myrichedit1.AutoURLDetect:=adNone;
      myrichedit1.WordWrap:=InterfaceColors.EditWordWrap;
      if myrichedit1.WordWrap then myrichedit1.ScrollBars:=ssVertical
                              else myrichedit1.ScrollBars:=ssBoth;
      myrichedit1.Color:=InterfaceColors.RichEditColor;
      myrichedit1.visible:= true;

      test1.problems[curentpb].LoadRTF(myrichedit1.lines);

      if not ismysplitter1 then begin
                                  mysplitter1 := TSplitter.Create(Self);
                                  ismysplitter1:=true;
                                 end;
      mysplitter1.color:=InterfaceColors.MySpliter1Color;
      mysplitter1.parent := panel1;
      mysplitter1.Beveled:=false;
      mysplitter1.align := alLeft;
      mysplitter1.left:=myrichedit1.left+myrichedit1.Width;

      if not ismyscrollbox1 then begin
                                  myscrollbox1 := TScrollBox.Create(Self);
                                  ismyscrollbox1:=true;
                                 end;
      myscrollbox1.parent := panel1;
      myscrollbox1.align  := alClient;
      myscrollbox1.color  := InterfaceColors.MyScrollBoxColor;  // clWhite;
      myscrollbox1.visible:=true;
      myscrollbox1.HelpContext:=103;

      if myimage1=nil then myimage1 := TImage.Create(Self);
      myimage1.parent:=myscrollbox1;
      myimage1.PopupMenu:=PopupMenu1;


      test1.problems[curentpb].LoadImg(myimage1.Picture);

      imready:=true;
      myscrollbox1.OnResize:=MyScrollBoxResize;

     if ImagineMicsorata1.checked then
          myimageresize
     else
       begin
          myimage1.align:=AlNone;
          myimage1.stretch:=false;
          myimage1.autosize:=true;
       end;

    end;

   if ismybutonase then
       begin
         for i:=1 to test1.problems[oldpb].nranswers do butonase[i].free;
         for i:=1 to test1.problems[oldpb].nranswers do labels[i].free;
         ismybutonase:=false;
       end;


  scrollbox1.VertScrollBar.Position:=0;
  ismybutonase:=true;
  for i:=1 to test1.problems[curentpb].nranswers do
     begin
       labels[i]:=TLabel.Create(Self);
       labels[i].visible:=false;
       labels[i].parent:=scrollbox1;
       labels[i].Font.Size:=12;
       labels[i].Font.Style := [fsItalic];
       labels[i].caption:=char(64+i)+'.';
       labels[i].left:=10;
       labels[i].top:=i*(labels[i].height+4)-labels[i].height+16;
       labels[i].Font.Color:=InterfaceColors.ABCDEColor;
       labels[i].visible:=true;

       if test1.problems[curentpb].AnswerType = 0 then   // TCheckBox
           begin
             butonase[i]:=TCheckBox.Create(Self);
             butonase[i].visible:=false;
             butonase[i].parent := scrollbox1;
             butonase[i].Name:='B_'+inttostr(i);   // Numele este folosit de metoda CitesteButonase
             butonase[i].HelpContext:=1001;
             Whatsthis1.HelpContext:=butonase[i].HelpContext;
             TCheckBox(butonase[i]).PopupMenu:=PopupMenu2;
             TCheckBox(butonase[i]).Caption:='';
             TCheckBox(butonase[i]).OnClick:=citestebutonase;
             if test1.problems[curentpb].useranswers[i]='1' then (butonase[i] as TCheckBox).Checked:=true
             else (butonase[i] as TCheckBox).Checked:=false
           end
       else if test1.problems[curentpb].AnswerType = 2 then   // TEdit
           begin
             butonase[i]:=TEdit.Create(Self);
             butonase[i].visible:=false;
             butonase[i].parent := scrollbox1;
             butonase[i].Name:='B_'+inttostr(i);
             butonase[i].HelpContext:=1003;
             Whatsthis1.HelpContext:=butonase[i].HelpContext;
             TEdit(butonase[i]).PopupMenu:=PopupMenu2;
             if acceptadoarvaloarea then TEdit(butonase[i]).OnKeyPress:=CitesteButonaseRestrictiv;
             TEdit(butonase[i]).OnChange:=citestebutonase;
             (butonase[i] as TEdit).Text:=test1.problems[curentpb].useranswers[i];
           end
       else if test1.problems[curentpb].AnswerType = 1 then   // TComboBox
           begin
             butonase[i]:=TComboBox.Create(Self);
             butonase[i].visible:=false;
             butonase[i].parent := scrollbox1;
             butonase[i].Name:='B_'+inttostr(i);
             butonase[i].HelpContext:=1005;
             Whatsthis1.HelpContext:=butonase[i].HelpContext;
             TComboBox(butonase[i]).PopupMenu:=PopupMenu2;
             TComboBox(butonase[i]).Style:=csDropDownList;
             TComboBox(butonase[i]).OnChange:=citestebutonase;
             BreakString(test1.problems[curentpb].answers[i].ExtraParams,TComboBox(butonase[i]).Items);
             try
               TComboBox(butonase[i]).ItemIndex:=strtoint(test1.problems[curentpb].useranswers[i]);
             except
               TComboBox(butonase[i]).ItemIndex:=-1;
             end;
           end;

       butonase[i].left:=labels[i].left+24;
       butonase[i].top:=labels[i].top;
       butonase[i].visible:=true;
     end;

  if stoptestare then DisableInput;

  if stoptestare and arataraspunsuricorecte then arataraspunsuri;

  Statusbar1.Panels[0].Text := 'Problema :'+inttostr(curentpb)+'/'+inttostr(test1.nrproblems)+'   ('+test1.problems[curentpb].PBFileName+')';

  if not stoptestare then
  begin
     pss:='Punctaj problema: '+inttostr(test1.problems[curentpb].Puncte);
     if test1.problems[curentpb].partialansw
         then pss:='Se acorda punctaj partial ('+
                 floattostrf(test1.problems[curentpb].Puncte/test1.problems[curentpb].NrAnswers,ffGeneral,3,0)+
                 ' puncte *' +
                 inttostr(test1.problems[curentpb].NrAnswers)+
                 ' ) !';
  end
  else
  begin
    pss:='Puncte obtinute la problema: '+floattostrf(IsPbCorect(curentpb),ffGeneral,3,0);
    if test1.problems[curentpb].partialansw then pss:=pss+'  ( S-a acordat punctaj partial )';
  end;
  Statusbar1.Panels[2].Text := pss;

end;


procedure TForm1.ForwardBtnClick(Sender: TObject);
begin
   if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
   oldpb:=curentpb;
   inc(curentpb);
   if curentpb=test1.nrproblems then begin
                                       ForwardBtn.Enabled:=False;
                                       Inainte1.Enabled:=false;
                                     end;
   if BackBtn.Enabled=False then begin
                                   BackBtn.Enabled:=true;
                                   Inapoi1.Enabled:=true;
                                 end;
   updatepb;
end;

procedure TForm1.BackBtnClick(Sender: TObject);
begin
  if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
  oldpb:=curentpb;
  dec(curentpb);
  if curentpb=1 then begin BackBtn.Enabled:=False;Inapoi1.Enabled:=false;end;
  if ForwardBtn.Enabled=False then begin
                                     ForwardBtn.Enabled:=true;
                                     Inainte1.Enabled:=true;
                                   end;
  updatepb;
end;


procedure TForm1.Despreprogram1Click(Sender: TObject);
begin
 ShowAboutBox;
end;



procedure TForm1.RefreshBtnClick(Sender: TObject);
begin
 if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 if ismyrichedit1 then myrichedit1.refresh;
 if timer1.enabled then Ceas(PaintBox1,curenttime,test1.time);
end;


procedure TForm1.OnTestStop;
begin
    DisableInput;
    stoptestare:=true;
    timer1.Enabled:=false;
    RegistrationTimer.Enabled:=false;
    if ArataRaspunsuriCorecte then ArataRaspunsuri;
    RezultateBtn.Enabled:=True;
    Rezultate1.Enabled:=True;

    if InterfaceColors.Sounds then PlaySound('COMPLETE', hInstance, snd_ASync or snd_Resource);
    ShowRezultate;
end;


procedure TForm1.Ceas(pb:TImage;min,total:integer);
begin
 with pb do
  begin
   canvas.pen.color:=clBlack;
   canvas.brush.color:=clBtnFace;
   canvas.ellipse(0,0,width,height);
   canvas.brush.color:=clBtnShadow;
   canvas.pie(0,0,width,height,
                 trunc((width div 2)*(1+cos(pi/2-(min/total)*2*pi))),
                 trunc((height div 2)*(1-sin(pi/2-(min/total)*2*pi))),
                 width div 2,0);
  end;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  inc(curenttime);
  Statusbar1.Panels[1].Text := 'Timp :'+inttostr(curenttime)+'/'+inttostr(test1.time);
  Ceas(PaintBox1,curenttime,test1.time);
  PaintBox1.Hint:='Timp :'+inttostr(curenttime)+'/'+inttostr(test1.time);
  if curenttime>=test1.time then
     begin
       timer1.Enabled:=false;
       RegistrationTimer.Enabled:=false;
       stoptestare:=true;
       Statusbar1.Panels[1].Text := 'Timp expirat !';
       MessageDlg('Timpul a expirat !!!',mtInformation,[mbOK],0);

       OnTestStop;
     end;
end;


procedure TForm1.StopBtnClick(Sender: TObject);
begin
 if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 if not confirm(' Sunteti sigur(a) ca doriti terminarea testului inainte de expirarea timpului ?')
   then exit;
 StopBtn.Enabled:=false;
 onteststop;
end;


procedure TForm1.Repormiretest1Click(Sender: TObject);
begin
 if not permisrebegin then
  begin
   showmessage('Nu aveti permisiunea sa reporniti testul !');
   exit;
  end;
 if not confirm(' Doriti repornirea testului ?')
    then exit;
 if InterfaceColors.Sounds then PlaySound('NEW', hInstance, snd_ASync or snd_Resource);

 imready:=false;
 freetest;
 curenttime:=0;
 stoptestare:=false;
 curentpb := 1; oldpb := curentpb;
 BackBtn.Enabled:=False; Inapoi1.Enabled:=false;
 if test1.nrproblems>1 then begin ForwardBtn.Enabled:=True; Inainte1.Enabled:=True;end
                       else begin ForwardBtn.Enabled:=False; Inainte1.Enabled:=False;end;
 Primaproblema1.Enabled:=True;Problemanr1.Enabled:=True;
 StopBtn.Enabled:=True;
 RezultateBtn.Enabled:=False;
 Rezultate1.Enabled:=False;
 if test1.Time>0 then begin
                        Timer1.Enabled:=True;
                        Statusbar1.Panels[1].Text := 'Timp : 0/'+inttostr(test1.time);
                        Ceas(PaintBox1,0,test1.time);
                      end
                 else begin
                        Timer1.Enabled:=False;
                        Statusbar1.Panels[1].Text := 'Timp : Nelimitat';
                      end;

 Test1.ClearUserAnswers;

 UpdatePb;

 if not ProgramInregistrat then
  begin
    RegistrationTimer.Enabled:=true;
    RegistrationCount:=5;
  end;

end;

procedure TForm1.Informatiitest1Click(Sender: TObject);
begin
 GetTestInfo;
end;


procedure TForm1.RezultateBtnClick(Sender: TObject);
begin
 if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 ShowRezultate;
end;


procedure TForm1.DeactivateControls;
begin
 if testloaded then freetest;

 Timer1.Enabled:=false;
 RegistrationTimer.Enabled:=false;
 stoptestare:=true;

 myimage1:=nil;
 ismyrichedit1:=false;
 ismyscrollbox1:=false;
 ismysplitter1:=false;
 ismybutonase:=false;
 ismybutonase2:=false;

 ForwardBtn.Enabled:=False; Inainte1.Enabled:=false;
 BackBtn.Enabled:=False; Inapoi1.Enabled:=false;
 Primaproblema1.Enabled:=false; Problemanr1.Enabled:=false;
 StopBtn.Enabled:=False;
 RefreshBtn.Enabled:=False;
 RezultateBtn.Enabled:=False;
 Rezultate1.Enabled:=False;
 InformatiiTest1.Enabled:=false;
 RepormireTest1.Enabled:=false;
 Arataimagineainfullscreen1.enabled:=false;
 Arataimagineamicsorata1.enabled:=false;
 StatusBar1.Panels[0].Text:='';
 StatusBar1.Panels[1].Text:='';
 StatusBar1.Panels[2].Text:='';
end;


procedure TForm1.CloseTestImediat;
begin
 ImReady:=false;
 if not testloaded then exit;
 DeactivateControls;
 test1.free;           // Daca exista deja un test incarcat se va scapa de el
 testloaded:=false;
end;


procedure TForm1.Incarcatest1Click(Sender: TObject);
var testfilename:string;
    pss:string;
begin
 if testloaded and not permisreopen then
  begin
   showmessage('Nu aveti permisiunea sa incarcati alt test !');
   exit;
  end;


 {if multiuser then
    if LoginPrompt='' then
      begin
        showmessage('Nu aveti dreptul sa intrati in sistem deoarece nu v-ati identificat !');
        exit;
      end;}


 GetDir(0,pss);
 if (Sender as TMenuItem).Name='Incarcatest1' then
 begin
    OpenDialog1.InitialDir:=InterfaceColors.browserdir;
    if not OpenDialog1.execute then begin chdir(pss);exit;end;
    testfilename:=opendialog1.filename;
    if not fileexists(testfilename) then
       begin
         showmessage('Test file is missing');
         exit;
       end;
 end
 else testfilename:=InterfaceColors.browserdir+'\'+GetTSTFileName;
 if (testfilename='') or (testfilename=InterfaceColors.browserdir+'\') then begin chdir(pss);exit;end;

 ImReady:=false;
 Screen.Cursor:=crHourGlass;

 CloseTestImediat;

 test1 := TTest.Create;

 try
   Test1.LoadFromFile(testfilename);
   if Test1.NrProblems=0 then
     begin
        Test1.free;
        Screen.Cursor:=crDefault;
        if InterfaceColors.Sounds
           then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource)
           else beep;
        MessageDlg('A aparut o eroare la incarcarea testului.'#13#10+
                   'Nu exista probleme in directorul '+Test1.Path,mtError,[mbOK],0);
        exit;
     end;
 except
   Test1.free;
   Screen.Cursor:=crDefault;
   if InterfaceColors.Sounds
         then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource)
         else beep;
   MessageDlg('A aparut o eroare la incarcarea testului.'#13#10+
              'Folderul '+Test1.Path+' este inexistent sau incorect',
              mtError,[mbOK],0);
   exit;
 end;

 testloaded:=true;

 if test1.Time>0 then Timer1.Enabled:=True
                 else Timer1.Enabled:=False;
 curenttime:=0;
 stoptestare:=false;
 curentpb := 1; oldpb := curentpb;

 BackBtn.Enabled:=False; Inapoi1.Enabled:=false;
 if test1.nrproblems>1 then begin ForwardBtn.Enabled:=True; Inainte1.Enabled:=True;end
                       else begin ForwardBtn.Enabled:=False; Inainte1.Enabled:=False;end;
 Primaproblema1.Enabled:=True;Problemanr1.Enabled:=True;
 StopBtn.Enabled:=True;
 RefreshBtn.Enabled:=True;
 RezultateBtn.Enabled:=False;
 Rezultate1.Enabled:=False;
 Informatiitest1.Enabled:=true;
 RepormireTest1.Enabled:=true;

 UpdatePb;

 MainCaption.CaptionText.Caption:='PowerTests ('+test1.TestName+')';
 if test1.time>0 then begin
                        Statusbar1.Panels[1].Text := 'Timp : 0/'+inttostr(test1.time);
                        Ceas(PaintBox1,0,test1.time);
                      end
                 else Statusbar1.Panels[1].Text := 'Timp : Nelimitat';

 Screen.Cursor:=crDefault;
 if InterfaceColors.Sounds then PlaySound('NEW', hInstance, snd_ASync or snd_Resource);

 if not ProgramInregistrat then
  begin
    RegistrationTimer.Enabled:=true;
    RegistrationCount:=5;
  end;  
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var Reg : TRegistry;
begin

 if testloaded and
    (not stoptestare) and
    (not confirm('Sunteti sigur(a) ca doriti terminarea testului inainte de expirarea timpului ?'))
       then begin Action:=caNone;exit;end else Action:=caFree;
 if testloaded and not confirm('Sunteti sigur(a) ca doriti parasirea programului ?')
       then begin Action:=caNone;exit;end else Action:=caFree;

 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);

   Reg.WriteBool('acceptadoarvaloarea', acceptadoarvaloarea);
   Reg.WriteFloat('erracceptata', erracceptata);
   Reg.WriteBool('arataraspunsuricorecte', arataraspunsuricorecte);
   Reg.WriteBool('permisrebegin', permisrebegin);
   Reg.WriteBool('multiuser', multiuser);
   Reg.WriteBool('permisreopen', permisreopen);
   Reg.WriteInteger('notadinoficiu', notadinoficiu);
   Reg.WriteString('profpasswd',encrypt(profpasswd,1998));
   Reg.WriteBool('calcpermis', calcpermis);
   Reg.WriteBool('calcintern', calcintern);
   Reg.WriteString('calcpath', calcpath);
   Reg.WriteBool('showstartuptips', showstartuptips);          
 finally
   Reg.Free;
 end;

 InterfaceColors.SaveColorsToRegistry;

end;

procedure TForm1.Arataimaginea1Click(Sender: TObject);
begin
  if InterfaceColors.Sounds then PlaySound('ZOOMIN', hInstance, snd_ASync or snd_Resource);

  ViewFullScreenImage(MyImage1.Picture);

  if InterfaceColors.Sounds then PlaySound('ZOOMOUT', hInstance, snd_ASync or snd_Resource);
end;

procedure TForm1.Imaginemicsorata1Click(Sender: TObject);
begin
 ImagineMicsorata1.checked := not ImagineMicsorata1.checked;
 Arataimagineamicsorata1.checked := not Arataimagineamicsorata1.checked;
 if ImagineMicsorata1.checked
 then MyImageResize
 else
    begin
      myimage1.align:=AlNone;
      myimage1.stretch:=false;
      myimage1.autosize:=true;
    end;
end;

procedure TForm1.Arataimagineainfullscreen1Click(Sender: TObject);
begin
 Arataimaginea1Click(sender);
end;

procedure TForm1.Arataimagineamicsorata1Click(Sender: TObject);
begin
 Imaginemicsorata1Click(sender);
end;

procedure TForm1.Inainte1Click(Sender: TObject);
begin
 ForwardBtnClick(sender);
end;

procedure TForm1.Inapoi1Click(Sender: TObject);
begin
 BackBtnClick(Sender);
end;

Function TForm1.GotoProblem(pbtojmp:integer):boolean;
begin
 if pbtojmp=curentpb then
   begin
     result:=false;
     exit;
   end;

 oldpb:=curentpb;
 curentpb:=pbtojmp;
 if curentpb=1 then begin BackBtn.Enabled:=False;Inapoi1.Enabled:=false;end
               else begin BackBtn.Enabled:=True;Inapoi1.Enabled:=True;end;
 if curentpb=test1.nrproblems then begin ForwardBtn.Enabled:=False;Inainte1.Enabled:=False;end
                               else begin ForwardBtn.Enabled:=True;Inainte1.Enabled:=True;end;
 updatepb;
 result:=true;
end;

procedure TForm1.Problemanr1Click(Sender: TObject);
var pbtojmp:integer;
begin
 pbtojmp:=SariLaOProblema(curentpb);
 if not GotoProblem(pbtojmp) then exit;
 if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
end;

procedure TForm1.Primaproblema1Click(Sender: TObject);
begin
   if curentpb=1 then exit;
   oldpb:=curentpb;
   curentpb:=1;
   BackBtn.Enabled:=False;Inapoi1.Enabled:=false;
   if curentpb=test1.nrproblems then begin ForwardBtn.Enabled:=False;Inainte1.Enabled:=False;end
                                else begin ForwardBtn.Enabled:=True;Inainte1.Enabled:=True;end;
   updatepb;
   if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
end;

procedure TForm1.CalcBtn1Click(Sender: TObject);
begin
 if InterfaceColors.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 if calcintern then rxcalculator1.execute
               else shellexecute(Form1.Handle,nil,PChar(calcpath),PChar(''),PChar(''),sw_show);
end;


Procedure TInterfaceLook.ApplyColors;
var i:integer;
begin
  Form1.Color:=FormColor;
  Form1.Panel1.Color:=RichEditColor;
  Form1.ScrollBox1.Color:=ScrollBox1Color;
  Form1.Label1.Color:=Form1.ScrollBox1.Color;Form1.Label1.Font.Color:=Label1Color;
  Form1.Splitter1.Color:=Spliter1Color;
  if Form1.IsMySplitter1 then Form1.MySplitter1.Color:=MySpliter1Color;
  If Form1.ismyrichedit1 then Form1.myrichedit1.Color:=RichEditColor;
  If Form1.ismyscrollbox1 then Form1.myscrollbox1.Color:=MyScrollBoxColor;
  If Form1.ismybutonase then
     for i:=1 to form1.test1.problems[form1.curentpb].nranswers do
        form1.labels[i].font.Color:=ABCDEColor;;
  If Form1.ismybutonase2 then
     for i:=1 to form1.test1.problems[form1.curentpb].nranswers do
        form1.labels2[i].font.Color:=ABCDEColor;;
end;


Procedure TInterfaceLook.SaveColorsToRegistry;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);

   Reg.WriteInteger('color1', FormColor);
   Reg.WriteInteger('color2', ScrollBox1Color);
   Reg.WriteInteger('color3', Label1Color);
   Reg.WriteInteger('color4h', Spliter1Color);
   Reg.WriteInteger('color4v', MySpliter1Color);
   Reg.WriteInteger('color5', RichEditColor);
   Reg.WriteInteger('color6', MyScrollBoxColor);
   Reg.WriteInteger('color7', ABCDEColor);
   Reg.WriteBool('sounds',Sounds);

   Reg.WriteBool('editincludeole',editincludeole);
   Reg.WriteBool('editurldetect',editurldetect);
   Reg.WriteBool('editwordwrap',editwordwrap);

   Reg.WriteString('browserdir', RemoveBackSlash(browserdir));

 finally
   Reg.Free;
 end;
end;



Procedure TInterfaceLook.LoadColorsFromRegistry;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);
   if (not Reg.ValueExists('color1')) or
      (not Reg.ValueExists('color2')) or
      (not Reg.ValueExists('color3')) or
      (not Reg.ValueExists('color4h')) or
      (not Reg.ValueExists('color4v')) or
      (not Reg.ValueExists('color5')) or
      (not Reg.ValueExists('color6')) or
      (not Reg.ValueExists('color7')) or
      (not Reg.ValueExists('sounds')) then
          begin
             Reg.WriteInteger('color1', FormColor);
             Reg.WriteInteger('color2', ScrollBox1Color);
             Reg.WriteInteger('color3', Label1Color);
             Reg.WriteInteger('color4h', Spliter1Color);
             Reg.WriteInteger('color4v', MySpliter1Color);
             Reg.WriteInteger('color5', RichEditColor);
             Reg.WriteInteger('color6', MyScrollBoxColor);
             Reg.WriteInteger('color7', ABCDEColor);
             Reg.WriteBool('sounds', Sounds);
          end;

   if not Reg.ValueExists('editincludeole') then Reg.WriteBool('editincludeole', True);
   if not Reg.ValueExists('editurldetect') then Reg.WriteBool('editurldetect', True);
   if not Reg.ValueExists('editwordwrap') then Reg.WriteBool('editwordwrap', True);

   if not Reg.ValueExists('browserdir') then Reg.WriteString('browserdir', ExtractFilePath(paramstr(0))+'Tests');

   FormColor:=Reg.ReadInteger('color1');
   ScrollBox1Color:=Reg.ReadInteger('color2');
   Label1Color:=Reg.ReadInteger('color3');
   Spliter1Color:=Reg.ReadInteger('color4h');
   MySpliter1Color:=Reg.ReadInteger('color4v');
   RichEditColor:=Reg.ReadInteger('color5');
   MyScrollBoxColor:=Reg.ReadInteger('color6');
   ABCDEColor:=Reg.ReadInteger('color7');
   Sounds:=Reg.ReadBool('sounds');

   editincludeole   := Reg.ReadBool('editincludeole');
   editurldetect    := Reg.ReadBool('editurldetect');
   editwordwrap     := Reg.ReadBool('editwordwrap');

   browserdir       := RemoveBackSlash(Reg.ReadString('browserdir'));
   if not DirExists(browserdir) then
      begin
        if Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
        MessageDlg(Format('Folderul cu teste %s este incorect.'#13#10'Se foloseste folderul implicit: %s',[browserdir,ExtractFilePath(ParamStr(0))+'Tests']),mtError,[mbOK],0);
        browserdir:=ExtractFilePath(ParamStr(0))+'Tests';
      end;

 finally
   Reg.Free;
 end;
end;


Constructor TInterfaceLook.Create;
begin
  FormColor:=clBtnFace;
  ScrollBox1Color:=clBtnFace;
  Label1Color:=clBlack;
  Spliter1Color:=clBtnFace;
  MySpliter1Color:=clBtnFace;
  RichEditColor:=clWindow;
  MyScrollBoxColor:=clWindow;
  ABCDEColor:=clBlue;
  Sounds:=true;

  editincludeole:=true;
  editurldetect:=true;
  editwordwrap:=true;

  browserdir:=ExtractFilePath(paramstr(0))+'Tests';
end;


Procedure   TInterfaceLook.ApplyEditorSettings;
begin
 if not form1.ismyrichedit1 then exit;

 if editincludeole
      then begin
              if not Form1.myrichedit1.IncludeOLE then Form1.myrichedit1.IncludeOLE:=true;
              Form1.myrichedit1.OutPutFormat := ofRTF;
           end
      else begin
              Form1.myrichedit1.IncludeOLE:=false;
              Form1.myrichedit1.OutPutFormat := ofRTFNoObjs;
           end;

 if editurldetect
      then Form1.myrichedit1.AutoURLDetect := adDefault
      else Form1.myrichedit1.AutoURLDetect := adNone;

 if editwordwrap
      then begin
              Form1.myrichedit1.WordWrap:=true;
              Form1.myrichedit1.ScrollBars := ssVertical;
           end
      else begin
              Form1.myrichedit1.WordWrap:=false;
              Form1.myrichedit1.ScrollBars := ssBoth;
           end;
end;



procedure TForm1.Setarigenerale1Click(Sender: TObject);
begin
 DoSettings;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 if TipDialogFirstRun then
   begin
     TipDialog.OnAtStart:=showstartuptips;
     TipDialog.Color:=RGB(243,251,215);
     TipDialog.Execute;
     TipDialogFirstRun:=false;
   end;
end;

procedure TForm1.TipDialogExecuted(Sender: TObject; StartNextTime: Boolean);
begin
 showstartuptips:=StartNextTime;
end;

procedure TForm1.ShowTipsClick(Sender: TObject);
begin
 TipDialog.OnAtStart:=True;
 TipDialog.Execute;
end;

procedure TForm1.Closetest1Click(Sender: TObject);
begin
 if testloaded and
    (not stoptestare) and
    (not confirm('Sunteti sigur(a) ca doriti terminarea testului inainte de expirarea timpului ?'))
   then exit;
 if testloaded then CloseTestImediat
               else Beep;
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  if fontloaded
   then LoadFont(extractfilepath(Application.ExeName)+'times.ttf',false);
end;

procedure TForm1.Contents1Click(Sender: TObject);
begin
 Application.HelpCommand(HELP_FINDER,0);
end;

procedure TForm1.Whatsthis2Click(Sender: TObject);
begin
 // What's this pe imagine
 Application.HelpCommand(HELP_CONTEXTPOPUP,1008);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
 // What's this pe zona cu raspunsuri utilizator
 Application.HelpCommand(HELP_CONTEXTPOPUP,1010);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
 // What's this pe enunt
 Application.HelpCommand(HELP_CONTEXTPOPUP,1009);
end;

procedure TForm1.Whatsthis1Click(Sender: TObject);
begin
 // What's this pe un raspuns
 Application.HelpCommand(HELP_CONTEXTPOPUP,Whatsthis1.HelpContext);
end;

procedure TForm1.RegistrationTimerTimer(Sender: TObject);
begin
 Dec(RegistrationCount);
 if RegistrationCount=0 then begin
                               timer1.Enabled:=false;
                               RegistrationTimer.Enabled:=false;
                               MessageDlg('Programul PowerTests pe care il detineti este o versiune demonstrativa.'#13#10+
                                          'Cu aceasta versiune demo se pot sustine teste de maxim 5 minute.'#13#10#13#10+
                                          'Apasati OK pentru terminarea testului',mtInformation,[mbOK],0);
                               OnTestStop;
                             end;
end;

end.


