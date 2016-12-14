unit infotest;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TOKBottomDlg = class(TForm)
    OKBtn: TButton;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OKBottomDlg: TOKBottomDlg;

procedure GetTestInfo;

  implementation

{$R *.DFM}

uses unit1;

procedure GetTestInfo;
begin

  with TOKBottomDlg.Create(Application) do
    try
      Label8.Caption:='Nume test: '+form1.test1.TestName;
      Label1.Caption:='Nr. probleme in test: '+inttostr(form1.test1.NrProblems)+' ('+inttostr(form1.test1.NrProblems-form1.test1.NrPbRandom)+' permanente, '+inttostr(form1.test1.NrPbRandom)+' aleatoare)';
      Label2.Caption:='Nr. pb. aleatoare cerute: '+inttostr(form1.test1.NrPbRandomSolicitate);
      Label3.Caption:='Timp: '+inttostr(form1.test1.time);
      Label4.Caption:='Time trecut: '+inttostr(form1.curenttime);
      Label5.Caption:='Nota din oficiu: '+inttostr(form1.notadinoficiu)+' ('+inttostr(round((form1.notadinoficiu*form1.test1.puncte)/(10-form1.notadinoficiu)))+' puncte)';
      Label6.Caption:='Puncte pentru nota 5: '+floattostrf(((5-form1.notadinoficiu)*form1.test1.puncte)/(10-form1.notadinoficiu),ffGeneral,3,0);
      Label7.Caption:='Puncte pentru nota 10: '+inttostr(form1.test1.puncte)+' (toate problemele)';
      ShowModal;
    finally
      Free;
    end;

end;



end.

