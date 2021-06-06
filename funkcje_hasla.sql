
create or replace procedure dodaj_haslo(
    ID_zawodnika number,
    ID_Sedziego number,
    ID_Organizatora number,
    Haslo_p varchar2
)
as 
begin
  insert into TB_Hasla
  values ( SQ_Hasla.nextval ,ID_zawodnika,ID_Sedziego, Haslo_p);
  commit;
  exception
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/


create or replace procedure usun_haslo(
    ID_hasla_p number
)
as
begin
    delete from TB_Hasla
    where ID_Hasla = ID_hasla_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego hasla');
end;
/