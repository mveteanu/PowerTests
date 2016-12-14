unit pb_edit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, TB97, Menus, StdCtrls, FileCtrl, TB97Tlbr, TB97Ctls,
  ExtDlgs, RXCombos, Wordcap, Buttons, RichEdit2, DFSClrBn, RxCalc,
  AMTipDlg;


type TInterfaceLook = class(TObject)
                        public
                          ImgCompress      : Integer;
                          BrowserBackColor : TColor;
                          BrowserTextColor : TColor;
                          BrowserLastDir   : AnsiString;
                          BrowserFixDir    : AnsiString;
                          UseLastDir       : Boolean;
                          BrowserShow      : Boolean;
                          ImageStretch     : Boolean;
                          Sounds           : Boolean;
                          ShowTipOfDay     : Boolean;
                          CalcIntern       : Boolean;
                          ImageProgram     : AnsiString;
                          TextProgram      : AnsiString;
                          CharMapProgram   : AnsiString;
                          CalcProgram      : AnsiString;
                          editincludeole   : Boolean;
                          editurldetect    : Boolean;
                          editwordwrap     : Boolean;
                          userecyclebin    : Boolean;
                          Constructor Create;
                          Procedure   LoadFromRegistry;
                          Procedure   SaveToRegistry;
                          Procedure   ApplyColors;
                          Procedure   ApplyEditorSettings;
                      end;


