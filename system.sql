---
--- zawartosc system.sql
---
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\setup_database.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_zawodnik.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_robot.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_konkurencja.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_stanowisko.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_sedzia.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_sesja.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_przejazd_czasowy.sql';
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_sparing.sql';

---  Zawodnik  -------------------------

call dodaj_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');
call zweryfikuj_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');
call wyswietl_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  
call usun_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  
begin
    dbms_output.put_line(ZLICZ_AKTYWNYCH_ZAWODNIKOW() ||' ');
end;
/

--- Konkurencja  -----------------------
call dodaj_konkurencje('MiniSumo', '2021-05-08 19:00:00', 'Punktowy');
call wyswietl_konkurencje('MiniSumo');
call wyswietl_dostepne_konkurencje();
call zakoncz_konkurencje('LineFollower');
call usun_konkurencje('LineFollower');

--- Robot  -----------------------------
call dodaj_robota(1,1, 'Bodzio');
call usun_robota('Bodzio');

--- Stanowisko  ------------------------
call dodaj_stanowisko();
call zmien_stan_stanowiska(3,1);
call usun_stanowisko(2);

--- Sedzia  ----------------------------
call dodaj_sedziego('Patryk', 'Szydlik');
call usun_sedziego(2);

call dodaj_sedziego('Patryk', 'Szydlik');
call usun_sedziego_po_imieniu('Patryk', 'Szydlik');

--- Sesja  -----------------------------
call dodaj_sesje(1,1,1,'2021-05-08 21:00:00');
call wyswietl_sesje_konkurencji(1);
call wyswietl_sesje_stanowiska(1);
call usun_sesje(2);

--- Przejazd  --------------------------
call dodaj_przejazd(1,1,10);
call usun_przejazd(2);
call dodaj_przejazd(1,1,10);
call wyswietl_przejazd_sesji(1);

--- Sparing  --------------------------
call dodaj_sparing(1, 1, 10);
call aktualizuj_punkty_sparing(1,5);
call wyswietl_sparingi_sesji(1);
call usun_sparing(2);

--- Funkcje ogólne --------------------

