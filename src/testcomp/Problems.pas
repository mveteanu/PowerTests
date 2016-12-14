unit problems;

interface
uses classes,sysutils,dialogs,graphics,rxgif,jpeg;

procedure BreakString(BaseString:string; StringList: TStrings);
function LTrim(s: string): string;

type TProblem = class(TObject)
 public // private
    PBFilename  : string;
    PBVersion   : byte;
    ImgType     : byte;
    RTFPos      : LongInt;
    ImgPos      : LongInt;
    Dificulty   : Integer;  // 0=necunoscuta, 1+=gradul de dificultate al problemei
    Category    : string;   // Categoria problemei
    Author      : string;   // autorul problemei
    Puncte      : Integer;  // numarul de puncte acordat (daca lipseste directiva se ia implicit 1 punct)
    AnswerType  : Integer;  // de tip 0=TCheckBox ; 1=TComboBox ; 2=TEdit
    PartialAnsw : Boolean;  // daca se intalneste directiva aceasta, atunci se permite notarea partiala a problemei (in functie de subpunctele rezolvate)
    NrAnswers   : Integer;  // numarul de raspunsuri
    Answers     : array[1..20] of record
                                    value       : string;
                                    extraparams : string;
                                  end;
    UserAnswers : array[1..20] of string;
  private
    Signature   : array[1..3] of Byte;
    fstream     : TStream; // stream-ul din care se incarca problema
  public
    Constructor Create(const s:string);
    Function    IsValid:boolean;   // testeaza daca este fisier valid (corespunde semnatura)
    Function    IsValidFileAndVersion:boolean;   // testeaza daca corespunde semnatura si versiunea 1.0
    Function    LoadDescriptions:boolean;
    Function    LoadRTF(sl:TStrings):boolean;
    Function    LoadImg(pict:TPicture):boolean;
    Procedure   Free;
end;


type TTest = class(TObject)
  public //  private
    TSTFilename : string;  // numele fisierului ce contine descrierea testului
    Domain      : record   // domeniu din care face parte testul (Ex. calculatoare, auto, electronica)
                    shortname: string;  // Ex. M.E.E.
                    longname: string;   // Ex. Masurari electrice si electronice
                  end;
    NrPbRandom  : integer;  // numarul de probleme alese aleator
    NrProblems  : integer;  // numarul de probleme din test
    Comment     : string;
    PbsArray    : string;   // problemele specificate cu directiva .problem
    CatArray    : string;   // categoriile restrictionate cu directiva .category
    NrPbRandomSolicitate : integer;  // numarul de probleme aleatoare solicitate
    Path        : string;   // directorul in care se afla problemele
    Dificulty   : integer;  // 0=oricare, 1+=gradul de dificultate al problemelor care compun testul
    Puncte      : integer;  // numarul maxim de puncte care se pot obtine daca se rezolva toate problemele
    Author      : string;   // ''=oricare, altfel autorul problemelor care compun testul
    TestName    : string;   // numele testului
    Time        : integer;  // 0=nelimitat, altfel timpul de rezolvare al testului in minute
    Problems    : array[1..500] of TProblem;
    NrCateg     : integer;
    Categories  : array[1..100] of record
                                     category:string;
                                     howmax:integer;
                                     howloaded:integer;
                                   end;
  public
    Constructor Create;
    Function    IsPbInTest(FileName:string):boolean;
    Procedure   LoadFromFile(const s:string);
    Procedure   LoadDescription(const s:string);
    Function    CategoryFull(cat:string):boolean;
    Procedure   ClearUserAnswers;
    Procedure   FreeProblems;
    Procedure   Free;
end;

implementation


function LTrim(s: string): string;
var i: integer;
begin
  if s='' then begin
                 result:='';
                 exit;
               end;
  i := 1;
  while s[i] = ' ' do inc(i);
  result := copy(s, i, length(s) - i + 1);
end;

procedure BreakString(BaseString:string; StringList: TStrings);
var
  EndOfCurrentString: longint;
begin
  if BaseString='' then exit;
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


//////////////////////////////////////////////////////////////////


Constructor TProblem.Create(const s:string);
begin
 Dificulty := 0;
 Author := '';
 Puncte := 1;
 NrAnswers := 0;
 PartialAnsw:= false;
 Category:='';
 PBFilename:=s;

 FStream:=TFileStream.Create(s,fmOpenRead or fmShareDenyWrite);
 FStream.Read(Signature,SizeOf(Signature));
 FStream.Read(PBVersion,SizeOf(PBVersion));
 FStream.Read(ImgType,SizeOf(ImgType));
 FStream.Read(RTFPos,SizeOf(RTFPos));
 FStream.Read(ImgPos,SizeOf(ImgPos));
