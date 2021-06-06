---
--- zawartosc system.sql
--
@'C:\Users\wikto\Desktop\BazyDanych\setup_database.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_zawodnik.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_robot.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_konkurencja.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_stanowisko.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_sedzia.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_sesja.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_przejazd_czasowy.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_sparing.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_ogolne.sql';
@'C:\Users\wikto\Desktop\BazyDanych\funkcje_hasla.sql';


declare
 id number;
begin


    ---  Zawodnik  -------------------------
    id := dodaj_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl','1656');
    zweryfikuj_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');
    dbms_output.put_line(' Wyswietl zawodnika : ');
    id := wyswietl_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  
    id := znajdz_zawodnika('wiktor@wiktor.pl');
    usun_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  
    dbms_output.put_line('Aktywnych zawodnikow zliczono :  '|| ZLICZ_AKTYWNYCH_ZAWODNIKOW() ||' ');
    -- --- Konkurencja  -----------------------
    dodaj_konkurencje('MiniSumo', '2021-05-08 19:00:00', 'Punktowy');
    dbms_output.put_line(' Wyswietl konkurencje : ');
    wyswietl_konkurencje('MiniSumo');
    dbms_output.put_line(' Wyswietl dostepne konkurencje : ');
    wyswietl_dostepne_konkurencje();
    zakoncz_konkurencje('MiniSumo');
    usun_konkurencje('MiniSumo');
    dodaj_konkurencje('MiniSumo', '2021-05-08 19:00:00', 'Punktowy');
    --- Robot  -----------------------------
    dodaj_robota(1,1, 'Bodzio');
    awansuj_robota(3,3);
    usun_robota('Bodzio');
    --- Stanowisko  ------------------------

     dodaj_stanowisko();
     zmien_stan_stanowiska(3,1);
     usun_stanowisko(2);

    --- Sedzia  ----------------------------

     dodaj_sedziego('Patryk', 'Szydlik','458');
     usun_sedziego(2);
     dodaj_sedziego('Patryk', 'Szydlik','daw4d6s4f8se4f');
     usun_sedziego_po_imieniu('Patryk', 'Szydlik');

    --- Sesja  -----------------------------
     dodaj_sesje(1,1,1,'2021-05-08 21:00:00');
     dbms_output.put_line(' Wyswietl sesje konkurencji : ');
     wyswietl_sesje_konkurencji(1);
     dbms_output.put_line(' Wyswietl sesje stanowiska : ');
     wyswietl_sesje_stanowiska(1);
     usun_sesje(2);

    --- Przejazd  --------------------------
     dodaj_przejazd(1,1,97);
     usun_przejazd(2);
     dodaj_przejazd(1,1,130);
     dbms_output.put_line(' Wyswietl przejazdy : ');
     wyswietl_przejazdy_sesji(1);
        
    --- Sparing  --------------------------
     dodaj_sparing(1, 1, 10);
     aktualizuj_punkty_sparing(1,5);
     dbms_output.put_line(' Wyswietl sparingi : ');
     wyswietl_sparingi_sesji(1);
     usun_sparing(2);

    --- Funkcje ogólne --------------------
     dbms_output.put_line(' Ranking punktowy : ');
     wyswietl_ranking_punktowy(1,3);
     dbms_output.put_line(' Ranking czasowy : ');
     wyswietl_ranking_czasowy(1,2);
end;






