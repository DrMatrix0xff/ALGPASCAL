PROGRAM Ontty;
VAR FILENAME : String = #46#46#47'msresume.html';

VAR LineCount : Integer;
PROCEDURE PrintFile(inputFile : String);
VAR R : Text;
VAR l : String;
BEGIN
    LineCount := 0;
    Assign(R, inputFile);
    Reset(R);
    WHILE NOT Eof(R) DO
        BEGIN
            Readln(R, l);
            Inc(LineCount);
            Writeln(l)
        END;
    Close(R)
END;

BEGIN
    PrintFile(FILENAME);
    Writeln('There is ', LineCount, ' lines all.')
END.
