unit setings;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Dialogs, Mask, ToolEdit, DFSClrBn;

Procedure DoSettings;

type
  TSetWnd = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    FilenameEdit1: TFilenameEdit;
    lab1: TLabel;
    lab2: TLabel;
    lab3: TLabel;
    lab4: TLabel;
    lab5: TLabel;
    lab6: TLabel;
    colbut1: TDFSColorButton;
    colbut2: TDFSColorButton;
    colbut3: TDFSColorButton;
    colbut4: TDFSColorButton;
    colbut5: TDFSColorButton;
    colbut6: TDFSColorButton;
    Label6: TLabel;
    Label7: TLabel;
    colbut7: TDFSColorButton;
    colbut8: TDFSColorButton;
    TabSheet4: TTabSheet;
    Image1: TImage;
    edchk1: TCheckBox;
    edchk2: TCheckBox;
    edchk3: TCheckBox;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    browserdir: TDirectoryEdit;
    ProfGrup1: TGroupBox;
    ProfGrup2: TGroupBox;
    SpeedButton1: TSpeedButton;
    CheckBox2: TCheckBox;
    Label5: TLabel;
    Edit2: TEdit;
    Label9: TLabel;
    Edit3: TEdit;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetWnd: TSetWnd;

implementation

uses unit1, passwd2,
     MMSystem,
     FileUtil {FileUtil din RX};

{$R *.DFM}


