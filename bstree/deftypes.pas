UNIT deftypes;
INTERFACE

TYPE
Tree = ^TreeNode;
TreeNode = RECORD
    desc : String;
    count : Integer;
    left : Tree;
    right : Tree
END;

ElemPtr = ^ListElem;
ListElem = RECORD
    tr : Tree;
    next : ElemPtr
END;

Queue = RECORD
    front : ElemPtr;
    backend : ElemPtr;
    size : Integer
END;

IMPLEMENTATION
(* *)

END.