type
  TForm1 = class(TForm)
    StatusBar: TStatusBar;
    Dock971: TDock97;
    Dock974: TDock97;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Splitter2: TSplitter;
    MainMenu1: TMainMenu;
    Fisiere1: TMenuItem;
    Iesire1: TMenuItem;
    View1: TMenuItem;
    Showproblembrowser1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Splitter4: TSplitter;
    FileListBox1: TFileListBox;
    FileToolBar: TToolbar97;
    NewPBBtn: TToolbarButton97;
    OpenPBBtn: TToolbarButton97;
    SavePBBtn: TToolbarButton97;
    Toolbars1: TMenuItem;
    Fileoperations1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    ScrollBox2: TScrollBox;
    Splitter5: TSplitter;
    Image1: TImage;
    EditToolbar: TToolbar97;
    AddPictureBtn: TToolbarButton97;
    NoPictureBtn: TToolbarButton97;
    OpenPictureDialog1: TOpenPictureDialog;
    EditorOperations1: TMenuItem;
    BoldBtn: TToolbarButton97;
    ItalicBtn: TToolbarButton97;
    UnderlineBtn: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    LeftAlign: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    RightAlign: TToolbarButton97;
    CenterAlign: TToolbarButton97;
    FontName: TFontComboBox;
    AnswersToolBar: TToolbar97;
    AddAnswerBtn: TToolbarButton97;
    RemoveAnswerBtn: TToolbarButton97;
    Answerstoolbar1: TMenuItem;
    Close1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveAs1: TMenuItem;
    FontSize: TComboBox;
    MSOfficeCaption1: TMSOfficeCaption;
    Problem1: TMenuItem;
    Loadtext1: TMenuItem;
    Savetext1: TMenuItem;
    Savepicture1: TMenuItem;
    LoadEditpicture1: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    UndoBtn: TToolbarButton97;
    CutBtn: TToolbarButton97;
    CopyBtn: TToolbarButton97;
    PasteBtn: TToolbarButton97;
    BulletsBtn: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    Editor: TRichEdit98;
    ColorBtn: TDFSColorButton;
    ToolbarSep974: TToolbarSep97;
    EditorPopUp: TPopupMenu;
    PopUpUndo: TMenuItem;
    PopUpCut: TMenuItem;
    PopUpCopy: TMenuItem;
    PopUpPaste: TMenuItem;
    N1: TMenuItem;
    PopUpFont: TMenuItem;
    FontDialog1: TFontDialog;
    PopUpAns: TPopupMenu;
    Addanswer1: TMenuItem;
    Removeanswer1: TMenuItem;
    Removeallanswers1: TMenuItem;
    PopupFiles: TPopupMenu;
    Newproblem1: TMenuItem;
    Deletefile1: TMenuItem;
    Renamefile1: TMenuItem;
    N2: TMenuItem;
    AddEditimage1: TMenuItem;
    Removeimage1: TMenuItem;
    PopupImg: TPopupMenu;
    Removepicture1: TMenuItem;
    Savepicture2: TMenuItem;
    N3: TMenuItem;
    AddEditimage2: TMenuItem;
    ImageStretch: TMenuItem;
    Fullscreen1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Showimageinfullscreen1: TMenuItem;
    N6: TMenuItem;
    Options1: TMenuItem;
    Tools1: TMenuItem;
    Imageeditor1: TMenuItem;
    Texteditor1: TMenuItem;
    Charactermap1: TMenuItem;
    Calculator1: TMenuItem;
    RxCalculator: TRxCalculator;
    FullAlign: TToolbarButton97;
    RedoBtn: TToolbarButton97;
    ToolbarSep975: TToolbarSep97;
    PopUpRedo: TMenuItem;
    N7: TMenuItem;
    PopupPasteSpecial: TMenuItem;
    Edit2: TMenuItem;
    EditMnuPasteSpecial: TMenuItem;
    EditMnuPaste: TMenuItem;
    EditMnuCopy: TMenuItem;
    EditMnuCut: TMenuItem;
    N10: TMenuItem;
    EditMnuUndo: TMenuItem;
    EditMnuRedo: TMenuItem;
    N8: TMenuItem;
    Loadfromfile1: TMenuItem;
    Savetofile1: TMenuItem;
    N9: TMenuItem;
    EditmnuInsertObject: TMenuItem;
    N11: TMenuItem;
    TipDialog: TAMTipDialog;
    N12: TMenuItem;
    ShowtipofDay1: TMenuItem;
    Contents1: TMenuItem;
    N13: TMenuItem;
    Clipboardview1: TMenuItem;
    PopupDir: TPopupMenu;
    Newfolder1: TMenuItem;
    Deletefolder1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    RegistrationTimer: TTimer;
    procedure Showproblembrowser1Click(Sender: TObject);
    procedure Fileoperations1Click(Sender: TObject);
    procedure FileToolBarVisibleChanged(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure AddPictureBtnClick(Sender: TObject);
    procedure NoPictureBtnClick(Sender: TObject);
    procedure EditorOperations1Click(Sender: TObject);
    procedure EditToolbarVisibleChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddAnswerBtnClick(Sender: TObject);
    procedure RemoveAnswerBtnClick(Sender: TObject);
    procedure Answerstoolbar1Click(Sender: TObject);
    procedure AnswersToolBarVisibleChanged(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure SavePBBtnClick(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure OpenPBBtnClick(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Savepicture1Click(Sender: TObject);
    procedure Loadtext1Click(Sender: TObject);
    procedure Savetext1Click(Sender: TObject);
    procedure UndoBtnClick(Sender: TObject);
    procedure CutBtnClick(Sender: TObject);
    procedure CopyBtnClick(Sender: TObject);
    procedure PasteBtnClick(Sender: TObject);
    procedure AlignBtnClick(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    procedure BoldBtnClick(Sender: TObject);
    procedure ItalicBtnClick(Sender: TObject);
    procedure UnderlineBtnClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure BulletsBtnClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure ColorBtnColorChange(Sender: TObject);
    procedure PopUpFontClick(Sender: TObject);
    procedure Removeallanswers1Click(Sender: TObject);
    procedure Deletefile1Click(Sender: TObject);
    procedure Renamefile1Click(Sender: TObject);
    procedure ImageStretchClick(Sender: TObject);
    procedure ScrollBox2Resize(Sender: TObject);
    procedure Fullscreen1Click(Sender: TObject);
    procedure EnableEditControls(val:boolean);
    procedure Options1Click(Sender: TObject);
    procedure Imageeditor1Click(Sender: TObject);
    procedure Texteditor1Click(Sender: TObject);
    procedure Charactermap1Click(Sender: TObject);
    procedure Calculator1Click(Sender: TObject);
    procedure RedoBtnClick(Sender: TObject);
    procedure PopupPasteSpecialClick(Sender: TObject);
    procedure EditmnuInsertObjectClick(Sender: TObject);
    procedure TipDialogExecuted(Sender: TObject;
      StartNextTime: Boolean);
    procedure ShowtipofDay1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Clipboardview1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Newfolder1Click(Sender: TObject);
    procedure Deletefolder1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure RegistrationTimerTimer(Sender: TObject);
  private
    { Private declarations }
    NrAnswers : integer;
    AnswerType   : integer;
    labels:array [1..20] of TLabel;
    butonase:array [1..20] of TWinControl;
    editCategory,editAuthor,editDificulty,editPuncte: TEdit; editPartialAnswer : TCheckBox;
    labelCategory,labelAuthor,labelDificulty, labelPuncte, labelPartialAnswer: TLabel;
    pbAuthor: AnsiString;
    pbDificulty: Integer;
    pbPuncte: Integer;
    pbCategory: AnsiString;
    PbPartialAnswer : Boolean;
    pbfilename: AnsiString;
    pbchanged: boolean;
    FUpdating: Boolean;
    TipsFirstRun: Boolean;
    fontloaded: Boolean;
    procedure MyImageResize;
    procedure UpdateCursorPos;
    function  CurrText: TTextAttributes98;
    procedure AnswersChanged(Sender: TObject);
    procedure AcceptaFaraSpace(Sender:TObject;var key:Char);
    procedure AcceptaDoarNumere(Sender:TObject;var key:Char);
    procedure AcceptaDoarNumere2(Sender:TObject;var key:Char);
    procedure CreateProblemCaracteristics;
    Function  SaveImage(img:TImage;str:TStream;tip:integer):integer;
    Procedure SavePbToFile(fis:AnsiString;edit:TRichEdit98;Image1:TImage;sl:TStringList;tipimg:Byte);
    Function  AskForSaveName:AnsiString;
    Function  SaveProblem:boolean;
    Function  SaveProblemAs:boolean;
    Function  OpenProblem(filename:AnsiString):boolean;

    procedure winmsg(var msg:tmsg;var handled:boolean);
  public
    { Public declarations }
    procedure AddAnswer(tip:integer);
    procedure RemoveLastAnswer;
    procedure RemoveAllAnswers;
  end;

var
  Form1: TForm1;
  InterfaceLook: TInterfaceLook;
  ProgramInregistrat:boolean;
  RegistrationCount:Integer;

implementation

uses Registry, rxgif, jpeg, ShellApi, RichEdit, ClipBrd, MMSystem,
     MyCombo, AnsType, About, Problems, Settings, ClpdView, Win95,
     ViewFull,
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


type pbfilestruct=record
                    signature : array[1..3] of Byte;  // 3 octeti
                    pbversion : Byte;     // 8 biti fara semn
                    imgtype   : Byte;     // 8 biti fara semn  {$FF=faraimg; 0=bmp; 1=gif; 2=jpeg}
                    rtfpos    : LongInt;  // 32 biti cu semn
                    imgpos    : LongInt;  // 32 biti cu semn
                  end;

                  

function TForm1.SaveImage(img:TImage;str:TStream;tip:integer):integer;
var myimage:TGraphic;
begin
 result:=1;

 case tip of
  0:  myimage := TBitmap.Create;
  1:  myimage := TGIFImage.Create;
  2:  myimage := TJPEGImage.Create;
 else
  myimage := TBitmap.Create;
 end;

try
 if (myimage is TGIFImage)
    then (myimage as TGIFImage).AddFrame(Img.Picture.Graphic)
    else myimage.Assign(Img.Picture.Graphic);
 myimage.SaveToStream(str);
finally
 myimage.Free;
end;

end;


Procedure TForm1.SavePbToFile(fis:AnsiString;edit:TRichEdit98;Image1:TImage;sl:TStringList;tipimg:Byte);
var fstream:TFileStream;
    rtfstream:TMemoryStream;
    head:pbfilestruct;
begin
 fstream:=TFileStream.Create(fis,fmCreate);

 head.signature[1]:=80; // P
 head.signature[2]:=66; // B
 head.signature[3]:=33; // !
 fstream.Write(head.signature,SizeOf(head.signature));

 head.pbversion:=1;
 fstream.Write(head.pbversion,SizeOf(head.pbversion));


 if Image1.Picture.Graphic=nil then tipimg:=$FF;

 head.imgtype:=tipimg;
 fstream.Write(head.imgtype,SizeOf(head.imgtype));

 rtfstream:=TMemoryStream.Create;
 Editor.Lines.SaveToStream(rtfstream);


 head.rtfpos:=SizeOf(head.signature)+
              SizeOf(head.pbversion)+
              SizeOf(head.imgtype)+
              SizeOf(head.rtfpos)+
              SizeOf(head.imgpos)+
              Length(sl.Text);
 fstream.Write(head.rtfpos,SizeOf(head.rtfpos));

 head.imgpos:=head.rtfpos+rtfstream.Size;
 fstream.Write(head.imgpos,SizeOf(head.imgpos));

 fstream.Write(pointer(sl.Text)^,Length(sl.text));

 fstream.CopyFrom(rtfstream,0);
 rtfstream.Free;

 if tipimg<>$FF then SaveImage(Image1,fstream,tipimg);

 fstream.Free;
end;


procedure TForm1.MyImageResize;
begin
     if ((Image1.Picture.Width>ScrollBox2.Width) or
          (Image1.Picture.Height>ScrollBox2.Height)) then
     begin
      Image1.Align:=alNone;
      Image1.Stretch:=true;
      Image1.autosize:=false;
      if Image1.Picture.Width>=Image1.Picture.Height
         then begin
           Image1.Width:=ScrollBox2.Width-6;
           Image1.Height:=trunc(Image1.Width*(Image1.Picture.Height/Image1.Picture.Width));
         end
         else begin
           Image1.Height:=ScrollBox2.Height-6;
           Image1.Width:=trunc(Image1.Height*(Image1.Picture.Width/Image1.Picture.Height));
         end;
     end
     else begin
       Image1.Align:=alNone;
       Image1.Stretch:=false;
       Image1.autosize:=true;
     end;
end;


procedure TForm1.AcceptaFaraSpace(Sender:TObject;var key:Char);
begin
 if key=' ' then begin beep;key:=#0;end;
end;


procedure TForm1.AcceptaDoarNumere(Sender:TObject;var key:Char);
begin
 if ((key<'0') or (key>'9')) and (key<>#8) then
   begin beep;key:=#0;end;
end;


procedure TForm1.AcceptaDoarNumere2(Sender:TObject;var key:Char);
var s:string;
begin
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
    (key<>#8) then
        begin
          beep;
          key:=#0;
        end;

end;



procedure TForm1.CreateProblemCaracteristics;
begin
 scrollbox1.vertscrollbar.position:=0;
 if editCategory=nil then
   begin
     labelCategory:=TLabel.Create(Self);
     labelCategory.Parent:=ScrollBox1;
     labelCategory.Left:=ScrollBox1.Width-215;
     labelCategory.Top:=20;
     labelCategory.Caption:='Categoria:';
     labelCategory.Visible:=True;

     editCategory:=TEdit.Create(Self);
     editCategory.Parent:=ScrollBox1;
     editCategory.Left:=labelCategory.Left+70;
     editCategory.Top:=labelCategory.Top;
     editCategory.ShowHint:=True;
     editCategory.Hint:='Categoria problemei';
     editCategory.HelpContext:=207;
     editCategory.OnKeyPress:=AcceptaFaraSpace;
     editCategory.Visible:=True;
     editCategory.OnChange:=answerschanged;
   end;

 if editAuthor=nil then
   begin
     labelAuthor:=TLabel.Create(Self);
     labelAuthor.Parent:=ScrollBox1;
     labelAuthor.Left:=labelCategory.Left;
     labelAuthor.Top:=2*(editCategory.height+4)-editCategory.height+16;
     labelAuthor.Caption:='Autor:';
     labelAuthor.Visible:=True;

     editAuthor:=TEdit.Create(Self);
     editAuthor.Parent:=ScrollBox1;
     editAuthor.Left:=editCategory.Left;
     editAuthor.Top:=labelAuthor.Top;
     editAuthor.ShowHint:=True;
     editAuthor.Hint:='Autorul problemei';
     editAuthor.HelpContext:=207;
     editAuthor.Visible:=True;
     editAuthor.OnChange:=answerschanged;
   end;

 if editDificulty=nil then
   begin
     labelDificulty:=TLabel.Create(Self);
     labelDificulty.Parent:=ScrollBox1;
     labelDificulty.Left:=labelCategory.Left;
     labelDificulty.Top:=3*(editCategory.height+4)-editCategory.height+16;
     labelDificulty.Caption:='Dificultate:';
     labelDificulty.Visible:=True;

     editDificulty:=TEdit.Create(Self);
     editDificulty.Parent:=ScrollBox1;
     editDificulty.Left:=editCategory.Left;
     editDificulty.Top:=labelDificulty.Top;
     editDificulty.ShowHint:=True;
     editDificulty.Hint:='Gradul de dificultate';
     editDificulty.HelpContext:=207;
     editDificulty.OnKeyPress:=AcceptaDoarNumere;
     editDificulty.Visible:=True;
     editDificulty.OnChange:=answerschanged;
   end;

 if editPuncte=nil then
   begin
     labelPuncte:=TLabel.Create(Self);
     labelPuncte.Parent:=ScrollBox1;
     labelPuncte.Left:=labelCategory.Left;
     labelPuncte.Top:=4*(editCategory.height+4)-editCategory.height+16;
     labelPuncte.Caption:='Puncte:';
     labelPuncte.Visible:=True;

     editPuncte:=TEdit.Create(Self);
     editPuncte.Parent:=ScrollBox1;
     editPuncte.Left:=editCategory.Left;
     editPuncte.Top:=labelPuncte.Top;
     editPuncte.ShowHint:=True;
     editPuncte.Hint:='Puncte obtinute daca se rezolva corect';
     editPuncte.HelpContext:=207;
     editPuncte.OnKeyPress:=AcceptaDoarNumere;
     editPuncte.Visible:=True;
     editPuncte.OnChange:=answerschanged;
   end;

 if editPartialAnswer=nil then
   begin
     labelPartialAnswer:=TLabel.Create(Self);
     labelPartialAnswer.Parent:=ScrollBox1;
     labelPartialAnswer.Left:=labelCategory.Left;
     labelPartialAnswer.Top:=5*(editCategory.height+4)-editCategory.height+16;
     labelPartialAnswer.Caption:='Rasp. partial:';
     labelPartialAnswer.Visible:=True;

     editPartialAnswer:=TCheckBox.Create(Self);
     editPartialAnswer.Parent:=ScrollBox1;
     editPartialAnswer.Left:=editCategory.Left;
     editPartialAnswer.Top:=labelPartialAnswer.Top;
     editPartialAnswer.ShowHint:=True;
     editPartialAnswer.Hint:='Permite raspuns partial';
     editPartialAnswer.HelpContext:=207;
     editPartialAnswer.Caption:='';
     editPartialAnswer.Visible:=True;
     editPartialAnswer.OnClick:=answerschanged;
   end;


   editCategory.Text:=pbCategory;
   editAuthor.Text:=pbAuthor;
   editDificulty.Text:=InttoStr(pbDificulty);
   editPuncte.Text:=InttoStr(pbPuncte);
   editPartialAnswer.Checked:=PbPartialAnswer;

   if AnswerType=0 then editPartialAnswer.Enabled:=false
                   else editPartialAnswer.Enabled:=true;
end;


procedure TForm1.RemoveAllAnswers;
var i:integer;
begin
 if NrAnswers=0 then exit;
 for i:=1 to NrAnswers do
   begin
    labels[i].free;   labels[i]:=nil;
    butonase[i].free; butonase[i]:=nil;
   end;
 NrAnswers:=0;
end;


procedure TForm1.RemoveLastAnswer;
begin
 if NrAnswers=0 then
   begin
     beep;
     exit;
   end;
 labels[NrAnswers].free;      labels[NrAnswers]:=nil;
 butonase[NrAnswers].free;    butonase[NrAnswers]:=nil;
 dec(NrAnswers);
end;


procedure TForm1.AddAnswer(tip:integer);
begin
 if NrAnswers=20 then
   begin
     beep;
     exit;
   end;
 inc(NrAnswers);
 labels[NrAnswers]:=TLabel.Create(Self);
 labels[NrAnswers].Parent:=ScrollBox1;
 labels[NrAnswers].Font.Color:=clBlue;
 labels[NrAnswers].Font.Size:=12;
 labels[NrAnswers].Font.Style := [fsItalic];
 labels[NrAnswers].caption:=char(64+NrAnswers)+'.';
 labels[NrAnswers].left:=10;
 labels[NrAnswers].top:=
    NrAnswers*(labels[NrAnswers].height+4)-
    labels[NrAnswers].height+16;
 labels[NrAnswers].visible:=true;

 case tip of
  0: begin  // TCheckBox
       butonase[NrAnswers]:=TCheckBox.Create(Self);
       butonase[NrAnswers].Parent:=ScrollBox1;
       TCheckBox(butonase[NrAnswers]).Caption:='';
       butonase[NrAnswers].Hint:='Bifati raspunsul corect';
       butonase[NrAnswers].HelpContext:=1002;
       TCheckBox(butonase[NrAnswers]).OnClick:=AnswersChanged;
     end;
  1: begin  // TComboBox
       butonase[NrAnswers]:=TComboBoxWithEdit.Create(Self);
       butonase[NrAnswers].Parent:=ScrollBox1;
       butonase[NrAnswers].Hint:='Selectati raspunsul corect';
       butonase[NrAnswers].HelpContext:=1006;
       TComboBoxWithEdit(butonase[NrAnswers]).OnClick:=AnswersChanged;
     end;
  2: begin  // TEdit
       butonase[NrAnswers]:=TEdit.Create(Self);
       butonase[NrAnswers].Parent:=ScrollBox1;
       butonase[NrAnswers].Hint:='Introduceti raspunsul corect';
       butonase[NrAnswers].HelpContext:=1004;
       TEdit(butonase[NrAnswers]).OnKeyPress:=AcceptaDoarNumere2;
       TEdit(butonase[NrAnswers]).OnChange:=AnswersChanged;
     end;
 end;
 butonase[NrAnswers].ShowHint:=True;
 butonase[NrAnswers].left:=labels[NrAnswers].left+24;
 butonase[NrAnswers].top:=labels[NrAnswers].top;
 butonase[NrAnswers].visible:=true;
end;


procedure TForm1.Showproblembrowser1Click(Sender: TObject);
begin
 if InterfaceLook.Sounds then
   if not Showproblembrowser1.Checked
      then PlaySound('ZOOMIN', hInstance, snd_ASync or snd_Resource)
      else PlaySound('ZOOMOUT', hInstance, snd_ASync or snd_Resource);

 Showproblembrowser1.Checked:=not Showproblembrowser1.Checked;
 Panel1.Visible:=Showproblembrowser1.Checked;
end;

procedure TForm1.Fileoperations1Click(Sender: TObject);
begin
 FileToolBar.Visible:=not FileToolBar.Visible;
end;

procedure TForm1.FileToolBarVisibleChanged(Sender: TObject);
begin
 FileOperations1.Checked:=not FileOperations1.Checked;
end;

procedure TForm1.Iesire1Click(Sender: TObject);
begin
 Close;
end;


procedure TForm1.New1Click(Sender: TObject);
begin
 if pbChanged then
 begin
   if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Problema a fost modificata. Doriti sa o salvati ?',
                    mtConfirmation,mbYesNoCancel,0) of
     mrYes    : if not SaveProblem then exit;
     mrCancel : exit;
   end;
 end;

 if InterfaceLook.Sounds then PlaySound('NEW', hInstance, snd_ASync or snd_Resource);

 RemoveAllAnswers;
 Editor.Clear;
 Image1.Picture.Graphic:=nil;
 ScrollBox2.Visible:=false;
 Panel2.Visible:=true;
 EditmnuInsertObject.Enabled:=true;
 AddPictureBtn.Enabled:=true;
 noPictureBtn.Enabled:=false;RemoveImage1.Enabled:=false;
 EnableEditControls(true);
 AddAnswerBtn.Enabled:=true;
 RemoveAnswerBtn.Enabled:=true;
 SavePBBtn.Enabled:=true;Save1.Enabled:=true;SaveAs1.Enabled:=true;
 LoadText1.Enabled:=true;SaveText1.Enabled:=true;LoadEditPicture1.Enabled:=true;SavePicture1.Enabled:=false;
 AddEditImage1.Enabled:=true;
 Close1.Enabled:=true;
 CutBtn.Enabled:=true;CopyBtn.Enabled:=true;PasteBtn.Enabled:=true;
 PopUpCut.Enabled:=CutBtn.Enabled;PopUpCopy.Enabled:=CopyBtn.Enabled;
 EditMnuCut.Enabled:=CutBtn.Enabled;EditMnuCopy.Enabled:=CopyBtn.Enabled;
 PopUpPaste.Enabled:=PasteBtn.Enabled;PopupPasteSpecial.Enabled:=PasteBtn.Enabled;
 EditmnuPaste.Enabled:=PasteBtn.Enabled;EditmnuPasteSpecial.Enabled:=PasteBtn.Enabled;
 EditorSelectionChange(Self);
 PBFileName:='';
 MSOfficeCaption1.CaptionText.Caption:='Problem editor';

 pbCategory:='';
 pbAuthor:='';
 pbDificulty:=0;
 pbPuncte:=1;
 PbPartialAnswer:=false;
 CreateProblemCaracteristics;

 pbchanged:=false;
end;

procedure TForm1.AddPictureBtnClick(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
   begin
     Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

     if ImageStretch.Checked then
          MyImageResize
     else
       begin
          Image1.align:=AlNone;
          Image1.stretch:=false;
          Image1.autosize:=true;
       end;

     noPictureBtn.Enabled:=true;RemoveImage1.Enabled:=true;
     SavePicture1.Enabled:=true;
     if Image1.Width<ScrollBox1.Width div 2
         then ScrollBox2.Width:=Image1.Width+10
         else ScrollBox2.Width:=ScrollBox1.Width div 2;
     ScrollBox2.Visible:=true;
     Splitter5.Left:=ScrollBox2.Left;
     pbchanged:=true;
   end;
end;

procedure TForm1.NoPictureBtnClick(Sender: TObject);
begin
 noPictureBtn.Enabled:=false;RemoveImage1.Enabled:=false;
 SavePicture1.Enabled:=false;
 Image1.Picture.Graphic:=nil;
 ScrollBox2.Visible:=false;
 pbchanged:=true;
end;

procedure TForm1.EditorOperations1Click(Sender: TObject);
begin
 EditToolBar.Visible:=not EditToolBar.Visible;
end;

procedure TForm1.EditToolbarVisibleChanged(Sender: TObject);
begin
 EditorOperations1.Checked:=not EditorOperations1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not SmallFonts then
   MessageDlg('This program was designed to work properly only if SmallFonts are used'#13#10+
              'However, the program works with LargeFonts too,but windows and texts will look ugly.',
              mtWarning,[mbOK],0);

 fontloaded:=false;
 if not LoadFont(extractfilepath(Application.ExeName)+'times.ttf',true)
   then MessageDlg('Can not load Times New Roman font.'#13#10+
              'The program will work, but some text may be not proportional.',
              mtWarning,[mbOK],0)
   else fontloaded:=true;

 Form1.SetBounds(0,0,Screen.Width,Screen.Height);
 Application.HelpFile:=ExtractFilePath(paramstr(0))+'powtests.hlp';

 NrAnswers:=0;
 PbFileName:='';
 FontSize.OnKeyPress:=AcceptaDoarNumere;
 pbChanged:=false;

 Application.onmessage:=winmsg;
 AppendMenu(GetSystemMenu(form1.handle,false),mf_separator,0,'');
 AppendMenu(GetSystemMenu(form1.handle,false),mf_byposition,AboutID,'About...');

 InterfaceLook:=TInterfaceLook.Create;
 InterfaceLook.LoadFromRegistry;
 InterfaceLook.ApplyColors;

 try
   if InterfaceLook.UseLastDir
        then DirectoryListBox1.Directory:=InterfaceLook.BrowserLastDir
        else DirectoryListBox1.Directory:=InterfaceLook.BrowserFixDir;
 except
   DirectoryListBox1.Directory:=ExtractFilePath(ParamStr(0));
 end;

 Showproblembrowser1.Checked:=InterfaceLook.BrowserShow;
 Panel1.Visible:=Showproblembrowser1.Checked;

 InterfaceLook.ApplyEditorSettings;
 TipsFirstRun:=true;

 // Aici verific daca este versiunea inregistrata
 ProgramInregistrat:=IsRegistred;
 if not ProgramInregistrat then begin
                                  ShowNagScreen;
                                  RegistrationTimer.Enabled:=true;
                                  RegistrationCount:=10;
                                end;

end;

procedure TForm1.AddAnswerBtnClick(Sender: TObject);
var at:integer;
begin
 if NrAnswers=0 then
   begin
    at:=AskForAnswerType;
    if at=-1 then exit;
    AnswerType:=at;
    if AnswerType=0 then begin pbPartialAnswer:=false;EditPartialAnswer.Checked:=pbPartialAnswer;EditPartialAnswer.Enabled:=false;end
                    else EditPartialAnswer.Enabled:=true;
   end;
 scrollbox1.vertscrollbar.position:=0;
 AddAnswer(AnswerType);

 pbchanged:=true;
end;

procedure TForm1.RemoveAnswerBtnClick(Sender: TObject);
begin
 RemoveLastAnswer;
 pbchanged:=true;
end;

procedure TForm1.Answerstoolbar1Click(Sender: TObject);
begin
 AnswersToolBar.Visible:=not AnswersToolBar.Visible;
end;

procedure TForm1.AnswersToolBarVisibleChanged(Sender: TObject);
begin
 AnswersToolBar1.Checked:=not AnswersToolBar1.Checked;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if Width<605 then begin Width:=605;beep;end;
  if Height<400 then begin Height:=400;beep;end;
end;

procedure TForm1.ScrollBox1Resize(Sender: TObject);
begin
  if editCategory<>nil then  // Este suficient testarea lui EditCateggory deoarece
                             // editCategory, editAuthor si editDificulty sunt create si distruse impreuna
   begin
    labelCategory.Left:=ScrollBox1.Width-215;
    labelAuthor.Left:=labelCategory.Left;
    labelDificulty.Left:=labelCategory.Left;
    labelPuncte.Left:=labelCategory.Left;
    labelPartialAnswer.Left:=labelCategory.Left;
    editCategory.Left:=labelCategory.Left+70;
    editAuthor.Left:=labelCategory.Left+70;
    editDificulty.Left:=labelCategory.Left+70;
    editPuncte.Left:=labelCategory.Left+70;
    EditPartialAnswer.Left:=labelCategory.Left+70;
   end;

  if ScrollBox2.Width>ScrollBox1.Width div 2
    then ScrollBox2.Width:=ScrollBox1.Width div 2;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
 ShowAboutBox;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
 if pbChanged then
 begin
   if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Problema a fost modificata. Doriti sa o salvati ?',
                    mtConfirmation,mbYesNoCancel,0) of
     mrYes    : if not SaveProblem then exit;
     mrCancel : exit;
   end;
 end;

 RemoveAllAnswers;
 Editor.Clear;
 Image1.Picture.Graphic:=nil;
 ScrollBox2.Visible:=false;
 Panel2.Visible:=false;
 AddPictureBtn.Enabled:=false;
 EditmnuInsertObject.Enabled:=false;
 noPictureBtn.Enabled:=false;RemoveImage1.Enabled:=false;
 LoadText1.Enabled:=false;SaveText1.Enabled:=false;LoadEditPicture1.Enabled:=false;SavePicture1.Enabled:=false;
 AddEditImage1.Enabled:=false;
 AddAnswerBtn.Enabled:=false;
 RemoveAnswerBtn.Enabled:=false;
 SavePBBtn.Enabled:=false;Save1.Enabled:=false;SaveAs1.Enabled:=false;
 Close1.Enabled:=false;
 CutBtn.Enabled:=false;CopyBtn.Enabled:=false;PasteBtn.Enabled:=false;
 PopUpCut.Enabled:=CutBtn.Enabled;PopUpCopy.Enabled:=CopyBtn.Enabled;
 EditMnuCut.Enabled:=CutBtn.Enabled;EditMnuCopy.Enabled:=CopyBtn.Enabled;
 PopUpPaste.Enabled:=PasteBtn.Enabled;PopupPasteSpecial.Enabled:=PasteBtn.Enabled;
 EditmnuPaste.Enabled:=PasteBtn.Enabled;EditmnuPasteSpecial.Enabled:=PasteBtn.Enabled;
 PBFileName:='';
 //Form1.Caption:='Problem editor';
 MSOfficeCaption1.CaptionText.Caption:='Problem editor';

 if editCategory<>nil then editCategory.free;editCategory:=nil;
 if editAuthor<>nil then editAuthor.free;editAuthor:=nil;
 if editDificulty<>nil then editDificulty.free;editDificulty:=nil;
 if editPuncte<>nil then editPuncte.free;editPuncte:=nil;
 if EditPartialAnswer<>nil then EditPartialAnswer.free;EditPartialAnswer:=nil;
 if labelCategory<>nil then labelCategory.free;labelCategory:=nil;
 if labelAuthor<>nil then labelAuthor.free;labelAuthor:=nil;
 if labelDificulty<>nil then labelDificulty.free;labelDificulty:=nil;
 if labelPuncte<>nil then labelPuncte.free;labelPuncte:=nil;
 if labelPartialAnswer<>nil then labelPartialAnswer.free;labelPartialAnswer:=nil;

 EnableEditControls(false);
 PBChanged:=false;
end;


Function TForm1.AskForSaveName:AnsiString;
begin
 result:='';
 SaveDialog1.DefaultExt:='*.pb';
 SaveDialog1.InitialDir:=FileListBox1.Directory;
 SaveDialog1.Filter:='PowerTests problem file|*.pb';
 SaveDialog1.FilterIndex:=1;
 SaveDialog1.FileName:='';
 SaveDialog1.Title:='Save problem as...';
 if SaveDialog1.Execute then result:=SaveDialog1.FileName;
end;


Function TForm1.SaveProblemAs:boolean;
var t:AnsiString;
begin
 result:=false;
 if NrAnswers=0 then
     begin
       beep;
       ShowMessage('You must add an answer to this problem !');
       exit;
     end;

 t:=AskForSaveName;
 if t<>'' then
     begin
       PBFileName:=t;
       SaveProblem;
       MSOfficeCaption1.CaptionText.Caption:='Problem editor ('+PBFileName+')';
       if ExtractFilePath(PBFileName)=FileListBox1.Directory+'\' then FileListBox1.Update;
       result:=true;
     end;

end;


Function TForm1.SaveProblem:boolean;
var ts:TStringList;
    i,j:integer;
    s:AnsiString;
begin
 result:=false;
 if NrAnswers=0 then
     begin
       beep;
       ShowMessage('You must add an answer to this problem !');
       exit;
     end;

 if PBFileName='' then PBFileName:=AskForSaveName;
 if PBFileName='' then Exit;

 ts:=TStringList.Create;
 ts.add('# Begin problem definition');
 if editCategory.Text<>'' then ts.add('.category '+editCategory.Text);
 if editAuthor.Text<>'' then ts.add('.author '+editAuthor.Text);

 try
  j:=strtoint(editDificulty.Text);
 except
  j:=0;
 end;
 if j<>0 then ts.add('.dificulty '+editDificulty.Text);

 try
  j:=strtoint(editPuncte.Text);
 except
  j:=1;
 end;
 if j<>1 then ts.add('.puncte '+editPuncte.Text);

 if (EditPartialAnswer.Enabled) and (EditPartialAnswer.Checked) then ts.add('.partialanswer');

 ts.add('.answertype '+inttostr(answertype));
 case answertype of
   0 : for i:=1 to NrAnswers do
          if (butonase[i] as TCheckBox).Checked
              then ts.add('.answer 1')
              else ts.add('.answer 0');
   1 : for i:=1 to NrAnswers do
              begin
                (butonase[i] as TComboBoxWithEdit).GetComboData(j,s);
                ts.add('.answer '+inttostr(j)+' '+s);
              end;
   2 : for i:=1 to NrAnswers do
              ts.add('.answer '+(butonase[i] as TEdit).Text);
 end;
 ts.add('# End problem definition');

 try
   SavePbToFile(PBFileName,Editor,Image1,ts,InterfaceLook.ImgCompress);

   ts.Free;

   if ExtractFilePath(PBFileName)=FileListBox1.Directory+'\' then FileListBox1.Update;
   MSOfficeCaption1.CaptionText.Caption:='Problem editor ('+PBFileName+')';

   pbchanged:=false;
   result:=true;
 except
   ts.Free;
   if InterfaceLook.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
   MessageDlg('Nu se poate salva problema. Poate ca este deschisa de un alt program !'#13#10+
              'Daca este si TestSystem deschis, inchideti-l, apoi reincercati salvarea problemei'#13#10+
              'Puteti incerca deasemenea sa o salvati sub un alt nume.',
   mtError,[mbOk],0);
 end;
end;


procedure TForm1.SavePBBtnClick(Sender: TObject);
begin
 SaveProblem;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
begin
 SaveProblemAs;
end;

procedure TForm1.EditorChange(Sender: TObject);
begin
 pbchanged:=true;
 UndoBtn.Enabled := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;
 PopUpUndo.Enabled:=UndoBtn.Enabled;
 EditMnuUndo.Enabled:=UndoBtn.Enabled;

 RedoBtn.Enabled := Editor.CanRedo;
 PopupRedo.Enabled:=RedoBtn.Enabled;
 EditMnuRedo.Enabled:=RedoBtn.Enabled;
end;

procedure TForm1.AnswersChanged(Sender: TObject);
begin
 pbchanged:=true;
end;


Function TForm1.OpenProblem(filename:AnsiString):boolean;
var pb:TProblem;
    i,j:integer;
begin
 pb:=TProblem.Create(filename);
 if not pb.IsValid then
      begin
        if InterfaceLook.Sounds
           then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource)
           else beep;
        MessageDlg(filename+' nu este un fisier cu probleme valid',mtError,[mbOK],0);
        pb.Free;
        result:=false;
        exit;
      end;

 if pb.PBVersion>1 then
      begin
        if InterfaceLook.Sounds
            then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource)
            else beep;
        MessageDlg('Problema '+filename+' are o versiune nesuportata. Va rugam inoiti PowerTests.',mtError,[mbOK],0);
        pb.Free;
        result:=false;
        exit;
      end;

 PBFilename:=filename;
 pb.LoadDescriptions;

 RemoveAllAnswers;
 Editor.Clear;
 pb.LoadRTF(Editor.Lines);

 Panel2.Visible:=true;

 if pb.ImgType=$FF
 then
   begin
     Image1.Picture.Graphic:=nil;
     ScrollBox2.Visible:=false;
   end
 else
   begin
     pb.LoadImg(Image1.Picture);
     ScrollBox2.Visible:=true;
     Splitter5.Left:=ScrollBox2.Left;
     if ImageStretch.checked then MyImageResize;
   end;

 AddPictureBtn.Enabled:=true;
 EditmnuInsertObject.Enabled:=true;
 EnableEditControls(true);
 LoadText1.Enabled:=true;SaveText1.Enabled:=true;LoadEditPicture1.Enabled:=true;
 AddEditImage1.Enabled:=true;
 if pb.ImgType=$FF then begin noPictureBtn.Enabled:=false;RemoveImage1.Enabled:=false;SavePicture1.Enabled:=false;end
                   else begin noPictureBtn.Enabled:=true;RemoveImage1.Enabled:=true; SavePicture1.Enabled:=true;end;
 AddAnswerBtn.Enabled:=true;
 RemoveAnswerBtn.Enabled:=true;
 SavePBBtn.Enabled:=true;Save1.Enabled:=true;SaveAs1.Enabled:=true;
 Close1.Enabled:=true;
 CutBtn.Enabled:=true;CopyBtn.Enabled:=true;PasteBtn.Enabled:=true;
 PopUpCut.Enabled:=CutBtn.Enabled;PopUpCopy.Enabled:=CopyBtn.Enabled;
 EditMnuCut.Enabled:=CutBtn.Enabled;EditMnuCopy.Enabled:=CopyBtn.Enabled;
 PopUpPaste.Enabled:=PasteBtn.Enabled;PopupPasteSpecial.Enabled:=PasteBtn.Enabled;
 EditmnuPaste.Enabled:=PasteBtn.Enabled;EditmnuPasteSpecial.Enabled:=PasteBtn.Enabled;
 EditorSelectionChange(Self);
 PBFileName:=pb.PBFilename;
 MSOfficeCaption1.CaptionText.Caption:='Problem editor ('+PBFileName+')';

 pbCategory:=pb.Category;
 pbAuthor:=pb.Author;
 pbDificulty:=pb.Dificulty;
 pbPuncte:=pb.Puncte;
 AnswerType:=pb.AnswerType;
 pbPartialAnswer:=pb.PartialAnsw;
 CreateProblemCaracteristics;

 NrAnswers:=pb.NrAnswers;

 if NrAnswers>20 then begin NrAnswers:=20;beep;end;

 for i:=1 to NrAnswers do
  begin
   labels[i]:=TLabel.Create(Self);
   labels[i].Parent:=ScrollBox1;
   labels[i].Font.Color:=clBlue;
   labels[i].Font.Size:=12;
   labels[i].Font.Style := [fsItalic];
   labels[i].caption:=char(64+i)+'.';
   labels[i].left:=10;
   labels[i].top:=i*(labels[i].height+4)-labels[i].height+16;
   labels[i].visible:=true;

   case AnswerType of
    0: begin  // TCheckBox
         butonase[i]:=TCheckBox.Create(Self);
         butonase[i].visible:=false;
         butonase[i].Parent:=ScrollBox1;
         TCheckBox(butonase[i]).Caption:='';
         butonase[i].Hint:='Bifati raspunsul corect';
         TCheckBox(butonase[i]).OnClick:=AnswersChanged;
         if pb.Answers[i].value='1'
            then TCheckBox(butonase[i]).Checked:=true
            else TCheckBox(butonase[i]).Checked:=false;
       end;
    1: begin  // TComboBox
         butonase[i]:=TComboBoxWithEdit.Create(Self);
         butonase[i].visible:=false;
         butonase[i].Parent:=ScrollBox1;
         butonase[i].Hint:='Selectati raspunsul corect';
         TComboBoxWithEdit(butonase[i]).OnClick:=AnswersChanged;
         try
           j:=strtoint(pb.Answers[i].value);
         except
           j:=-1;
         end;
         TComboBoxWithEdit(butonase[i]).SetComboData(j,pb.Answers[i].extraparams);
       end;
    2: begin  // TEdit
         butonase[i]:=TEdit.Create(Self);
         butonase[i].visible:=false;
         butonase[i].Parent:=ScrollBox1;
         butonase[i].Hint:='Introduceti raspunsul corect';
         TEdit(butonase[i]).OnKeyPress:=AcceptaDoarNumere2;
         TEdit(butonase[i]).OnChange:=AnswersChanged;
         TEdit(butonase[i]).Text:=pb.Answers[i].value;
       end;
   end;
   butonase[i].ShowHint:=True;
   butonase[i].left:=labels[i].left+24;
   butonase[i].top:=labels[i].top;
  end;
 for i:=1 to NrAnswers do butonase[i].visible:=true;

 pb.Free;
 pbchanged:=false;
 result:=true;
end;



procedure TForm1.OpenPBBtnClick(Sender: TObject);
begin
 if pbChanged then
 begin
   if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Problema a fost modificata. Doriti sa o salvati ?',
                    mtConfirmation,mbYesNoCancel,0) of
     mrYes    : if not SaveProblem then exit;
     mrCancel : exit;
   end;
 end;

 OpenDialog1.DefaultExt:='*.pb';
 OpenDialog1.Filter:='PowerTests problem file|*.pb';
 OpenDialog1.FilterIndex:=1;
 OpenDialog1.Title:='Open problem';
 OpenDialog1.FileName:='';
 if OpenDialog1.Execute then
     OpenProblem(OpenDialog1.FileName);
end;

procedure TForm1.FileListBox1Click(Sender: TObject);
var fname:AnsiString;
begin
 if InterfaceLook.Sounds then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);

 fname:=FileListBox1.Directory+'\'+FileListBox1.Items[FileListBox1.ItemIndex];
 if pbChanged then
 begin
   if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Problema a fost modificata. Doriti sa o salvati ?',
                    mtConfirmation,mbYesNoCancel,0) of
     mrYes    : if not SaveProblem then exit;
     mrCancel : exit;
   end;
 end;

 OpenProblem(fname);
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if pbChanged then
 begin
   if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
   case messagedlg('Problema a fost modificata. Doriti sa o salvati ?',
                    mtConfirmation,mbYesNoCancel,0) of
     mrYes    : if not SaveProblem then begin Action:=caNone;exit;end;
     mrCancel : begin Action:=caNone;exit;end;
   end;
 end;

 InterfaceLook.SaveToRegistry;
end;


procedure TForm1.Savepicture1Click(Sender: TObject);
var MyImage:TGraphic;
begin
 if Image1.Picture.Graphic=nil then begin beep;exit;end;
 if PBFileName<>'' then
     SavePictureDialog1.FileName:=ExtractFileName(PBFileName)+'.bmp';
 if SavePictureDialog1.Execute then
     begin
       myimage:=TBitmap.Create;
       myimage.Assign(Image1.Picture.Graphic);
       myimage.SaveToFile(SavePictureDialog1.FileName);
       myimage.free;
     end;
end;


procedure TForm1.Loadtext1Click(Sender: TObject);
begin
 OpenDialog1.DefaultExt:='*.rtf';
 OpenDialog1.Filter:='Rich Text Format|*.rtf';
 OpenDialog1.FilterIndex:=1;
 OpenDialog1.Title:='Load RTF';
 OpenDialog1.FileName:='';
 if OpenDialog1.Execute then
     Editor.Lines.LoadFromFile(OpenDialog1.Filename);
end;


procedure TForm1.Savetext1Click(Sender: TObject);
begin
 SaveDialog1.DefaultExt:='*.rtf';
 SaveDialog1.Filter:='Rich Text Format|*.rtf';
 SaveDialog1.FilterIndex:=1;
 SaveDialog1.FileName:='';
 SaveDialog1.Title:='Save text as...';
 if SaveDialog1.Execute then
     Editor.Lines.SaveToFile(SaveDialog1.FileName);
end;


procedure TForm1.UndoBtnClick(Sender: TObject);
begin
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TForm1.CutBtnClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TForm1.CopyBtnClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TForm1.PasteBtnClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TForm1.AlignBtnClick(Sender: TObject);
begin
 if FUpdating then Exit;
 Editor.Paragraph.Alignment := TAlignment98(TControl(Sender).Tag);
 ActiveControl:= Editor;
end;

procedure TForm1.EditorSelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
  try
    FUpdating := True;
    BoldBtn.Down := fsBold in Editor.SelAttributes.Style;
    ItalicBtn.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineBtn.Down := fsUnderline in Editor.SelAttributes.Style;
    ColorBtn.Color := Editor.SelAttributes.Color;
    BulletsBtn.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.ItemIndex := FontName.Items.IndexOf(Editor.SelAttributes.Name);
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;


procedure TForm1.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[1].Text := Format('Line: %3d   Col: %3d', [CharPos.Y, CharPos.X]);

  // update the status of the cut and copy command
  CopyBtn.Enabled := Editor.SelLength > 0;
  CutBtn.Enabled := CopyBtn.Enabled;
  PopUpCut.Enabled:=CutBtn.Enabled;
  PopUpCopy.Enabled:=CopyBtn.Enabled;
  EditMnuCut.Enabled:=CutBtn.Enabled;
  EditMnuCopy.Enabled:=CopyBtn.Enabled;
end;


function TForm1.CurrText: TTextAttributes98;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;


procedure TForm1.BoldBtnClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldBtn.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
  ActiveControl:= Editor;
end;

procedure TForm1.ItalicBtnClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicBtn.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
  ActiveControl:= Editor;
end;

procedure TForm1.UnderlineBtnClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineBtn.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
  ActiveControl:= Editor;
end;

procedure TForm1.FontSizeChange(Sender: TObject);
var size:integer;
begin
  if FUpdating then Exit;
  try
   size:=StrToInt(FontSize.Text);
  except
   size:=12;
   beep;
  end;
  CurrText.Size := Size;
  ActiveControl:= Editor;
end;

procedure TForm1.BulletsBtnClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Numbering := TNumberingStyle98(BulletsBtn.Down);
  ActiveControl:= Editor;
end;

procedure TForm1.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  if not FontName.Enabled then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
  ActiveControl:= Editor;
end;


procedure TForm1.ColorBtnColorChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Color := ColorBtn.Color;
  ActiveControl:= Editor;
end;


procedure TForm1.PopUpFontClick(Sender: TObject);
begin
 if FUpdating then Exit;
 FontDialog1.Font.Name  := CurrText.Name;
 FontDialog1.Font.Size  := CurrText.Size;
 FontDialog1.Font.Style := CurrText.Style;
 FontDialog1.Font.Color := CurrText.Color;
 if FontDialog1.Execute then
   begin
     CurrText.Name := FontDialog1.Font.Name;
     CurrText.Size := FontDialog1.Font.Size;
     CurrText.Style:= FontDialog1.Font.Style;
     CurrText.Color:= FontDialog1.Font.Color;
     ActiveControl:= Editor;
   end;
end;


procedure TForm1.Removeallanswers1Click(Sender: TObject);
begin
  if NrAnswers=0 then begin beep;exit;end;
  if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);
  if messagedlg('Sunteti sigur ca vreti sa stergeti toate raspunsurile ?',
                 mtConfirmation,mbYesNoCancel,0)<>mrYes then exit;

 RemoveAllAnswers;
 PBChanged := true;
