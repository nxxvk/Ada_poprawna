package Kontroler is
   pragma Elaborate_Body;
   type Typ_Stanu_Robota is (Wolny, W_Trasie, Naprawa);
   task Monitor is
      entry Aktualizuj_Stan_Robota(Id : in Integer; Stan : in Typ_Stanu_Robota);
      entry Zglos_Dostawe;
   end Monitor;
end Kontroler;