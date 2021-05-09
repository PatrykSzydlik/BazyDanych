---
--- Procedury - nie zwracaja nic 
---

---
--- Wywolanie call NAZWA(param1..)
---

create or replace procedure dodaj_zawodnika(
    Imie_zawodnika varchar2,
    Nazwisko_zawodnika varchar2,
    Mail_zawodnika varchar2,
    Adres_zawodnika varchar2 default null,
    Uczelnia_zawodnika varchar2 default null
)
as 
begin
  insert into TB_Zawodnicy
  values ( SQ_Zawodnicy.nextval ,Imie_zawodnika, Nazwisko_zawodnika, Mail_zawodnika, Adres_zawodnika, Uczelnia_zawodnika, 0);
  commit;
end;
/

create or replace procedure zweryfikuj_zawodnika(
    Imie_zawodnika varchar2,
    Nazwisko_zawodnika varchar2,
    Mail_zawodnika varchar2
)
as
begin
  update TB_Zawodnicy set Aktywny = 1 where Imie = Imie_zawodnika and Nazwisko = Nazwisko_zawodnika and Mail = Mail_zawodnika; 
  commit;
end;
/


---
--- Funkcja dziala, trzeba w sql developer wejsc w View , Dbms output i ustawic enable
---
create or replace procedure wyswietl_zawodnika(
    Imie_zawodnika varchar2,
    Nazwisko_zawodnika varchar2,
    Mail_zawodnika varchar2
)
as
    id number;
    adres varchar2(32);
    uczelnia  varchar2(32);
    aktywny  number;
begin
    select ID_Zawodnika, Adres, Uczelnia, Aktywny
    into id, adres, uczelnia, aktywny
    from TB_Zawodnicy
    where Imie = Imie_zawodnika and Nazwisko = Nazwisko_zawodnika and Mail = Mail_zawodnika;
    dbms_output.put_line ( id ||' '||
                        Imie_zawodnika ||' '||
                        Nazwisko_zawodnika ||' '||
                        Mail_zawodnika ||' '|| 
                        adres ||' '|| 
                        uczelnia ||' '|| 
                        aktywny || ' ' 
                        );
end;
/

create or replace procedure usun_zawodnika(
    Imie_zawodnika varchar2,
    Nazwisko_zawodnika varchar2,
    Mail_zawodnika varchar2
)
as

begin
    delete from TB_Zawodnicy
    where Imie = Imie_zawodnika and Nazwisko = Nazwisko_zawodnika and Mail = Mail_zawodnika;
    commit;
end;
/


---
--- Funkcje
---

--- Przyklad wywolania funkcji 
--  DECLARE
--     ID_Zawodnika NUMBER := 0;
--  BEGIN
--      ID_Zawodnika  := DODAJ_ZAWODNIKA('wiktor', 'bajor', 'ktowa@wp.pl');
--  END;
create or replace function zlicz_aktywnych_zawodnikow return number
as
    aktywni_zawodnicy number;
begin
   select count(Aktywny) into aktywni_zawodnicy  from  TB_ZAWODNICY where Aktywny = 1;
   return aktywni_zawodnicy;
end;
/
