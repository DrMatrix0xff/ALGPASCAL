program Hanoi;

type TaskDesc = record
    n : integer;
    a : char;
    b : char;
    c : char
end;

var stack : array [1..256] of TaskDesc;
var sp : 0..256;

procedure HanoiMove(scale : integer; start, aux, target : char);

var t : TaskDesc;
var t1 : TaskDesc;

begin
    sp := 0;
    with t do begin
        n := scale; a := start; b := aux; c := target
    end;
    inc(sp);
    stack[sp] := t;
    while sp >= 1 do begin
        t := stack[sp];
        dec(sp);
        (* dec(sp); *)
        if t.n <= 1 then begin
            writeln(t.a, ' --> ', t.c)
        end
        else begin
            t1.n := t.n - 1; t1.a := t.b; t1.b := t.a; t1.c := t.c;
            inc(sp);
            stack[sp] := t1;

            t1.n := 1; t1.a := t.a; t1.b := t.b; t1.c := t.c;
            inc(sp);
            stack[sp] := t1;

            t1.n := t.n - 1; t1.a := t.a; t1.b := t.c; t1.c := t.b;
            inc(sp);
            stack[sp] := t1
        end;
    end;
end;

BEGIN

HanoiMove(12, 'A', 'B', 'C');

END.
