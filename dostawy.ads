package Dostawy is

   type Rodzaje_towaru is (Towar1, Towar2, Towar3);

   type Dane_Dostawy is record
      Id : Integer;
      Znak_Transportu : Character;
      Towar : Rodzaje_towaru;
      Ilosc : Integer;
   end record;

   task type Dostawa(Znak_Transportu : Character);
   Dostawa_1 : Dostawa('A');
   Dostawa_2 : Dostawa('B');
   Dostawa_3: Dostawa('C');

end Dostawy;