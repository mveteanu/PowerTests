program TestCPL;

uses
  Forms,
  UnitZero in 'UnitZero.pas' {FormZero},
  Unit1 in 'Unit1.pas' {MainForm},
  about in 'about.pas' {TSettings};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Power Tests';
  Application.CreateForm(TFormZero, FormZero);
  FormZero.Hide;
  Application.Run;
end.
