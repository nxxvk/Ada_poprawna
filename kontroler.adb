with Ada.Text_IO;
use Ada.Text_IO;
with Magazyn;
with Dostawy;
with const;

package body Kontroler is
   task body Monitor is
      type Stany_Robotow is array (1..2) of Typ_Stanu_Robota;
      Roboty : Stany_Robotow := (others => Wolny);
      Zakonczone_Dostawy : Integer := 0;
      Zapas : Magazyn.Stany_Magazynu;
   begin
      loop
         select
            accept Aktualizuj_Stan_Robota(Id : in Integer; Stan : in Typ_Stanu_Robota) do
               Roboty(Id) := Stan;
            end Aktualizuj_Stan_Robota;
         or
            accept Zglos_Dostawe do
               Zakonczone_Dostawy := Zakonczone_Dostawy + 1;
            end Zglos_Dostawe;
         or
            delay const.Czas_Raport;
            Magazyn.Magazyn_Glowny.Sprawdz_Stan(Zapas);
            Put_Line("===== RAPORT Z CENTRUM =====");
            Put_Line("Towar1:" & Integer'Image(Zapas(Dostawy.Towar1)) &
                     "  |  Towar2:" & Integer'Image(Zapas(Dostawy.Towar2)) &
                     "  |  Towar3:" & Integer'Image(Zapas(Dostawy.Towar3)));
            New_Line;         
            Put_Line("Robot R1: " & Typ_Stanu_Robota'Image(Roboty(1)) & 
                     " | Robot R2: " & Typ_Stanu_Robota'Image(Roboty(2)));
            Put_Line("Zakonczone dostawy: " & Integer'Image(Zakonczone_Dostawy));
            Put_Line("============================");
         end select;
      end loop;
   end Monitor;
end Kontroler;