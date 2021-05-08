---
--- To komentarz w sql 
---

---
--- Czyszczenie
---

drop sequence SQ_Zawodnicy;
drop sequence SQ_Roboty;
drop sequence SQ_Konkurencja;
drop sequence SQ_Stanowiska;
drop sequence SQ_Sesje;
drop sequence SQ_Sparingi;
drop sequence SQ_Przejazd_czasowy;
drop sequence SQ_Sedziowie;

create sequence SQ_Zawodnicy start with 1 increment by 1;
create sequence SQ_Roboty start with 1 increment by 1;
create sequence SQ_Konkurencja start with 1 increment by 1;
create sequence SQ_Stanowiska start with 1 increment by 1;
create sequence SQ_Sesje start with 1 increment by 1;
create sequence SQ_Sparingi start with 1 increment by 1;
create sequence SQ_Przejazd_czasowy start with 1 increment by 1;
create sequence SQ_Sedziowie start with 1 increment by 1;

---
--- Odtwarzanie
---

