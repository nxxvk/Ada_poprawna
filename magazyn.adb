with Ada.Text_IO;
use Ada.Text_IO;
with Dostawy;

package body Magazyn is

   task body Magazyn_Glowny is
      -- Inicjalizacja tablicy zerami odbywa sie tutaj:
      Aktualny_Stan : Stany_Magazynu := (others => 0);
   begin
      loop
         select
            accept Przyjmij_Towar(Towar : in Dostawy.Rodzaje_towaru; Ilosc : in Integer) do
               Aktualny_Stan(Towar) := Aktualny_Stan(Towar) + Ilosc;
               Put_Line("[MAGAZYN] Przyjeto" & Integer'Image(Ilosc) & " szt. towaru: " & Dostawy.Rodzaje_towaru'Image(Towar));
            end Przyjmij_Towar;
         or
            accept Sprawdz_Stan(Stan : out Stany_Magazynu) do
               Stan := Aktualny_Stan;
            end Sprawdz_Stan;
         end select;
      end loop;
   end Magazyn_Glowny;

end Magazyn;