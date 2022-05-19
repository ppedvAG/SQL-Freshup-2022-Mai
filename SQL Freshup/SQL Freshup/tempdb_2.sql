select * from tabelle where 1=0

--> Tabelle --> IX  --IX SEEK  mit Lookup

--Sichten  * 



--TEMPDB
--T1117  gleich große Dateien
--T1118 uniform extents
--Mehr Dateien , max 8  soviele wo Core
--MAXDOP 8 


8 Seiten am Stück = BBlock

select * into #t from sysprocesses


--#t in einer Seite  (max 700 Slot  oder 8072bytes Platz)

--noch mehr #t2 #t3 #t4 

Zugriff auf Seite und Block ist single Thread- LATCH 


select * from  #t --geschätzten Plan -- vor Abfrage braucht man INfos zu der Tabelle


ALTER Server configuration set memory_optimized Tempdb_metadata = ON--Metadaten zu tabellen in memory


--inMemory: keine LATCHES

--inMemory



alteR SERVER configuration set memory_optimized hybrid_Buffer_pool= on


Windows 2019 + SQL 2019 optane  --> > 1 MIO IOPS



--Tempdb  
 10MB   12 MB--> 2 MB in tempdb auslagern--> Neuerung

 10MB 150 70  




