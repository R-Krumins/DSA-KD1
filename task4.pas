program task4;
{$mode objfpc}{$m+}{$h+}
uses math;

type
   Car = class
   public
      brand: string;
      mark: string;
      year: integer;
      constructor Create(_brand: string; _mark: string; _year: integer);
      function isEqual(other: Car): boolean;
      procedure print();
   end;

   mySet = class
   private
      capacity: integer;
      size: integer;
      arr: array of Car;
   public
      constructor Create(_capacity: integer);
      procedure add(newCar: Car);
      class function split(set1: mySet; set2: mySet): mySet; static;
      function getSize(): integer;
      function contains(aCar: Car): boolean;
      function get(index: integer): Car;
      procedure print();
   end;

constructor Car.Create(_brand: string; _mark: string; _year: integer);
begin
   brand := _brand;
   mark := _mark;
   year := _year;
end;

function Car.isEqual(other: Car): boolean;
begin
   isEqual := 
      (self.brand = other.brand) and
      (self.mark = other.mark) and
      (self.year = other.year);
end;

procedure Car.print();
begin
   writeln(brand, ' ', mark, ' ', year);
end;

constructor mySet.Create(_capacity: integer);
begin
   capacity := _capacity;
   size := 0;
   SetLength(arr, capacity);
end;

procedure mySet.add(newCar: Car);
var
   i: integer;
   exists: boolean = false;
begin
   if size >= capacity then
   begin
      writeln('Cannot add new car because set is full');
      exit;
   end;
   
   {* this coould be faster if the underlaying data structure was a 
   hahsmap and not a simple array, but i guesss its outside the scope of this task,
   maybe next time :) *}
   for i := 0 to size-1 do
      if arr[i].isEqual(newCar) then
      begin
         exists := true;
         break;
      end;

   if not exists then
   begin
      arr[size] := newCar; 
      size := size + 1;
   end;
end;

function mySet.getSize(): integer;
begin
   getSize := size;
end;

function mySet.contains(aCar: Car): boolean;
var
   i: integer;
begin
   for i := 0 to size-1 do
      if arr[i].isEqual(aCar) then
      begin
         contains := true;
         exit;
      end;
   contains := false;
end;

{ typicaly should not be used because order is guaranted in a set }
function mySet.get(index: integer): Car;
begin
   get := arr[index];
end;

procedure mySet.print();
var
   i: integer;
begin
   for i := 0 to size-1 do
      arr[i].print();
end;

{ the main part of the task, the split function }
class function mySet.split(set1: mySet; set2: mySet): mySet;
var
   set3: mySet;
   i: integer;
begin
   set3 := mySet.Create(Max(set1.getSize(), set2.getSize()));
   for i := 0 to set1.getSize()-1 do
      if set2.contains(set1.get(i)) then
         set3.add(set1.get(i));

   split := set3;
end;
   
var
   S1: mySet;
   S2: mySet;
   S3: mySet;
begin
   S1 := mySet.Create(5);
   S1.add(Car.Create('audi', 'A4', 2008));
   S1.add(Car.Create('bmw', 'X5', 2015));
   S1.add(Car.Create('mercedes', 'C200', 2020));
   S1.add(Car.Create('toyota', 'Camry', 2012));

   S2 := mySet.Create(5);
   S2.add(Car.Create('audi', 'A4', 2008));
   S2.add(Car.Create('bmw', 'X5', 2015));
   S2.add(Car.Create('tesla', 'Model S', 2019));
   S2.add(Car.Create('honda', 'Accord', 2010));
   
   S3 := mySet.split(S1, S2);
   S3.print();
end.

