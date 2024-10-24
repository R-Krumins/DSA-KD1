program task6;
{$mode objfpc}{$m+}{$h+}
uses math, sysutils;

type
   pNode = ^Node;
   input = array[0..9] of char;

   obj = record
      whole: integer;
      decimal: real;
      inp: input;
   end;

   Node = record
      value: obj;
      next: pNode;
      prev: pNode;
   end;

   DoubleLinkedList = class
   private
      head: pNode;
      size: integer;
   public
      constructor Create();
      procedure append(_value: obj);
      function getTail(): pNode;
      procedure print();
   end;

var
   myList: DoubleLinkedList;

constructor DoubleLinkedList.Create();
begin
   head := nil;
   size := 0;
end;

procedure DoubleLinkedList.print();
var
   pTrav: pNode;
begin
   pTrav := head; 
   while pTrav^.next <> nil do
   begin
      writeln(pTrav^.value.whole, ' ',
      FormatFloat('0.000', pTrav^.value.decimal), ' ',
      pTrav^.value.inp);

      pTrav := pTrav^.next;
   end;
end;

function DoubleLinkedList.getTail(): pNode;
var
   pTrav: pNode;
begin
   pTrav := head; 
   while pTrav^.next <> nil do
     pTrav := pTrav^.next; 
   getTail := pTrav;
end;

procedure DoubleLinkedList.append(_value: obj);
var
   pNewNode: pNode;
   pTrav: pNode;
begin
   New(pNewNode);
   pNewNode^.value := _value;
   pNewNode^.next := nil;
   pNewNode^.prev := nil;

   if head = nil then
   begin
      head := pNewNode;
      exit;
   end;
   
   pTrav := head; 
   while pTrav^.next <> nil do
     pTrav := pTrav^.next; 

   pNewNode^.prev := pTrav;
   pTrav^.next := pNewNode;
   size := size + 1;
end;

procedure populateMyList(m: integer; a1: real; a2: real; inp: input);
var
   obj1, obj2, objM: obj;
   aM: real;
   prev, prevPrev: obj;
begin
   obj1.whole := trunc(a1);
   obj1.decimal := frac(a1);
   obj1.inp := inp;

   obj2.whole := trunc(a2);
   obj2.decimal := frac(a2);
   obj2.inp := inp;

   myList.append(obj1);
   myList.append(obj2);

   while m <> 0 do
   begin
      prev := myList.getTail()^.value;
      prevPrev := myList.getTail()^.prev^.value;
      a1 := prev.whole + prev.decimal;  
      a2 := prevPrev.whole + prevPrev.decimal;  
      aM := a1 + a2;

      objM.whole := trunc(aM);
      objM.decimal := frac(aM);
      objM.inp := inp;

      myList.append(objM);
      m := m - 1; 
   end;
end;

begin
   myList := DoubleLinkedList.Create();
   populateMyList(10, 1.112, 2.69, 'hello');
   myList.print();
end.

