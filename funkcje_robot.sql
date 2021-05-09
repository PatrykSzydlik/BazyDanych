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
end;
/

create or replace procedure usun_robota(
    nazwa varchar2
)
as
begin
    delete from TB_Roboty
    where Nazwa_robota = nazwa;
end;
/