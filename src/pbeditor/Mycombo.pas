unit MyCombo;  // ComboBox cu editarea Item-ilor

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;


type TComboBoxWithEdit=class(TPanel)
       private
         ComboBox1:TComboBox;
         Button1:TSpeedButton;
         FormEdit:TForm;
         Pannel1:TPanel;
         Memo1:TMemo;
         OKBtn,CancelBtn:TSpeedButton;
         procedure Button1Click(Sender: TObject);
         procedure OkBtnClick(Sender: TObject);
         procedure CancelBtnClick(Sender: TObject);
       public
         constructor Create(AOwner: TComponent); override;
         destructor  Destroy; override;
         procedure   SetComboData(index:integer;data:AnsiString);
         procedure   GetComboData(var index:integer;var data:AnsiString);
     end;



implementation


function LTrim(s: string): string;
var i: integer;
begin
  i := 1;
  while s[i] = ' ' do inc(i);
  result := copy(s, i, length(s) - i + 1);
end;

procedure BreakString(BaseString:string; StringList: TStrings);
var
  EndOfCurrentString: longint;
begin
  repeat
    BaseString:=Ltrim(BaseString);
    if BaseString='' then exit;
    if BaseString[1]='"' then
      begin
        delete(BaseString,1,1);
        EndOfCurrentString := Pos('"', BaseString);
      end
    else
      EndOfCurrentString := Pos(' ', BaseString);
    if EndOfCurrentString = 0 then
        StringList.add(BaseString)
    else
        StringList.add(Copy(BaseString, 1, EndOfCurrentString - 1));
    BaseString := Copy(BaseString, EndOfCurrentString + 1, length(BaseString) - EndOfCurrentString);
  until (EndOfCurrentString = 0) or (BaseString='');
end;


procedure TComboBoxWithEdit.GetComboData(var index:integer;var data:AnsiString);
var i:integer;
begin
 index:=ComboBox1.ItemIndex;
 data:='';
 if ComboBox1.Items.Count=0 then exit;
 for i:=0 to ComboBox1.Items.Count-1 do
  data:=data+' "'+ComboBox1.Items[i]+'"';
 data:=LTrim(data);
end;


procedure TComboBoxWithEdit.SetComboData(index:integer;data:AnsiString);
begin
 ComboBox1.Items.Clear;
 if data<>'' then BreakString(data,ComboBox1.Items);
 try
  ComboBox1.ItemIndex:=index;
 except
  ComboBox1.ItemIndex:=-1;
 end;
end;


procedure TComboBoxWithEdit.Button1Click(Sender: TObject);
var i:integer;
begin
 Memo1.Clear;
 if ComboBox1.Items.Count>=1 then
  for i:=0 to ComboBox1.Items.Count-1 do
    Memo1.Lines.Add(ComboBox1.Items[i]);
 FormEdit.ShowModal;
end;

procedure TComboBoxWithEdit.OkBtnClick(Sender: TObject);
var i:integer;
begin
  ComboBox1.Items.Clear;
  for i:=0 to Memo1.Lines.Count-1 do
     ComboBox1.Items.Add(Memo1.Lines[i]);
  FormEdit.Close;
end;

procedure TComboBoxWithEdit.CancelBtnClick(Sender: TObject);
begin
 FormEdit.Close;
end;


constructor TComboBoxWithEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // ...
  Width := 200;
  Height := 21;
  caption := '';
  BevelOuter:= bvNone;
  BevelInner:= bvNone;

  ComboBox1:=TComboBox.Create(Self);
  ComboBox1.Parent:=Self;
  ComboBox1.Style:=csDropDownList;
  ComboBox1.SetBounds(Left,Top,Width-55,Height);
  ComboBox1.Hint:=Hint;
  ComboBox1.ShowHint:=ShowHint;
  ComboBox1.Visible:=Visible;

  Button1:=TSpeedButton.Create(Self);
  Button1.Parent:=Self;
  Button1.Caption:='Edit !';
  Button1.Cursor:=crHandPoint;
  Button1.Hint:='Add/Remove items from ComboBox';
  Button1.ShowHint:=ShowHint;
  Button1.Flat:=True;
  Button1.SetBounds(Left+ComboBox1.Width,Top,55,Height);
  Button1.Visible:=Visible;
  Button1.OnClick:=Button1Click;

  FormEdit:=TForm.Create(Self);
  FormEdit.BorderStyle:=bsSizeToolWin;
  FormEdit.BorderIcons:=[];
  FormEdit.Position:=poScreenCenter;
  FormEdit.Caption:='Edit combo';
  FormEdit.Width:=200;
  FormEdit.Height:=200;

  Pannel1:=TPanel.Create(Self);
  Pannel1.Parent:=FormEdit;
  Pannel1.Caption:='';
  Pannel1.BevelOuter:= bvNone;
  Pannel1.BevelInner:= bvNone;
  Pannel1.Height:=30;
  Pannel1.Align:=alBottom;

  Memo1:=TMemo.Create(Self);
  Memo1.Parent:=FormEdit;
  Memo1.Text:='';
  Memo1.ScrollBars:=ssVertical;
  Memo1.Align:=alClient;

  OKBtn:=TSpeedButton.Create(Self);
  OKBtn.Parent:=Pannel1;
  OKBtn.Caption:='&O.K.';
  OKBtn.Cursor:=crHandPoint;
  OKBtn.Flat:=True;
  OKBtn.SetBounds(10,5,60,20);
  OKBtn.OnClick:=OKBtnClick;

  CancelBtn:=TSpeedButton.Create(Self);
  CancelBtn.Parent:=Pannel1;
  CancelBtn.Caption:='&Cancel';
  CancelBtn.Cursor:=crHandPoint;
  CancelBtn.Flat:=True;
  CancelBtn.SetBounds(130,5,60,20);
  CancelBtn.OnClick:=CancelBtnClick;
end;

destructor TComboBoxWithEdit.Destroy;
begin
  // ...
  ComboBox1.Free;
  Button1.Free;
  Memo1.Free;
  OKBtn.Free;
  CancelBtn.Free;
  Pannel1.Free;
  FormEdit.Free;
  inherited Destroy;
end;



end.
