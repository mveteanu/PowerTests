unit inppb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

Function InputPbperCateg(categ:string;d:integer):integer;

type
  Tinputpb = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    procedure RadioButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AcceptaDoarNumere(Sender: TObject; var Key: Char);
  end;

var
  inputpb: Tinputpb;

implementation

{$R *.DFM}



Function InputPbperCateg(categ:string;d:integer):integer;
begin
  if d=9999 then begin
                    inputpb.RadioButton2.Checked:=true;
                    inputpb.Edit1.Text:='';
                    inputpb.Edit1.Enabled:=false;
                  end
  else if d=0 then begin
                    inputpb.RadioButton1.Checked:=true;
                    inputpb.Edit1.Text:='0';
                    inputpb.Edit1.Enabled:=false;
                  end
              else begin
                    inputpb.RadioButton3.Checked:=true;
                    inputpb.Edit1.Text:=InttoStr(d);
                   end;

  inputpb.Caption:='Categoria: '+categ;

  if inputpb.ShowModal=mrCancel then
            begin
              result:=-1;
              exit;
            end;
  if inputpb.RadioButton2.Checked
            then result:=9999
  else if inputpb.RadioButton1.Checked
            then result:=0
  else try
         result:=StrToInt(inputpb.Edit1.Text);
         if (result<0) or (result>9999) then result:=-1;
       except
         result:=-1;
       end;
  if result=-1 then begin
                     beep;
                     MessageDlg('Valoarea trebuie sa fie intre 0 si 9999',mtError,[mbOK],0);
                    end;
end;


procedure Tinputpb.RadioButton1Click(Sender: TObject);
begin
 if RadioButton3.Checked then begin
                                Edit1.Enabled:=true;
                                ActiveControl:=Edit1;
                              end
                         else Edit1.Enabled:=false;
end;


procedure Tinputpb.AcceptaDoarNumere(Sender: TObject; var Key: Char);
begin
 if ((key<'0') or (key>'9')) and (key<>#8) then
   begin beep;key:=#0;end;
end;



procedure Tinputpb.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 AcceptaDoarNumere(Sender,Key);
end;

end.