end;

procedure TForm1.Deletefile1Click(Sender: TObject);
var fname:AnsiString;
begin
 if FileListBox1.ItemIndex=-1 then exit;
 if InterfaceLook.Sounds then PlaySound('ALERT', hInstance, snd_ASync or snd_Resource);

 fname:=FileListBox1.Directory+'\'+FileListBox1.Items[FileListBox1.ItemIndex];
 if not Win95Erase(Form1.Handle, fname, InterfaceLook.userecyclebin, True) then exit;

 if fname=PBFilename then
     begin
       PBChanged:=false;
       Close1Click(Sender);
     end;

 FileListBox1.Update;
end;

procedure TForm1.Renamefile1Click(Sender: TObject);
var fname,res:AnsiString;
begin
 if FileListBox1.ItemIndex=-1 then exit;
 fname:=FileListBox1.Items[FileListBox1.ItemIndex];
 res:=InputBox('Rename file', 'New name', fname);
 if (res=fname) or (res='') then exit;
 if RenameFile(fname,res) then
  if FileListBox1.Directory+'\'+fname=PBFileName then
    begin
      PBFileName:=FileListBox1.Directory+'\'+res;
      MSOfficeCaption1.CaptionText.Caption:='Problem editor ('+PBFileName+')';
      FileListBox1.Update;
    end;
