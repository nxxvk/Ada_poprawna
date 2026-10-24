package const is

-- Moduł H -> ile sekund samochód oczekuje na wolne stanowisko
   Max_czas_na_stanowisko : constant Duration := 10.0;

-- Czas rozladunku jednej sztuki towaru
   Czas_rozladunku_sztuki : constant Float := 0.1;

-- Moduł 2 -> ile sekund zajmuje robotowi dojechanie ze stanowiska 
   Czas_Przejazdu_Robota : constant Duration := 10.0;

-- Moduł D -> Ile sekund trwa naprawa zepsutego robota
   Czas_Naprawy_Robota : constant Duration := 3.0;

-- Moduł D -> Szansa na awarię (liczba 5 = szansa 1/5)
   Zakres_Losowania_Awarii : constant Integer := 5;

-- Moduł G -> co ile sekund raport
   Czas_Raport : constant Duration := 5.0;

-- Zakres czasu przerwy między dostawami jednego samochodu
   Min_Przerwa_Dostawy : constant Integer := 5;
   Max_Przerwa_Dostawy : constant Integer := 20;

-- Zakres liczby sztuk towaru w dostawie
   Min_sztuk_towaru : constant Integer := 1;
   Max_sztuk_towaru : constant Integer := 30;
end const;