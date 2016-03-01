PROGRAM SqureRoot;
VAR number : Real;
VAR rt : Real;
(*
PROCEDURE SqrtKit(r : Real);
VAR precision : Real;
VAR x : Real;
VAR y : Real;
VAR enough : Boolean;
VAR loopcnt : Integer;
BEGIN
   precision := 1E-12;
   x := 1.0;
   enough := false;
   loopcnt := 0;
   WHILE NOT enough DO
   BEGIN
      y := r / x;
      x := (x + y) / 2.0;
      WriteLn('trace of x: ', x);
      enough := Abs(x*x - r) <= precision;
      INC(loopcnt)
   END;
   WriteLn('the square root of ', r, ' is: ', x);
   WriteLn('loop count is: ', loopcnt);
END;
*)
FUNCTION BinSqrt(r : Real) : Real;
CONST precision = 1E-15;
VAR lb, ub : Real;
VAR x, z : Real;
VAR y : Integer;
BEGIN
    y := 0;
    WHILE (y * y < r) DO
        Inc(y);
    lb := 1.0 * (y - 1);
    ub := 1.0 * y;
    y := 0;
    REPEAT
        z := (lb + ub) / 2;
        x := z*z - r;
        IF x > 0 THEN
            ub := z
        ELSE
            lb := z;
        Inc(y)
    UNTIL Abs(x) < precision;
    Writeln('loop count: ', y);
    BinSqrt := z
END;

BEGIN
   number := 7.91;
   rt := BinSqrt(number);
   WriteLn('Result of binary sqrt procedure: ', rt);
   WriteLn('Result of builtin sqrt procedure: ', Sqrt(number))
END.
