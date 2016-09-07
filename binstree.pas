program BINTREEDEMO;
type
Tree = ^TreeNode;
TreeNode = record
  weight : integer;
  count : integer;
  left : Tree;
  right : Tree
end;

var root : Tree;
var tn : Tree;
var gw, trh : integer;

procedure MkTreeNode(w : integer; var t : Tree);
var pp : Tree;
begin
  new(pp);
  with pp^ do
  begin
    weight := w;
    count := 1;
    left := nil;
    right := nil
  end;
  t := pp
end;

(* insert new node n to the binary search tree specified by t. *)
procedure InsertNode(n : Tree; var t : Tree);
var tw : integer;
begin
  if t <> nil then
  begin
    tw := t^.weight;
    if tw = n^.weight then
    begin
      inc(t^.count);
      dispose(n)
    end
    else
      if tw > n^.weight then
        InsertNode(n, t^.left)
      else
        InsertNode(n, t^.right);
  end
  else
    t := n;
end;

function TreeHeight(rt : Tree) : integer;
var lh, rh, hh : integer;
begin
  if rt = nil then
    hh := 0
  else
  begin
    lh := TreeHeight(rt^.left);
    rh := TreeHeight(rt^.right);
    if lh >= rh then
      hh := 1 + lh
    else
      hh := 1 + rh
  end;
  TreeHeight := hh
end;

procedure PrintTree(indent : string; l : integer; t : Tree);
begin
  if t <> nil then
  begin
    writeln(indent, 'weight: ', t^.weight, ' count: ', t^.count, ' @ line: ', l);
    PrintTree(indent, l+1, t^.left);
    PrintTree(indent + indent, l+1, t^.right)
  end
end;

begin
  root := nil;
  tn := nil;
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
  PrintTree('  ', 1, root);
  trh := TreeHeight(root);
  writeln('height of the tree: ', trh)
end.
