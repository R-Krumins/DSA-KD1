program task2;
uses crt;

const
   SONG_COUNT = 10;
type
   Song = record
      author : string;
      name : string;
      genre : string;
      year : integer;
      month : integer;
      length : integer; { in seconds }
   end;
var
   songs : array[1..SONG_COUNT] of Song;

procedure A();
var
   count: integer = 0;
   i : integer;
   genre: string = 'rock';
begin
   for i := 1 to SONG_COUNT do
      if songs[i].genre = genre then
         count := count + 1;
   writeln('Count is: ', count);
end;

procedure B();
var
   minYear: integer = 2021;
   i : integer;
begin
   for i := 1 to SONG_COUNT do
      if songs[i].year >= minYear then
      begin
         writeln('Song: ', songs[i].name, ' by ', songs[i].author);
         writeln('Realeased in ', songs[i].year);
         writeln();
      end;
end;
begin
   A();
   B();
end.


