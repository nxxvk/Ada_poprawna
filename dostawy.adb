with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with rozladunki;
with const;

package body Dostawy is

   task body Dostawa is
      
      subtype Zakres_Przerwy is Integer range const.Min_Przerwa_Dostawy  .. const.Max_Przerwa_Dostawy;
      package Losowanie_Przerwy is new Ada.Numerics.Discrete_Random(Zakres_Przerwy);
      Gen_Przerwy : Losowanie_Przerwy.Generator;
      
      package Losowanie_Towaru is new Ada.Numerics.Discrete_Random(Rodzaje_Towaru); 
      Gen_Towaru : Losowanie_Towaru.Generator;

      subtype Zakres_Ilosci is Integer range const.Min_sztuk_towaru .. const.Max_sztuk_towaru;
      package Losowanie_Ilosci is new Ada.Numerics.Discrete_Random(Zakres_Ilosci);
      Gen_Ilosci : Losowanie_Ilosci.Generator;

      Czas_Przerwy : Zakres_Przerwy;
      Id : Integer := 1;
      Dostawa_Aktualna : Dane_Dostawy;
   begin
      Losowanie_Przerwy.Reset(Gen_Przerwy);
      Losowanie_Towaru.Reset(Gen_Towaru);
      Losowanie_Ilosci.Reset(Gen_Ilosci);

      loop
         Dostawa_Aktualna.Id := Id;
         Dostawa_Aktualna.Znak_Transportu := Znak_Transportu;
         Dostawa_Aktualna.Ilosc := Losowanie_Ilosci.Random(Gen_Ilosci);
         Dostawa_Aktualna.Towar := Losowanie_Towaru.Random(Gen_Towaru);
         Czas_Przerwy := Losowanie_Przerwy.Random(Gen_Przerwy);
         delay Duration(Czas_Przerwy);
         Put_Line("[DOSTAWA] Przyjechala dostawa " & Znak_Transportu & Integer'Image(Id));
         select
            Rozladunki.Stanowisko_1.Przyjmij_Dostawe(Dostawa_Aktualna);
         or
            delay const.Max_czas_na_stanowisko;
            Put_Line("[DOSTAWA] Pojazd " & Znak_Transportu & Integer'Image(Id) & " zrezygnowal z oczekiwania i odjechal!");
         end select;
         Id := Id +1;
      end loop;
   end Dostawa;

end Dostawy;