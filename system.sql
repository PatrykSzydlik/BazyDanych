---
--- zawartosc system.sql
---

@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\setup_database.sql'
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_zawodnik.sql'
@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_robot.sql'
....

call log_message
call dodaj_zawodnika
call wyswietl_zawodnika
call zweryfikuj_zawodnika
call wyswietl_zawodnika


call DODAJ_ZAWODNIKA('Wiktor','Bajor', 'wiktor@wiktor.pl');
call ZWERYFIKUJ_ZAWODNIKA('Wiktor','Bajor', 'wiktor@wiktor.pl');
call wyswietl_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  

call usun_zawodnika('Wiktor','Bajor', 'wiktor@wiktor.pl');  


declare
    aktywni number;
begin
    aktywni := ZLICZ_AKTYWNYCH_ZAWODNIKOW();
end;



@'C:\Users\patry\Desktop\Semestr 6\Bazy Danych\Projekt\repo\funkcje_konkurencja.sql';
--- Konkurencja
call dodaj_konkurencje('Linefollower', TIMESTAMP'2021-05-08 19:00:00', 'Czasowy');
