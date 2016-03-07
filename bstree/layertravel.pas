PROGRAM LAYERTRAVEL(INPUT, OUTPUT);

USES deftypes, squeue, bintree;

VAR root, tn : Tree;
VAR gw : String;
VAR gq : Queue;
VAR i : Integer;

BEGIN
	root := NIL;
	tn := NIL;
    i := 0;
    InitQueue(gq);
    Writeln('Is global queue empty? ', IsQueueEmpty(gq));
	gw := 'Hello';
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 'World';
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 'Erlang';
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 'ModuleProgramming';
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	gw := 'Erlang';
	MkTreeNode(gw, tn);
	InsertNode(tn, root);
	PrintTree('	', 1, root);
    EnQueue(root, gq);
    Writeln('global queue size: ', gq.size);
    WHILE NOT IsQueueEmpty(gq) DO
    BEGIN
        DeQueue(gq, tn);
        Inc(i);
        Writeln('node ', i, ': ', tn^.desc);
        IF tn^.left <> NIL THEN
            EnQueue(tn^.left, gq);
        IF tn^.right <> NIL THEN
            EnQueue(tn^.right, gq);
    END;
END.