end;


Function TProblem.IsValid:boolean;
begin
 If (Signature[1]=80) and
    (Signature[2]=66) and
    (Signature[3]=33)
         then result:=true
         else result:=false;
end;



Function TProblem.IsValidFileAndVersion:boolean;
begin
 If (Signature[1]=80) and
    (Signature[2]=66) and
    (Signature[3]=33) and
    (PBVersion=1)
         then result:=true
         else result:=false;
end;


Procedure  TProblem.Free;
begin
  FStream.Free;
  inherited Free;
end;


Function TProblem.LoadRTF(sl:TStrings):boolean;
begin
 If (Signature[1]<>80) or
    (Signature[2]<>66) or
    (Signature[3]<>33) or
    (PBVersion>1) then begin
                         result:=false;
                         exit;
                       end;

 FStream.Seek(rtfpos,soFromBeginning);
 sl.LoadFromStream(fstream);

 result:=true;
end;


Function  TProblem.LoadImg(pict:TPicture):boolean;
begin
 If (Signature[1]<>80) or
    (Signature[2]<>66) or
    (Signature[3]<>33) or
    (PBVersion>1) or
    (imgtype=$FF) then begin
                         result:=false;
                         exit;
                       end;

 FStream.Seek(imgpos,soFromBeginning);
 case imgtype of
  0 : pict.graphic:=TBitmap.Create;
  1 : pict.graphic:=TGifImage.Create;
  2 : pict.graphic:=TJPEGImage.Create;
 end;
 pict.graphic.LoadFromStream(fstream);

 result:=true;
end;


Function TProblem.LoadDescriptions:boolean;
var ts,ts2: TStringList;
    i,j:integer;
    st:AnsiString;
begin
 If (Signature[1]<>80) or
    (Signature[2]<>66) or
    (Signature[3]<>33) or
    (PBVersion>1) then begin
                         result:=false;
                         exit;
                       end;

 i:=SizeOf(Signature)+SizeOf(PBVersion)+
    SizeOf(ImgType)+SizeOf(rtfpos)+SizeOf(imgpos);
 SetLength(st,RTFPos-i);
 FStream.Seek(i,soFromBeginning);
 FStream.Read(pointer(st)^,RTFPos-i);

 ts := TStringList.Create;
 ts.Text:=st;

 for i:=0 to ts.count-1 do
 if ts[i]<>'' then
  begin
    ts2 := TStringList.Create;
    BreakString(ts[i],ts2);

    if ts2[0]='.dificulty' then Dificulty:=strtoint(ts2[1])      // {**} Sa verific daca ts2[1] este numar intreg
    else if ts2[0]='.author' then
        if ts2.count>1 then Author:=ts2[1] else Author:=''
    else if ts2[0]='.category' then Category:=ts2[1]
    else if ts2[0]='.puncte' then Puncte:=strtoint(ts2[1])
    else if ts2[0]='.answertype' then AnswerType:=strtoint(ts2[1])
    else if ts2[0]='.partialanswer' then PartialAnsw:=true
    else if ts2[0]='.answer' then
        if ts2.count>1 then
          begin
            inc(NrAnswers);
            Answers[NrAnswers].Value:=ts2[1];
            Answers[NrAnswers].ExtraParams:='';
            if ts2.count>2 then for j:=2 to ts2.count-1 do Answers[NrAnswers].ExtraParams:=Answers[NrAnswers].ExtraParams+'"'+ts2[j]+'" ';
          end;
    ts2.free;
  end;


 ts.Free;

 // Sterge var. care memoreaza raspunsurile utilizatorului
 if AnswerType = 0 then for i:=1 to NrAnswers do UserAnswers[i]:='0'
 else if AnswerType = 1 then for i:=1 to NrAnswers do UserAnswers[i]:='-1'
 else if AnswerType = 2 then for i:=1 to NrAnswers do UserAnswers[i]:='';

 result:=true;
end;



//////////////////////////////////////////////////////////////////



