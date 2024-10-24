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
   songs[1].author := 'Artist A';
   songs[1].name := 'Rock Balad';
   songs[1].genre := 'rock';
   songs[1].year := 2020;
   songs[1].month := 6;
   songs[1].length := 210;

   songs[2].author := 'Artist B';
   songs[2].name := 'Jazz Nights';
   songs[2].genre := 'jazz';
   songs[2].year := 2019;
   songs[2].month := 5;
   songs[2].length := 300;

   songs[3].author := 'Artist C';
   songs[3].name := 'Back in Black';
   songs[3].genre := 'rock';
   songs[3].year := 2021;
   songs[3].month := 8;
   songs[3].length := 240;

   songs[4].author := 'Artist D';
   songs[4].name := 'Disco Fever';
   songs[4].genre := 'disco';
   songs[4].year := 1979;
   songs[4].month := 11;
   songs[4].length := 180;

   A();
   B();
end.


