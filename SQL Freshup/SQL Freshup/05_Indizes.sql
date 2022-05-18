--Indizes

/*

N GR IX
zusätzliche Menge an Daten as Kopie in sortierte Forms
ca 1000 pro Tabelle
wenn rel wenig rauskommt zb ID  oder PK

GR IX
= Tabelle , die immer sortiert sein wird
gibt es pro Tabelle nur 1 mal
besonders gut bei Bereichsabfragen

Wartung: Defragmentierung
			-- überflüssige entfernen
				überlappende IX entfernen
				Korrekturen
				fehlende Indizes

also zur Bewertung: Aufzeichung aller Abfragen (queryStore / Profiler)


--Columnstore aus Ent --> STD / Expr
*/
alter table ku add id int identity


set statistics io ,time on

select country, city, freight  from ku where id = 100 --540MB in RAM
-- select 67574 * 8 kb

--218ms und 100ms Dauer

--mit IX 3 Seiten = 24kb und 0 ms
--bei ir im where kein IX Vorschlag
select country, city, freight  from ku where id = 100 or freight < 0.03

select * into ku2 from ku


dbcc showcontig ('ku')
--- Gescannte Seiten.............................: 50477
-- Mittlere Seitendichte (voll).....................: 97.72%

select * from ku where id = 100 -- 67574

select * from sys.dm_db_index_physical_stats(db_id(), object_id('ku'),NULL, NULL, 'detailed')
--forward_record_count
--id kostet 17000 Seiten

select top 3 * from ku
---Abfrage: Agg (Summe pro ) .. where 

--Summe Frachtkosten pro Quartal die wo Coutry = France


select datepart(qq,orderdate) , sum(freight) from ku
where country = 'France'
group by datepart(qq,orderdate)

--, CPU-Zeit = 31 ms, verstrichene Zeit = 21 ms.  seiten 541



select datepart(qq,orderdate) , sum(freight) from ku2
where country = 'France'
group by datepart(qq,orderdate)


--Normale IX vs CS IX .. keine Nachfrage nach Spalten

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX] ON [dbo].[ku2] 


--450 MB   --- CS Tab 3,8MB    stimmt ! nach Archivkompression  20% weniger

----Kompression: 40-60%

---diese 3,2 MB kommen 1:1 in RAM-- und ist schneller

--gut geeignet bei : Archivdaten




---Wartung
--IX Rebuild abh von Fragemtnierungsgrad
--Wartungsplan  Ola Hallengren


200 MB HEAP +  1GR IX + 2 NGR IX-- 363 MB
-- tempdb    ohne
--OFFLINE    ONLINE

--teuerste Kombi: ONLINE TEMPDB.   : 1100
--offline ohne .. 860





select * from sys.dm_db_index_usage_stats
GO

select datepart(qq,orderdate) , sum(freight) from ku2
where country = 'France'
group by datepart(qq,orderdate)


GO








Columnstore Index

*/

select * from customers

insert into customers (CustomerID, CompanyName) values ('ppedv', 'Fa ppedv ')