end;

procedure TForm1.ImageStretchClick(Sender: TObject);
begin
 ImageStretch.Checked:=not ImageStretch.Checked;
 if ImageStretch.checked
   then MyImageResize
   else
     begin
       Image1.align:=AlNone;
       Image1.stretch:=false;
       Image1.autosize:=true;
     end;
end;

procedure TForm1.ScrollBox2Resize(Sender: TObject);
begin
 if ImageStretch.checked then MyImageResize;
end;

procedure TForm1.Fullscreen1Click(Sender: TObject);
begin
  if Image1.Picture.Graphic=nil then begin beep;exit;end;
  if InterfaceLook.Sounds then PlaySound('ZOOMIN', hInstance, snd_ASync or snd_Resource);

  ViewFullScreenImage(Image1.Picture);

  if InterfaceLook.Sounds then PlaySound('ZOOMOUT', hInstance, snd_ASync or snd_Resource);
end;


procedure TForm1.EnableEditControls(val:boolean);
begin
  if val
    then begin
           FontName.Enabled:=true;
           FontSize.Enabled:=true;
           BoldBtn.Enabled:=true;
           ItalicBtn.Enabled:=true;
           UnderlineBtn.Enabled:=true;
           ColorBtn.Enabled:=true;
           LeftAlign.Enabled:=true;
           CenterAlign.Enabled:=true;
           RightAlign.Enabled:=true;
           FullAlign.Enabled:=true;
           BulletsBtn.Enabled:=true;
         end
    else begin
           FontName.Enabled:=false;
           FontSize.Enabled:=false;
           BoldBtn.Enabled:=false;
           ItalicBtn.Enabled:=false;
           UnderlineBtn.Enabled:=false;
           ColorBtn.Enabled:=false;
           LeftAlign.Enabled:=false;
           CenterAlign.Enabled:=false;
           RightAlign.Enabled:=false;
           FullAlign.Enabled:=false;
           BulletsBtn.Enabled:=false;
         end;
