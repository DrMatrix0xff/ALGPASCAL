PROGRAM SLISTDEMO;
TYPE
Nodeptr = ^Listnode;
Listnode = RECORD
	data : Integer;
	next : Nodeptr
END;

VAR Slhead : Nodeptr;
VAR Nd : Nodeptr;
VAR ind : Integer;

FUNCTION MkListnode(d : Integer) : Nodeptr;
VAR np : Nodeptr;
BEGIN
	New(np);
	IF NOT Assigned(np) THEN
	BEGIN
		np := NIL;
		Writeln('Memory Allocation Error!')
	END
	ELSE
		WITH np^ DO
		BEGIN
			data := d;
			next := NIL
		END;
	MkListnode := np
END;

{
PROCEDURE AddSlist(node : Nodeptr; VAR head : Nodeptr);
VAR Visitor : Nodeptr;
BEGIN

	// Visitor := head;
	// WHILE Visitor <> NIL DO
	// BEGIN
	//	 Visitor := Visitor^.next
	// END;
	// Visitor := node

	IF head = NIL THEN
		head := node
	ELSE
	BEGIN
		Visitor := head;
		WHILE Visitor^.next <> NIL DO
		BEGIN
			Visitor := Visitor^.next
		END;
		Visitor^.next := node
	END
END;
}

PROCEDURE AddSlist(node : Nodeptr; VAR head : Nodeptr);
VAR Visitor : ^Nodeptr;
(* VAR aux : Nodeptr; *)
BEGIN
	Visitor := @head;
	WHILE NOT (Visitor^ = NIL) DO
	BEGIN
		Visitor := @((Visitor^)^.next);
	END;
	Visitor^ := node
END;


BEGIN
	Slhead := NIL;
	ind := 1;
	WHILE ind < 100 DO
	BEGIN
		Nd := MkListnode(ind);
		AddSlist(Nd, Slhead);
		ind := ind + 4
	END;
	Nd := Slhead;
	ind := 0;
	WHILE NOT (Nd = NIL) DO
	BEGIN
		Writeln('data field of node ', ind, ': ', Nd^.data);
		Nd := Nd^.next;
		Inc(ind)
	END;
END.
