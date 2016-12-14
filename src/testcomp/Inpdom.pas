unit inpdom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

Function InputDomain(var short:String;var long:String):boolean;

type
  TInputDomForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputDomForm: TInputDomForm;

implementation

{$R *.DFM}

Function InputDomain(var short:String;var long:String):boolean;
begin
 with TInputDomForm.Create(Application) do
    try
     result:=false;
     Edit1.Text:=short;
     Edit2.Text:=long;
     if ShowModal=MrOK then
       begin
         short:=Edit1.Text;
         long:=Edit2.Text;
         result:=true;
       end;
    finally
     Free;
    end;
end;

end.