Constructor TTest.Create;
var i:integer;
begin
 TestName := '';
 Time := 0;
 Dificulty := 0;
 Author := '';
 Domain.shortname :='Div';
 Domain.longname :='Diverse';
 NrPbRandom := 0;
 NrProblems := 0;
 Puncte := 0;
 NrCateg:=0;
 for i:=1 to 100 do begin
                     categories[i].category:='';
                     categories[i].howmax:=9999;
                     categories[i].howloaded:=0;
                    end;
end;


Function TTest.CategoryFull(cat:string):boolean;
var i:integer;
begin
 result:=false;
 if NrCateg=0 then exit;
 for i:=1 to NrCateg do
   if categories[i].category=cat then
      begin
        if categories[i].howloaded>=categories[i].howmax then result:=true;
        if categories[i].howloaded<categories[i].howmax then inc(categories[i].howloaded);
      end;
end;


Procedure TTest.LoadDescription(const s:string);
var ts,ts2: TStringList;
    i:integer;ps:string;
begin
 TSTFilename :=s;
 PbsArray:=' ';
 CatArray:=' ';
 Comment:='';
 getdir(0,ps);Path:=ps;

 ts := TStringList.Create;
 ts.LoadFromFile(s);         // Incarca fisierul cu definitia problemei in ts
                             // {**} Sa verific daca exista fisierul

 for i:=0 to ts.count-1 do
 if ts[i]<>'' then
  begin
    ts2 := TStringList.Create;
    BreakString(ts[i],ts2);

    if ts2[0]='.random' then NrPbRandom:=strtoint(ts2[1])      // {**} Sa verific daca ts2[1] este numar intreg
    else if ts2[0]='.testname' then
        if ts2.count>1 then TestName:=ts2[1] else TestName:=''
    else if ts2[0]='.domain' then
        begin
          if ts2.count>1 then Domain.ShortName:=ts2[1] else Domain.ShortName:='Div';
          if ts2.count>2 then Domain.LongName:=ts2[2] else Domain.LongName:=Domain.ShortName;
        end
    else if ts2[0]='.time' then Time:=strtoint(ts2[1])
    else if ts2[0]='.dificulty' then Dificulty:=strtoint(ts2[1])
    else if ts2[0]='.author' then
        if ts2.count>1 then Author:=ts2[1] else Author:=''
    else if ts2[0]='.path' then
        if ts2.count>1 then Path:=ExtractFilePath(TSTFilename)+ts2[1]
                       else begin getdir(0,ps);Path:=ps;end
    else if ts2[0]='.problem' then begin
                                     PbsArray:=PbsArray+' "'+ts2[1]+'"';
                                     inc(NrProblems);
                                   end
    else if ts2[0]='.category' then begin
                                     CatArray:=CatArray+' "'+ts2[1]+' '+ts2[2]+'"';
                                    end
    else if ts2[0]='.rem' then Comment:=Comment+ts2[1]+#13#10;

    ts2.free;
  end;
 ts.Free;
 PbsArray:=LTrim(PbsArray);
 CatArray:=LTrim(CatArray);
end;


Function TTest.IsPbInTest(FileName:string):boolean;
var i:integer;
begin
 result:=false;
 for i := 1 to NrProblems do
    if Problems[i].PBFilename=FileName then
       begin
         result:=true;exit;
       end;
end;


Procedure TTest.Loadfromfile(const s:string);
var ts,ts2: TStringList;
    i,j:integer;
    sr:TSearchRec; found:integer;
    NrProblemeGasite : integer;
    NrPbInDir : integer;
    next:boolean; ps:string;
    a:array[0..10000] of integer;  // Poate gestiona o lista cu pana la 10000 de fisiere cu probleme

Function SePotriveste(pb:string;autor:string;dific:integer):boolean;
var p1:TProblem;
begin
 Result := true;
 p1:=TProblem.Create(pb);
 p1.LoadDescriptions;
 if autor<>'' then if autor<>p1.Author then Result := false;
 if dific<>0 then if dific<>p1.Dificulty then Result := false;
 if CategoryFull(p1.category) then Result:=false;
 p1.free;
end;