end;


Constructor TInterfaceLook.Create;
begin
  BrowserBackColor := RGB(243,251,215);
  BrowserTextColor := clBlack;
  Sounds           := True;
  UseLastDir       := True;
  ImageStretch     := False;
end;

Procedure TInterfaceLook.LoadFromRegistry;
var Reg: TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Problem Editor',True);

   if not Reg.ValueExists('imgcompress') then Reg.WriteInteger('imgcompress', 0);
   if not Reg.ValueExists('browserbackcolor') then Reg.WriteInteger('browserbackcolor', Integer(RGB(243,251,215)));
   if not Reg.ValueExists('browsertextcolor') then Reg.WriteInteger('browsertextcolor', Integer(clBlack));
   if not Reg.ValueExists('browserlastdir') then Reg.WriteString('browserlastdir', ExtractFilePath(ParamStr(0))+'Tests');
   if not Reg.ValueExists('browserfixdir') then Reg.WriteString('browserfixdir', ExtractFilePath(ParamStr(0))+'Tests');
   if not Reg.ValueExists('browsershow') then Reg.WriteBool('browsershow', True);
   if not Reg.ValueExists('imagestretch') then Reg.WriteBool('imagestretch', False);
   if not Reg.ValueExists('sounds') then Reg.WriteBool('sounds', True);
   if not Reg.ValueExists('showtipofday') then Reg.WriteBool('showtipofday', True);
   if not Reg.ValueExists('calcintern') then Reg.WriteBool('calcintern', True);
   if not Reg.ValueExists('imageprogram') then Reg.WriteString('imageprogram', 'paint.exe');
   if not Reg.ValueExists('textprogram') then Reg.WriteString('textprogram', 'wordpad.exe');
   if not Reg.ValueExists('charmapprogram') then Reg.WriteString('charmapprogram', 'charmap.exe');
   if not Reg.ValueExists('calcprogram') then Reg.WriteString('calcprogram', 'calc.exe');

   if not Reg.ValueExists('editincludeole') then Reg.WriteBool('editincludeole', True);
   if not Reg.ValueExists('editurldetect') then Reg.WriteBool('editurldetect', True);
   if not Reg.ValueExists('editwordwrap') then Reg.WriteBool('editwordwrap', True);

   if not Reg.ValueExists('userecyclebin') then Reg.WriteBool('userecyclebin', True);

   ImgCompress      := Reg.ReadInteger('imgcompress');
   BrowserBackColor := Reg.ReadInteger('browserbackcolor');
   BrowserTextColor := Reg.ReadInteger('browsertextcolor');
   BrowserLastDir   := RemoveBackSlash(Reg.ReadString('browserlastdir'));
   BrowserFixDir    := RemoveBackSlash(Reg.ReadString('browserfixdir'));
   BrowserShow      := Reg.ReadBool('browsershow');
   ImageStretch     := Reg.ReadBool('imagestretch');
   Sounds           := Reg.ReadBool('sounds');
   ShowTipOfDay     := Reg.ReadBool('showtipofday');
   CalcIntern       := Reg.ReadBool('calcintern');
   ImageProgram     := Reg.ReadString('imageprogram');
   TextProgram      := Reg.ReadString('textprogram');
   CharMapProgram   := Reg.ReadString('charmapprogram');
   CalcProgram      := Reg.ReadString('calcprogram');
   editincludeole   := Reg.ReadBool('editincludeole');
   editurldetect    := Reg.ReadBool('editurldetect');
   editwordwrap     := Reg.ReadBool('editwordwrap');
   userecyclebin    := Reg.ReadBool('userecyclebin');

   if BrowserLastDir=''
       then UseLastDir:=false
       else UseLastDir:=true;
 finally
   Reg.Free;
 end;
