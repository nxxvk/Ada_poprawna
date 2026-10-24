with Ada.Text_IO;
use Ada.Text_IO;
with Dostawy;
with const;

package body Rozladunki is 
   task body Rozladunek is
      Aktualny_Towar : Dostawy.Rodzaje_towaru;
      Aktualna_Ilosc : Integer;
      Aktualne_Id : Integer;
      Aktualny_Znak : Character;
      Czy_Towar_Na_Stanowisku : Boolean := False;
   begin
      loop
         select
            when not Czy_Towar_Na_Stanowisku =>
               accept Przyjmij_Dostawe(Dostawa : in Dostawy.Dane_Dostawy) do
                  Aktualne_Id := Dostawa.Id;
                  Aktualny_Znak := Dostawa.Znak_Transportu;
                  Aktualny_Towar := Dostawa.Towar;
                  Aktualna_Ilosc := Dostawa.Ilosc;
                  Put_Line("[STANOWISKO] Rozpoczeto rozladunek pojazdu " & Aktualny_Znak & Integer'Image(Aktualne_Id));
               end Przyjmij_Dostawe;

               delay Duration(Float(Aktualna_Ilosc) * const.Czas_rozladunku_sztuki);
               Put_Line("[STANOWISKO] Rozladunek " & Aktualny_Znak & Integer'Image(Aktualne_Id) & " zakonczony.");
               Czy_Towar_Na_Stanowisku := True;
         or
            when Czy_Towar_Na_Stanowisku =>
               accept Wydaj_Towar(Towar : out Dostawy.Rodzaje_towaru; Ilosc : out Integer) do
                  Towar := Aktualny_Towar;
                  Ilosc := Aktualna_Ilosc;
                  Put_Line("[STANOWISKO] Towar z pojazdu " & Aktualny_Znak & Integer'Image(Aktualne_Id) & " zostal przekazany robotowi.");
               end Wydaj_Towar;

               Czy_Towar_Na_Stanowisku := False;
         end select;
      end loop;
   end Rozladunek;
end Rozladunki;