PROGRAM MAPDEMO;

USES avltreemap;
VAR root : AvlTree;
VAR gk : String;
VAR gi : Integer;
VAR flag : Boolean;

PROCEDURE PrintTree(indent : String; l : Integer; t : AvlTree);
BEGIN
	IF t <> NIL THEN
	BEGIN
		Writeln(indent, 'key: ', t^.key, ' value: ', t^.value, ' balance factor: ', t^.bal, ' @ line: ', l);
		PrintTree(indent, l+1, t^.left);
		PrintTree(indent + indent, l+1, t^.right)
	END
END;

BEGIN
    flag := TRUE;
    root := NIL;
    gk := 'python';
    gi := 85;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'hello';
    gi := 1989;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'fortran';
    gi := 10;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'erlang';
    gi := 90;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'emacs';
    gi := 64;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'elisp';
    gi := 40;
    InsertAvlTree(gk, gi, root, flag);
    gk := 'basic';
    gi := 20;
    InsertAvlTree(gk, gi, root, flag);
    PrintTree('  ', 1, root)
END.

