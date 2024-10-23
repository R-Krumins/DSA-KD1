program task1;
uses crt;

const
   M_SIZE = 10;
   SMALLESTS_SIZE = 3;
type
   Numbs = record
      value : integer;
      indexInM : integer;
   end;
var
   M : array[1..M_SIZE] of integer;
   smallests : array[1..SMALLESTS_SIZE] of Numbs;
   i, j, k : integer;

procedure findSmallests();
begin
   { copy M first elements to smallests}
   for i := 1 to SMALLESTS_SIZE do
   begin
      smallests[i].value := M[i];
      smallests[i].indexInM := i;
   end;

   { find smallest numbers }
   for i := SMALLESTS_SIZE to M_SIZE do
   begin
      k := 1;
      { find the largest among the smallest numbers }
      for j := 1 to SMALLESTS_SIZE do
         if smallests[j].value > smallests[k].value then
            k := j;

      { check if current M numb is smaller that largest small}
      for j := 1 to SMALLESTS_SIZE do
         if M[i] < smallests[k].value then
         begin
            smallests[j].value := M[i];
            smallests[j].indexInM := i;
            break;
         end;
   end;
end;

procedure findSmallests();
begin
   
   k := 1;
   for i := SMALLESTS_SIZE to M_SIZE do
   begin
      for j := 1 to SMALLESTS_SIZE do
         if M[i] < smallests[k] then
         begin
            smallests[k].value = M[i]   
            smallests[k].indexInM := i;
         end;

   end;
end;

procedure printResult();
begin
   writeln('Numbers in M:');
   for i := 1 to M_SIZE do
   begin
      write(M[i], ', ');
   end;
   writeln();
   writeln('Smallests numbers of M:');
   for i := 1 to SMALLESTS_SIZE do
   begin
      writeln(smallests[i].value, ' in pos ', smallests[i].indexInM);
   end;
end;
begin
   { init M with random values }
   randomize;
   for i := 1 to M_SIZE do
   begin
      M[i] := random(100);
   end;
   findSmallests;
   printResult;
end. 