end;


Procedure TInterfaceLook.SaveToRegistry;
var Reg: TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Problem Editor',True);

   Reg.WriteInteger('imgcompress', imgcompress);
   Reg.WriteInteger('browserbackcolor', Integer(browserbackcolor));
   Reg.WriteInteger('browsertextcolor', Integer(browsertextcolor));
   if UseLastDir
      then Reg.WriteString('browserlastdir', RemoveBackSlash(Form1.FileListBox1.Directory))
      else Reg.WriteString('browserlastdir', '');
   Reg.WriteString('browserfixdir', RemoveBackSlash(browserfixdir));
   Reg.WriteBool('browsershow', browsershow);
   Reg.WriteBool('imagestretch', Form1.imagestretch.Checked);
   Reg.WriteBool('sounds', sounds);
   Reg.WriteBool('showtipofday', ShowTipOfDay);
   Reg.WriteBool('calcintern', CalcIntern);
   Reg.WriteString('imageprogram', imageprogram);
   Reg.WriteString('textprogram', textprogram);
   Reg.WriteString('charmapprogram', charmapprogram);
   Reg.WriteString('calcprogram', calcprogram);
   Reg.WriteBool('editincludeole',editincludeole);
   Reg.WriteBool('editurldetect',editurldetect);
   Reg.WriteBool('editwordwrap',editwordwrap);
   Reg.WriteBool('userecyclebin',userecyclebin);
 finally
   Reg.Free;
 end;
