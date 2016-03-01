PROGRAM LangBase;
TYPE Point2d = RECORD
	x, y : Integer
END;
VAR b : Boolean;
VAR s : String;
VAR i : Integer;
VAR f : Real;
VAR distance : Real;
VAR p1, p2 : Point2d;
VAR sp : ^String;
VAR pp : ^Point2d;
VAR ww : ^Word;
VAR aa : Array [0..9] OF Integer;

BEGIN
	b := TRUE;
	s := 'hello';
	sp := @s;
	i := 3;
	f := 1.2e-3;
	Writeln(NOT b);
	Writeln('i == 3: ', i = 3);
	Writeln('i shl 3: ', i SHL 3);
	Writeln('f >= 0.0012?: ', f >= 0.0012);
	Writeln('f + i: ', f + i);
	Writeln('s == '#39'hello'#39'?: ', s = 'hello');
	Writeln('Abs(-3*3): ', Abs(-3*3));
	Writeln('====================================');
	sp^ := 'hello world';
	Writeln('s = ', s);
	New(sp);
	IF NOT Assigned(sp) THEN
		Writeln('Error: Memory Allocation')
	ELSE
		sp^ := 'dynamic Hello world';
	Writeln('new value referred by sp: ', sp^);
	Dispose(sp);
	New(pp);
	IF NOT Assigned(pp) THEN
		Writeln('Error: Memory Allocation')
	ELSE
		ww := Addr(pp);
		Writeln('Address of pp: ', ww^);
		WITH pp^ DO
		BEGIN
			x := 99;
			y := 100
		END;
	Writeln('x coordinate: ', pp^.x, ', y coordinate: ', pp^.y);
	Dispose(pp);
	p1.x := 0;
	p1.y := 0;
	p2.x := 3;
	p2.y := 4;
	distance := Sqrt((p2.x-p1.x)*(p2.x-p1.x)+(p2.y-p1.y)*(p2.y-p1.y));
	Writeln('The distance of p1 and p2 = ', distance);
	FOR i := 0 TO 9 DO
		aa[i] := i * i;
	FOR i := 0 TO 9 DO
		Writeln(aa[i]);
END.
