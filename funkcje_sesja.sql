---
--- Sesja
---

create or replace procedure dodaj_sesje(
    id_konkurencji_p number,
    id_stanowiska_p number,
    id_sedziego_p number,
    czas_startu_p varchar2
)
as 
begin
  insert into TB_Sesje
  values (SQ_Sesje.nextval, id_konkurencji_p, id_stanowiska_p, id_sedziego_p, TO_DATE(czas_startu_p));
  commit;
end;
/

create or replace procedure usun_sesje(
    id_sesji_p number
)
as
begin
    delete from TB_Sesje
    where ID_Sesji = id_sesji_p;
end;
/

create or replace procedure wyswietl_sesje_konkurencji(
    id_konkurencji_p number
)
as
    id_sesji_p number;
    id_stanowiska_p number;
    id_sedziego_p number;
    czas_startu_p date;
begin
    select ID_Sesji, ID_Stanowiska, ID_Sedziego, Godzina_startu
    into id_sesji_p, id_stanowiska_p, id_sedziego_p, czas_startu_p
    from TB_Sesje
    where ID_Konkurencji = id_konkurencji_p;
    dbms_output.put_line( ' Sesja '||id_sesji_p ||' Stanowisko '||
                        id_stanowiska_p ||' Konkurencja '||
                        id_konkurencji_p ||' Sedzia '||
                        id_sedziego_p ||' Czas startu '|| 
                        czas_startu_p ||' ' );
end;
/

create or replace procedure wyswietl_sesje_stanowiska(
    id_stanowiska_p number
)
as
    id_sesji_p number;
    id_konkurencji_p number;
    id_sedziego_p number;
    czas_startu_p date;
begin
    select  ID_Sesji, ID_Konkurencji, ID_Sedziego, Godzina_startu
    into id_sesji_p, id_konkurencji_p, id_sedziego_p, czas_startu_p
    from TB_Sesje
    where ID_Stanowiska = id_stanowiska_p;
    dbms_output.put_line( ' Sesja '||id_sesji_p ||' Stanowisko '||
                        id_stanowiska_p ||' Konkurencja '||
                        id_konkurencji_p ||' Sedzia '||
                        id_sedziego_p ||' Czas startu '|| 
                        czas_startu_p ||' ' );
end;
/