end;


Procedure TInterfaceLook.ApplyColors;
begin
 Form1.DriveComboBox1.Color    := browserbackcolor;
 Form1.DirectoryListBox1.Color := browserbackcolor;
 Form1.FileListBox1.Color      := browserbackcolor;

 Form1.DriveComboBox1.Font.Color    := browsertextcolor;
 Form1.DirectoryListBox1.Font.Color := browsertextcolor;
 Form1.FileListBox1.Font.Color      := browsertextcolor;

end;



Procedure   TInterfaceLook.ApplyEditorSettings;
begin
 Form1.ImageStretch.Checked:=ImageStretch;

 if editincludeole
      then begin
              if not Form1.Editor.IncludeOLE then Form1.Editor.IncludeOLE:=true;
              Form1.Editor.OutPutFormat := ofRTF;
           end
      else begin
              Form1.Editor.IncludeOLE:=false;
              Form1.Editor.OutPutFormat := ofRTFNoObjs;
           end;

 if editurldetect
      then Form1.Editor.AutoURLDetect := adDefault
      else Form1.Editor.AutoURLDetect := adNone;

 if editwordwrap
      then begin
              Form1.Editor.WordWrap:=true;
              Form1.Editor.ScrollBars := ssVertical;
           end
      else begin
              Form1.Editor.WordWrap:=false;
              Form1.Editor.ScrollBars := ssBoth;
           end;
