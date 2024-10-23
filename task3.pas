program task3;
{$mode objfpc}{$m+}
uses crt;

type
   Stack = class
private
   capacity: integer;
   currentIndex: integer;
   arr: array of integer;
public
   constructor init(_capacity: integer);
   procedure add(e: integer);
   function pop(): integer;
   function peak(): integer;
   function getCapacity(): integer;
end;

procedure Stack.add(e: integer);
begin
   if currentIndex + 1 >= capacity then
   begin
      writeln('Stack capacity exceeded!');
      exit;
   end;

   currentIndex := currentIndex + 1;
   arr[currentIndex] := e;
end;

constructor Stack.init(_capacity: integer);
begin
   capacity := _capacity;
   SetLength(arr, capacity);
   currentIndex := -1;
end;

function Stack.pop(): integer;
begin
   if currentIndex < 0 then
   begin
      writeln('Attempted to pop a empty stack');
      exit(-1);
   end;
   pop := arr[currentIndex];
   currentIndex := currentIndex - 1;
end;

function Stack.peak(): integer;
begin
   if currentIndex < 0 then
      exit(-1);
   peak := arr[currentIndex];
end;

function Stack.getCapacity(): integer;
begin
   getCapacity := capacity;
end;

var
   myStack: Stack;
   i: integer;
   a: integer;
begin
   myStack := Stack.init(30);
   myStack.add(3);
   writeln('cap: ', myStack.getCapacity());
   { populate stack }
   for i := 1 to myStack.getCapacity()-1 do
   begin
      a := myStack.peak();
      myStack.add(a+a);
   end;

   { find even numbers}
   for i := 0 to myStack.getCapacity()-1 do
   begin
      a := myStack.pop();
      if a mod 2 = 0 then
         writeln(a);
   end;
end.
