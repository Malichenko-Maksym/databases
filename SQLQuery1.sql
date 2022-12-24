SELECT id_studenta
FROM oceny_studentow
where data_egzaminu between '2017-03-01' and '2017-03-31'
group by id_studenta
order by id_studenta desc 

select nazwisko, imie, data_urodzenia, nr_grupy
from studenci 
where nr_grupy not like '%1001%'
order by nazwisko,imie

select *
from pracownicy
where PESEL is null or data_zatrudnienia is null
order by nazwisko, imie desc

select imie, nazwisko, s.id_studenta,data_egzaminu
from studenci s inner join oceny_studentow os on s.id_studenta=os.id_studenta
group by imie, nazwisko,s.id_studenta,data_egzaminu
order by data_egzaminu

select nazwisko, imie, stopien_tytul
from wykladowcy w inner join pracownicy p on w.id_wykladowcy=p.id_pracownika
where katedra='Katedra Informatyki'
order by nazwisko, imie

select nazwisko, imie, katedra
from wykladowcy w right join pracownicy p on w.id_wykladowcy=p.id_pracownika
order by nazwisko, imie desc

select id_wykladowcy, stopien_tytul
from wykladowcy w 
except
select w.id_wykladowcy, stopien_tytul
from wykladowcy w  inner join wyklady wy on w.id_wykladowcy=wy.id_wykladowcy
order by stopien_tytul

select imie, nazwisko, nr_grupy
from studenci s left join studenci_wyklady sw on s.id_studenta=sw.id_studenta
where id_wykladu is null
order by  nazwisko desc, imie desc

select id_studenta, nazwisko, imie
from studenci 
except 
select s.id_studenta, nazwisko, imie
from studenci s inner join oceny_studentow os on s.id_studenta=os.id_studenta 
order by nazwisko,imie


select imie, nazwisko, nr_grupy Grupa_Katedra
from studenci
where nr_grupy like 'DMIe%'
union
select imie, nazwisko, katedra
from wykladowcy w inner join pracownicy p on w.id_wykladowcy=p.id_pracownika
order by Grupa_Katedra

select id_studenta
from studenci_wyklady
where id_wykladu=12
intersect
select id_studenta
from studenci_wyklady
where id_wykladu=1

select imie, nazwisko, nr_grupy
from studenci
where nr_grupy like 'DM%'
except
select imie, nazwisko, nr_grupy
from studenci s left join studenci_wyklady sw on s.id_studenta=sw.id_studenta
left join wyklady w on sw.id_wykladu=w.id_wykladu
where nazwa_wykladu like 'Informatyka'
order  by nazwisko

select count(id_wykladu) NaLitereM
from wyklady
where nazwa_wykladu like'%m%'

select AVG(ocena) Srednia, nazwisko, imie
from studenci s inner join oceny_studentow os on s.id_studenta=os.id_studenta
where nazwisko='Nowakowski'
group by s.id_studenta, nazwisko, imie
order by nazwisko desc, imie desc

select s.id_studenta, nazwisko, imie
from studenci s inner join studenci_wyklady sw on s.id_studenta=sw.id_studenta
group by s.id_studenta, nazwisko, imie
having COUNT(id_wykladu) = 1
order by id_studenta

select o.ocena, count(os.ocena)
from oceny o left join oceny_studentow os on o.ocena=os.ocena
group by o.ocena
order by o.ocena desc


select id_wykladowcy, AVG(ocena) Srednia
from wyklady w left join oceny_studentow os on w.id_wykladu=os.id_wykladu
group by id_wykladowcy
order by Srednia desc

select nazwa_wykladu,sum(liczba_godzin*stawka)
from wyklady w inner join wykladowcy wy on w.id_wykladowcy=wy.id_wykladowcy
inner join stopnie_tytuly st on wy.stopien_tytul=st.stopien_tytul
where nazwa_wykladu='Informatyka' or nazwa_wykladu='Statystyka'
group by nazwa_wykladu

select nazwisko, imie, sum(liczba_godzin)  Liczba_godzin
from pracownicy p inner join wyklady w on p.id_pracownika=w.id_wykladowcy
group by w.id_wykladowcy, nazwisko, imie
order by  Liczba_godzin desc

select nazwa_wykladu, COUNT(id_studenta) liczba_st
from wyklady w left join studenci_wyklady sw on w.id_wykladu=sw.id_wykladu
group by w.id_wykladu,   nazwa_wykladu
order by liczba_st desc