Procedure DoSettings;
var a:integer;
begin
 with TSetWnd.Create(Application) do
    try
     ColBut1.Color:=InterfaceColors.FormColor;
     ColBut2.Color:=InterfaceColors.ScrollBox1Color;
     ColBut3.Color:=InterfaceColors.RichEditColor;
     ColBut4.Color:=InterfaceColors.Label1Color;
     ColBut5.Color:=InterfaceColors.MyScrollBoxColor;
     ColBut6.Color:=InterfaceColors.ABCDEColor;
     ColBut7.Color:=InterfaceColors.Spliter1Color;
     ColBut8.Color:=InterfaceColors.MySpliter1Color;
     CheckBox1.Checked:=InterfaceColors.Sounds;
     RadioButton1.Checked:=Form1.CalcIntern;
     RadioButton2.Checked:=not Form1.CalcIntern;
     FilenameEdit1.Text:=Form1.CalcPath;
     FilenameEdit1.Enabled:=not Form1.CalcIntern;
     EdChk1.Checked:=InterfaceColors.editincludeole;
     EdChk2.Checked:=InterfaceColors.editurldetect;
     EdChk3.Checked:=InterfaceColors.editwordwrap;
     browserdir.text:=InterfaceColors.browserdir;

     CheckBox2.Checked:=form1.arataraspunsuricorecte;
     CheckBox3.Checked:=form1.permisrebegin;
     CheckBox4.Checked:=form1.permisreopen;
     CheckBox5.Checked:=form1.calcpermis;
     Edit2.Text:=inttostr(form1.notadinoficiu);
     Edit3.Text:=floattostr(form1.erracceptata);
     if Form1.ProfPasswd='' then
       begin
         ProfGrup1.Enabled:=true;
         ProfGrup2.Enabled:=true;
         Label1.Enabled:=false;
         Edit1.Enabled:=false;
       end
     else
       begin
         ProfGrup1.Enabled:=false;
         ProfGrup2.Enabled:=false;
         Label1.Enabled:=true;
         Edit1.Enabled:=true;
       end;

     if ShowModal=MrOK then
       begin
        form1.arataraspunsuricorecte:=CheckBox2.Checked;
        form1.permisrebegin:=CheckBox3.Checked;
        form1.permisreopen:=CheckBox4.Checked;
        a:=form1.notadinoficiu;
        try
         a:=strtoint(Edit2.Text);
        except
         MessageDlg('Nota din oficiu are valoare incorecta. Se va folosi valoarea implicita.',mtWarning,[mbOK],0);
        end;
        if (a<0) or (a>9)
          then MessageDlg('Nota din oficiu are valoare incorecta.'#13#10'Se va folosi valoarea implicita.',mtWarning,[mbOK],0)
          else form1.notadinoficiu:=a;

        try
          form1.erracceptata:=strtofloat(Edit3.Text);
        except
          MessageDlg('Valoarea specificata pentru "Eroarea acceptata" este incorecta.'#13#10'Se foloseste valoarea implicita.',mtWarning,[mbOK],0);
        end;

        InterfaceColors.Sounds:=CheckBox1.Checked;

        Form1.calcpermis:=CheckBox5.Checked;
        if Form1.calcpermis then Form1.CalcBtn1.Enabled:=true else Form1.CalcBtn1.Enabled:=false;
        Form1.CalcIntern:=RadioButton1.Checked;
        Form1.CalcPath:=FilenameEdit1.Text;

        InterfaceColors.FormColor:=ColBut1.Color;
        InterfaceColors.ScrollBox1Color:=ColBut2.Color;
        InterfaceColors.Label1Color:=ColBut4.Color;
        InterfaceColors.Spliter1Color:=ColBut7.Color;
        InterfaceColors.MySpliter1Color:=ColBut8.Color;
        InterfaceColors.RichEditColor:=ColBut3.Color;
        InterfaceColors.MyScrollBoxColor:=ColBut5.Color;
        InterfaceColors.ABCDEColor:=ColBut6.Color;

        InterfaceColors.editincludeole:=EdChk1.Checked;
        InterfaceColors.editurldetect:=EdChk2.Checked;
        InterfaceColors.editwordwrap:=EdChk3.Checked;

        InterfaceColors.browserdir:=RemoveBackSlash(browserdir.text);
        if not DirExists(InterfaceColors.browserdir) then
          begin
            if InterfaceColors.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
            MessageDlg(Format('Tests folder %s is invalid.'#13#10'Using default folder: %s',[InterfaceColors.browserdir,ExtractFilePath(ParamStr(0))+'Tests']),mtError,[mbOK],0);
            InterfaceColors.browserdir:=ExtractFilePath(ParamStr(0))+'Tests';
          end;

        InterfaceColors.ApplyColors;
        InterfaceColors.ApplyEditorSettings;
       end;
    finally
     Free;
    end;
end;

procedure TSetWnd.Edit1Change(Sender: TObject);
begin
 if Edit1.Text=Form1.ProfPasswd then
   begin
     ProfGrup1.Enabled:=true;
     ProfGrup2.Enabled:=true;
     Label1.Enabled:=false;
     Edit1.Enabled:=false;
     MessageDlg('Password accepted.'#13#10'You can modify profesor''s settings.',mtInformation,[mbOK],0);
     Edit1.Clear;
   end;
end;


procedure TSetWnd.ComboBox1Change(Sender: TObject);
begin
 case ComboBox1.ItemIndex of
  0: begin
      ColBut1.Color:=clBtnFace;
      ColBut2.Color:=clBtnFace;
      ColBut3.Color:=clWindow;
      ColBut4.Color:=clBlack;
      ColBut5.Color:=clWindow;
      ColBut6.Color:=clBlue;
      ColBut7.Color:=clBtnFace;
      ColBut8.Color:=clBtnFace;
     end;
  1: begin
      ColBut1.Color:=clTeal;
      ColBut2.Color:=clTeal;
      ColBut3.Color:=RGB(224,231,207);
      ColBut4.Color:=clLime;
      ColBut5.Color:=RGB(224,231,207);
      ColBut6.Color:=clAqua;
      ColBut7.Color:=clBtnFace;
      ColBut8.Color:=clBtnFace;
     end;
  2: begin
      ColBut1.Color:=clNavy;
      ColBut2.Color:=clNavy;
      ColBut3.Color:=RGB(245,245,255);
      ColBut4.Color:=clAqua;
      ColBut5.Color:=RGB(245,245,255);
      ColBut6.Color:=clAqua;
      ColBut7.Color:=clNavy;
      ColBut8.Color:=clNavy;
     end;
  3: begin
      ColBut1.Color:=clSilver;
      ColBut2.Color:=clSilver;
      ColBut3.Color:=clWhite;
      ColBut4.Color:=clBlack;
      ColBut5.Color:=clSilver;
      ColBut6.Color:=clBlue;
      ColBut7.Color:=clSilver;
      ColBut8.Color:=clSilver;
     end;
 end;
end;


procedure TSetWnd.RadioButton1Click(Sender: TObject);
begin
 FilenameEdit1.Enabled:=RadioButton2.Checked;
end;

procedure TSetWnd.SpeedButton1Click(Sender: TObject);
begin
 ChangePasswd;
 if Form1.ProfPasswd='' then
   begin
     ProfGrup1.Enabled:=true;
     ProfGrup2.Enabled:=true;
     Label1.Enabled:=false;
     Edit1.Enabled:=false;
   end
end;

end.


