with Dostawy;
package Rozladunki is
   task type rozladunek is
      entry Przyjmij_Dostawe(Dostawa : in Dostawy.Dane_Dostawy);

      entry Wydaj_Towar(Towar : out Dostawy.Rodzaje_Towaru; Ilosc : out Integer);
   end rozladunek;

   Stanowisko_1 : rozladunek;
end Rozladunki;