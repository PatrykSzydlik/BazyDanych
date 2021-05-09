create or replace procedure dodaj_konkurencje(
    nazwa varchar2,
    godzina varchar2,
    tryb_oceny varchar2
)
as 
begin
    insert into TB_Konkurencje
    values (SQ_Konkurencje.nextval,nazwa,tryb_oceny, TO_DATE(godzina), 0);
    commit;
end;
/

create or replace procedure wyswietl_dostepne_konkurencje
as
begin
    for rec in (select ID_Konkurencji, Nazwa, Godzina_startu, Zakonczona
                from TB_Konkurencje
                where Zakonczona = 0)
    loop
        dbms_output.put_line(rec.ID_Konkurencji ||' ' ||
                             rec.Nazwa ||' '||
                             rec.Godzina_startu||' '
                             );
    end loop;
end;
/

create or replace procedure usun_konkurencje(
     nazwa_p varchar2
)
as
begin
  delete from TB_Konkurencje
    where Nazwa = nazwa_p;
    commit;
end;
/

create or replace procedure zakoncz_konkurencje(
     nazwa_p varchar2
)
as
begin
    update TB_Konkurencje set Zakonczona = -1 where Nazwa = nazwa_p;
    commit;
end;
/

create or replace procedure wyswietl_konkurencje(
    nazwa_p varchar2
)
as
    id number;
    godzina_p date;
    zakonczona_p number;
begin
    select ID_Konkurencji, Godzina_startu, Zakonczona
    into id, godzina_p, zakonczona_p
    from TB_Konkurencje
    where Nazwa =  nazwa_p;
    dbms_output.put_line( id ||' ' ||
                          nazwa_p ||' '||
                          godzina_p ||' '||
                          zakonczona_p
                        );
end;
/