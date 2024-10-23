program task5;
{$mode objfpc}{$m+}{$h+}

type
   pInteger = ^integer;
   pNode = ^Node;

   Node = record
      value: integer;
      next: pNode;
   end;


   LinkedList = class
   private
      head: pNode;
      size: integer;
   public
      constructor Create();
      procedure append(value: integer);
      procedure appendAll(ll: LinkedList); 
      procedure print();
   end;

constructor LinkedList.Create();
begin
   head := nil;
   size := 0;
end;

procedure LinkedList.print();
var
   pTrav: pNode;
begin
   pTrav := head; 
   while pTrav^.next <> nil do
   begin
      writeln(pTrav^.value);
      pTrav := pTrav^.next;
   end;
end;

procedure LinkedList.append(value: integer);
var
   pNewNode: pNode;
   pTrav: pNode;
begin
   New(pNewNode);
   pNewNode^.value := value;
   pNewNode^.next := nil;

   if head = nil then
   begin
      head := pNewNode;
      exit;
   end;
   
   pTrav := head; 
   while pTrav^.next <> nil do
     pTrav := pTrav^.next; 

   pTrav^.next := pNewNode;
   size := size + 1;
end;

procedure LinkedList.appendAll(ll: LinkedList);
var
   tail: pNode;
begin
   tail := head; 
   while tail^.next <> nil do
     tail := tail^.next; 
   tail^.next := ll.head;
end;

var
   ll1: LinkedList;
   ll2: LinkedList;
begin
   ll1 := LinkedList.Create();
   ll1.append(1);
   ll1.append(2);
   ll1.append(3);

   ll2 := LinkedList.Create();
   ll2.append(4);
   ll2.append(5);
   ll2.append(6);

   ll1.appendAll(ll2);
   ll1.print();
end.
      
