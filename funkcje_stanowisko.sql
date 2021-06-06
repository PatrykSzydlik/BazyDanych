---
--- Stanowisko 
---

create or replace procedure dodaj_stanowisko
as 
begin
  insert into TB_Stanowiska
  values (SQ_Stanowiska.nextval, 0);
  commit;
  exception
  when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Takie stanowisko juz istnieje');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure usun_stanowisko(
    id_stanowiska_p number
)
as
begin
    delete from TB_Stanowiska
    where ID_Stanowiska = id_stanowiska_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiej sesji');
end;
/

create or replace procedure zmien_stan_stanowiska(
    id_stanowiska_p number,
    stan_p number
)
as
begin
    update TB_Stanowiska set stan = stan_p where ID_Stanowiska = id_stanowiska_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiej sesji');
end;
/

