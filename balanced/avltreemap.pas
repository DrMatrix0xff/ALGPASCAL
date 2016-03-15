UNIT avltreemap;

INTERFACE

TYPE
BalState = (left_heavy, balanced, right_heavy);
AvlTree = ^AvlNode;
AvlNode = RECORD
	key : String;
	value : Integer;
	left, right : AvlTree;
	bal : BalState
END;

PROCEDURE InsertAvlTree(k : String; v : Integer; VAR tr : AvlTree; VAR h : Boolean);
(* PROCEDURE PrintAvlTree(VAR tr : AvlTree); *)

IMPLEMENTATION

PROCEDURE MkAvlNode(k : String; v : Integer; VAR an : AvlNode);
BEGIN
	WITH an DO
	BEGIN
		key := k;
		value := v;
		left := NIL;
		right := NIL;
		bal := balanced
	END
END;

PROCEDURE InsertAvlTree(k : String; v : Integer; VAR tr : AvlTree; VAR h : Boolean);
VAR np, p, p1 : AvlTree;
VAR rk : String;
BEGIN
	p := NIL;
	p1 := NIL;
	np := NIL;
	New(np);
	IF NOT Assigned(np) THEN
	BEGIN
		Writeln('Memory Allocation Failed, Halting...');
		Halt()
	END;
	MkAvlNode(k, v, np^);
	IF tr = NIL THEN
	BEGIN
		tr := np;
		h := TRUE
	END
	ELSE
	BEGIN
		rk := tr^.key;
		IF k < rk THEN
		BEGIN
			InsertAvlTree(k, v, tr^.left, h);
			IF h THEN
				CASE tr^.bal OF
				right_heavy:
					BEGIN
						tr^.bal := balanced;
						h := FALSE
					END;
				balanced:
					tr^.bal := left_heavy;
				left_heavy:
					BEGIN
						p := tr^.left;
						IF p^.bal = left_heavy THEN
						BEGIN
							tr^.left := p^.right;		(* single LL rotation *)
							p^.right := tr;
							tr^.bal := balanced;
							tr := p
						END
						ELSE
						BEGIN
							(* double LR rotation *)
							p1 := p^.right;
							tr^.left := p1^.right;
							p1^.right := tr;
							p^.right := p1^.left;
							p1^.left := p;
							IF p1^.bal = left_heavy THEN
							BEGIN
								tr^.bal := right_heavy;
								p^.bal := balanced
							END
							ELSE
							BEGIN
								p^.bal := left_heavy;
								tr^.bal := balanced
							END;
							tr := p1
						END;
						tr^.bal := balanced;
						h := FALSE
					END
				END		(* CASE *)
		END
		ELSE
		BEGIN
			InsertAvlTree(k, v, tr^.right, h);
			IF h THEN
				CASE tr^.bal OF
				left_heavy:
					BEGIN
						tr^.bal := balanced;
						h := FALSE
					END;
				balanced:
					tr^.bal := right_heavy;
				right_heavy:
					BEGIN
						p := tr^.right;
						IF p^.bal = right_heavy THEN
						BEGIN
							tr^.right := p^.left;		(* single RR rotation *)
							p^.left := tr;
							tr^.bal := balanced;
							tr := p
						END
						ELSE
						BEGIN
							(* double RL rotation *)
							p1 := p^.left;
							tr^.right := p1^.left;
							p1^.left := tr;
							p^.left := p1^.right;
							p1^.right := p;
							IF p1^.bal = left_heavy THEN
							BEGIN
								p^.bal := right_heavy;
								tr^.bal := balanced
							END
							ELSE
							BEGIN
								tr^.bal := left_heavy;
								p^.bal := balanced
							END;
							tr := p1
						END;
						tr^.bal := balanced;
						h := FALSE
					END
				END		(* CASE *)
		END;
	END
END;

END.
