UNIT squeue;

INTERFACE

USES deftypes;
PROCEDURE InitQueue(VAR q : Queue);
PROCEDURE EnQueue(VAR tn : Tree; q : Queue);
PROCEDURE DeQueue(VAR q : Queue; tn : Tree);
FUNCTION IsQueueEmpty(VAR q : Queue) : Boolean;

IMPLEMENTATION

PROCEDURE InitQueue(VAR q : Queue);
BEGIN
    WITH q DO
    BEGIN
        front := NIL;
        backend := NIL;
        size := 0
    END
END;

FUNCTION IsQueueEmpty(VAR q : Queue) : Boolean;
BEGIN
    IsQueueEmpty := (q.size = 0);
END;

PROCEDURE EnQueue(VAR tn : Tree; q : Queue);
VAR p, t : ElemPtr;
BEGIN
    p := NIL;
    New(p);
    IF Assigned(p) THEN
    BEGIN
        p^.tr := tn;
        p^.next := NIL
    END
    ELSE
    BEGIN
        Writeln('Memory Allocation Failed! Halting...');
        Halt()
    END;
    IF (q.front = NIL) AND (q.backend = NIL) THEN
    BEGIN
        q.front := p;
        q.backend := p;		(* enter an empty queue *)
    END
    ELSE
    BEGIN
        t := q.backend;
        t^.next := p;
        q.backend := p;
    END;
    Inc(q.size)
END;

PROCEDURE DeQueue(VAR q : Queue; tn : Tree);
VAR p : ElemPtr;
BEGIN
    IF (q.front = NIL) AND (q.backend = NIL) THEN
        tn := NIL
    ELSE
    BEGIN
        tn := (q.front)^.tr;
        IF q.size = 1 THEN
        BEGIN						(* pop the only element from the queue *)
            q.front := NIL;
            q.backend := NIL
        END
        ELSE
        BEGIN
            p := (q.front)^.next;
            q.front := p
        END;
        Dec(q.size)
    END
END;

END.