end;



procedure TForm1.Options1Click(Sender: TObject);
begin
  ShowSettingsForm;
end;

procedure TForm1.Imageeditor1Click(Sender: TObject);
var zFileName: array[0..79] of Char;
begin
 ShellExecute(form1.handle,nil,StrPCopy(zFileName,InterfaceLook.ImageProgram),'','',sw_show);
end;

procedure TForm1.Texteditor1Click(Sender: TObject);
var zFileName: array[0..79] of Char;
begin
 ShellExecute(form1.handle,nil,StrPCopy(zFileName,InterfaceLook.TextProgram),'','',sw_show);
end;



procedure TForm1.Charactermap1Click(Sender: TObject);
var zFileName: array[0..79] of Char;
begin
 ShellExecute(form1.handle,nil,StrPCopy(zFileName,InterfaceLook.CharMapProgram),'','',sw_show);
end;



procedure TForm1.Calculator1Click(Sender: TObject);
var zFileName: array[0..79] of Char;
begin
 if InterfaceLook.CalcIntern
   then RxCalculator.Execute
   else ShellExecute(form1.handle,nil,StrPCopy(zFileName,InterfaceLook.CalcProgram),'','',sw_show);
end;

procedure TForm1.RedoBtnClick(Sender: TObject);
begin
  if Editor.CanRedo then Editor.Redo;
end;

procedure TForm1.PopupPasteSpecialClick(Sender: TObject);
begin
 Editor.PasteSpecialDialog;
end;

procedure TForm1.EditmnuInsertObjectClick(Sender: TObject);
begin
 if not InterfaceLook.editincludeole then begin beep;exit; end;
 Editor.InsertObjectDialog;
end;

procedure TForm1.TipDialogExecuted(Sender: TObject;
  StartNextTime: Boolean);
begin
 InterfaceLook.ShowTipOfDay:=StartNextTime;
end;

procedure TForm1.ShowtipofDay1Click(Sender: TObject);
begin
 TipDialog.OnAtStart:=True;
 TipDialog.Execute;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 if TipsFirstRun then
    begin
     TipDialog.OnAtStart:=InterfaceLook.ShowTipOfDay;
     TipDialog.Color:=RGB(243,251,215);
     TipDialog.Execute;
     TipsFirstRun:=false;
    end;
end;

procedure TForm1.Clipboardview1Click(Sender: TObject);
begin
  ShowClipboard;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 if fontloaded
   then LoadFont(extractfilepath(Application.ExeName)+'times.ttf',false);
end;

procedure TForm1.Newfolder1Click(Sender: TObject);
var res:string;
begin
 res:=InputBox('New folder', 'Folder name', '');
 if res='' then exit;
 try
   mkdir(FileListBox1.Directory+'\'+res);
   DirectoryListBox1.Update;
 except
   if InterfaceLook.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
   MessageDlg('Nu se poate crea folderul '+res,mtError,[mbOK],0);
 end;
end;

procedure TForm1.Deletefolder1Click(Sender: TObject);
var rd:string;
begin
 try
   rd:=FileListBox1.Directory+'\'+DirectoryListBox1.Items[DirectoryListBox1.ItemIndex];
   rmdir(rd);
   DirectoryListBox1.Update;
 except
   if InterfaceLook.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
   MessageDlg('Nu se poate sterge folderul '+rd+#13#10'Posibily it''s not empty',mtError,[mbOK],0);
 end;
end;

procedure TForm1.Contents1Click(Sender: TObject);
begin
 Application.HelpCommand(HELP_FINDER,0);
end;

procedure TForm1.RegistrationTimerTimer(Sender: TObject);
begin
 Dec(RegistrationCount);
 if RegistrationCount=0 then begin
                               MessageDlg('Programul PowerTests pe care il detineti este o versiune demonstrativa.'#13#10+
                                          'Cu aceasta versiune demo se poate lucra maxim 10 minute/sesiune.'#13#10#13#10+
                                          'Apasati OK pentru a parasi programul.',mtInformation,[mbOK],0);
                               RegistrationTimer.Enabled:=false;
                               pbChanged:=false;
                               Close;
                             end;
end;

end.

