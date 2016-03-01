PROGRAM BINTREEDEMO;
TYPE
Tree = ^TreeNode;
TreeNode = RECORD
	weight : Integer;
	count : Integer;
	left : Tree;
	right : Tree
END;

VAR root : Tree;
VAR tn : Tree;
VAR gw : Integer;

PROCEDURE MkTreeNode(w : Integer; VAR t : Tree);
VAR pp : Tree;
BEGIN
	New(pp);
	WITH pp^ DO
	BEGIN
		weight := w;
		count := 1;
		left := NIL;
		right := NIL
	END;
	t := pp
END;

(* insert new node n to the binary search tree specified by t. *)
PROCEDURE InsertNode(n : Tree; VAR t : Tree);
VAR tw : Integer;
BEGIN
	IF t <> NIL THEN
	BEGIN
		tw := t^.weight;
		IF tw = n^.weight THEN
		BEGIN
			Inc(t^.count);
			Dispose(n)
		END
		ELSE
			IF tw > n^.weight THEN
				InsertNode(n, t^.left)
			ELSE
				InsertNode(n, t^.right);
	END
	ELSE
		t := n;
END;

PROCEDURE PrintTree(indent : String; l : Integer; t : Tree);
BEGIN
	IF t <> NIL THEN
	BEGIN
		Writeln(indent, 'weight: ', t^.weight, ' count: ', t^.count, ' @ line: ', l);
		PrintTree(indent, l+1, t^.left);
		PrintTree(indent + indent, l+1, t^.right)
	END
END;

BEGIN
	root := NIL;
	tn := NIL;
	gw := 4;
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 2;
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 3;
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 5;
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 2;
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	PrintTree('	', 1, root)
END.
