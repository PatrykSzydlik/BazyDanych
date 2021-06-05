---
---Robot 
---

create or replace procedure dodaj_robota(
    id_zawodnika_p number,
    id_konkurencji_p number,
    nazwa varchar2
)
as 
begin
  insert into TB_Roboty
  values (SQ_Roboty.nextval, id_zawodnika_p, id_konkurencji_p, nazwa);
  commit;
  exception
    when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Taki robot już istnieje');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure usun_robota(
    nazwa varchar2
)
as
begin
    delete from TB_Roboty
    where Nazwa_robota = nazwa;
    commit;
end;
/
create or replace procedure awansuj_robota(
    id_Robota_p number,
    id_konkurencji_p number
)
as 
begin
  update TB_Roboty set ID_konkurencji = id_konkurencji_p  where ID_Robota = id_Robota_p; 
end;
/
