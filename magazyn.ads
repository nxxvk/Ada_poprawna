with Dostawy;
package Magazyn is
   type Stany_Magazynu is array (Dostawy.Rodzaje_towaru) of Integer;
   
   
   task Magazyn_Glowny is
      entry Przyjmij_Towar(Towar : in Dostawy.Rodzaje_towaru; Ilosc : in Integer);
      entry Sprawdz_Stan(Stan : out Stany_Magazynu);
   end Magazyn_Glowny;
end Magazyn;