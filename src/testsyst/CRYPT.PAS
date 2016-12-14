unit crypt;

interface

function Decrypt(const S: String; Key: Word): String;
function Encrypt(const S: String; Key: Word): String;

implementation

const
  C1 = 52845;   {Used for encryption of Master Password string}
  C2 = 11719;
  Key = 1234;

{ Standard Decryption algorithm - Copied from Borland}
function Decrypt(const S: String; Key: Word): String;
        var
          I: byte;
        begin
          Setlength(Result,Length(S));
          for I := 1 to Length(S) do begin
            Result[I] := char(byte(S[I]) xor (Key shr 8));
            Key := (byte(S[I]) + Key) * C1 + C2;
          end;
end;

{ Standard Encryption algorithm - Copied from Borland}
function Encrypt(const S: String; Key: Word): String;
        Var
          I: byte;
        begin
          Setlength(Result,Length(S));
          for I := 1 to Length(S) do begin
            Result[I] := char(byte(S[I]) xor (Key shr 8));
            Key := (byte(Result[I]) + Key) * C1 + C2;
          end;
end;


end.
