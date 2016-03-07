UNIT bintree;

INTERFACE

USES deftypes;

PROCEDURE MkTreeNode(w : String; VAR t : Tree);
PROCEDURE InsertNode(n : Tree; VAR t : Tree);
FUNCTION TreeHeight(VAR rt : Tree) : Integer;
PROCEDURE PrintTree(indent : String; l : Integer; t : Tree);

IMPLEMENTATION

PROCEDURE MkTreeNode(w : String; VAR t : Tree);
VAR pp : Tree;
BEGIN
	New(pp);
	WITH pp^ DO
	BEGIN
		desc := w;
		count := 1;
		left := NIL;
		right := NIL
	END;
	t := pp
END;

(* insert new node n to the binary search tree specified by t. *)
PROCEDURE InsertNode(n : Tree; VAR t : Tree);
VAR tw : String;
BEGIN
	IF t <> NIL THEN
	BEGIN
		tw := t^.desc;
		IF tw = n^.desc THEN
		BEGIN
			Inc(t^.count);
			Dispose(n)
		END
		ELSE
			IF tw > n^.desc THEN
				InsertNode(n, t^.left)
			ELSE
				InsertNode(n, t^.right);
	END
	ELSE
		t := n;
END;

FUNCTION TreeHeight(VAR rt : Tree) : Integer;
VAR lh, rh, hh : Integer;
BEGIN
    IF rt = NIL THEN
        hh := 0
    ELSE
    BEGIN
        lh := TreeHeight(rt^.left);
        rh := TreeHeight(rt^.right);
        IF lh >= rh THEN
            hh := 1 + lh
        ELSE
            hh := 1 + rh
    END;
    TreeHeight := hh
END;

PROCEDURE PrintTree(indent : String; l : Integer; t : Tree);
BEGIN
	IF t <> NIL THEN
	BEGIN
		Writeln(indent, 'description: ', t^.desc, ' count: ', t^.count, ' @ line: ', l);
		PrintTree(indent, l+1, t^.left);
		PrintTree(indent + indent, l+1, t^.right)
	END
END;

END.
