with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Rozladunki;
with Magazyn;
with Dostawy;
with const;
with Kontroler;

package body Robot is
   task body R is
      Aktualny_Towar : Dostawy.Rodzaje_towaru;
      Aktualna_Ilosc : Integer;
      
      subtype Szansa_Awarii is Integer range 1 .. const.Zakres_Losowania_Awarii;
      package Losowanie_Awarii is new Ada.Numerics.Discrete_Random(Szansa_Awarii);
      Gen_Awarii : Losowanie_Awarii.Generator;
   begin
      Losowanie_Awarii.Reset(Gen_Awarii);
      loop
         Kontroler.Monitor.Aktualizuj_Stan_Robota(Id, Kontroler.Wolny);
         Rozladunki.Stanowisko_1.Wydaj_Towar(Aktualny_Towar, Aktualna_Ilosc);
         Put_Line("[ROBOT] R" & Integer'Image(Id) & " otrzymal" & Integer'Image(Aktualna_Ilosc) & " szt. " & Dostawy.Rodzaje_towaru'Image(Aktualny_Towar));

         Kontroler.Monitor.Aktualizuj_Stan_Robota(Id, Kontroler.W_Trasie);
         Put_Line("[ROBOT] R" & Integer'Image(Id) & " jedzie do magazynu...");
         
         
         if Losowanie_Awarii.Random(Gen_Awarii) = 1 then
            Kontroler.Monitor.Aktualizuj_Stan_Robota(Id, Kontroler.Naprawa);
            Put_Line("[ROBOT] R" & Integer'Image(Id) & " ulegl AWARII! Oczekuje na naprawe...");
            delay const.Czas_Naprawy_Robota;
            Put_Line("[ROBOT] R" & Integer'Image(Id) & " zostal naprawiony. Kontynuuje trase.");
            Kontroler.Monitor.Aktualizuj_Stan_Robota(Id, Kontroler.W_Trasie);
         end if;

         delay const.Czas_Przejazdu_Robota;
         Magazyn.Magazyn_Glowny.Przyjmij_Towar(Aktualny_Towar, Aktualna_Ilosc);
         Kontroler.Monitor.Zglos_Dostawe;
         Put_Line("[ROBOT] R" & Integer'Image(Id) & " dostarczyl towar i jest ponownie wolny.");
      end loop;
   end R;
end Robot;