begin
 TSTFilename :=s;
 getdir(0,ps);Path:=ps;

 ts := TStringList.Create;
 ts.LoadFromFile(s);         // Incarca fisierul cu definitia problemei in ts
                             // {**} Sa verific daca exista fisierul

 for i:=0 to ts.count-1 do
 if ts[i]<>'' then
  begin
    ts2 := TStringList.Create;
    BreakString(ts[i],ts2);

    if ts2[0]='.random' then NrPbRandom:=strtoint(ts2[1])      // {**} Sa verific daca ts2[1] este numar intreg
    else if ts2[0]='.testname' then
        if ts2.count>1 then TestName:=ts2[1] else TestName:=''
    else if ts2[0]='.domain' then
        begin
          if ts2.count>1 then Domain.ShortName:=ts2[1] else Domain.ShortName:='Div';
          if ts2.count>2 then Domain.LongName:=ts2[2] else Domain.LongName:=Domain.ShortName;
        end
    else if ts2[0]='.time' then Time:=strtoint(ts2[1])
    else if ts2[0]='.dificulty' then Dificulty:=strtoint(ts2[1])
    else if ts2[0]='.author' then
        if ts2.count>1 then Author:=ts2[1] else Author:=''
    else if ts2[0]='.path' then
        if ts2.count>1 then begin
                              Path:=ExtractFilePath(TSTFilename)+ts2[1];
                              chdir(path);
                              if IOResult <> 0 then MessageDlg('Director inexistent !', mtWarning, [mbOk], 0);
                            end
                       else begin
                              getdir(0,ps);
                              Path:=ps;
                              chdir(path);
                              if IOResult <> 0 then MessageDlg('Director inexistent !', mtWarning, [mbOk], 0);
                            end
    else if ts2[0]='.category' then
        begin
          inc(NrCateg);
          categories[NrCateg].category:=ts2[1];
          categories[NrCateg].howmax:=strtoint(ts2[2]);
        end
    else if (ts2[0]='.problem')and(not IsPbInTest(ts2[1])) then
        begin
         inc(NrProblems);
         Problems[NrProblems] := TProblem.Create(LowerCase(path+'\'+ExtractFileName(ts2[1])));
         Problems[NrProblems].LoadDescriptions;
        end;

    ts2.free;
  end;
 ts.Free;


 // Pune toate problemele din director intr-o lista
 NrPbInDir:=0;
 ts := TStringList.Create;
 Found := FindFirst('*.pb', faReadOnly+faArchive, sr);
 while (Found = 0) do
   begin
      if not IsPbInTest(LowerCase(sr.name)) then
         begin
           inc(NrPbInDir);
           ts.Add(path+'\'+sr.name);
         end;
      Found := FindNext(SR);
   end;
 FindClose(SR);


 if NrPbInDir>0 then begin

 randomize;
 for i:=0 to NrPbInDir-1 do
  repeat
   a[i]:=trunc(random(NrPbInDir));
   next:=true;
   for j:=0 to i-1 do if a[j]=a[i] then next:=false;
  until next;


 // Amesteca lista cu problemele din director
 ts2 := TStringList.Create;
 for i:=0 to NrPbInDir-1 do ts2.add(ts[a[i]]);
 ts.free;


 next:=false;
 NrProblemeGasite:=0;i:=0;
 if NrPbRandom>0 then
 repeat
   if SePotriveste(ts2[i],Author,Dificulty) then
     begin
       inc(NrProblems);inc(NrProblemeGasite);
       Problems[NrProblems] := TProblem.Create(LowerCase(ExtractFileName(ts2[i])));
       Problems[NrProblems].LoadDescriptions;
     end;
   inc(i);
   if (NrProblemeGasite=NrPbRandom) or (i=NrPbInDir) then next:=true;
 until next;
 ts2.free;

 NrPbRandomSolicitate:=NrPbRandom;
 if NrProblemeGasite<NrPbRandom then NrPbRandom:=NrProblemeGasite;


 end
 else NrPbRandom:=0;

 for i:=1 to NrProblems do inc(Puncte,Problems[i].Puncte);

end;


Procedure TTest.FreeProblems;
var i:integer;
begin
 for i:=1 to NrProblems do
   if Problems[i]<>nil then
      begin
        Problems[i].Free;
        Problems[i]:=nil
      end;
end;

Procedure TTest.Free;
begin
 FreeProblems;
end;

Procedure TTest.ClearUserAnswers;
var i,j:integer;
begin
 for i:=1 to nrproblems do
   for j:=1 to problems[i].nranswers do
     if problems[i].answertype=0 then problems[i].useranswers[j]:='0'
     else if problems[i].answertype=2 then problems[i].useranswers[j]:=''
     else if problems[i].answertype=1 then problems[i].useranswers[j]:='-1';
end;



end.

