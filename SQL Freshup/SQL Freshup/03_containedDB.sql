
ContainedDatabase

Filestreaming (Filetable)

Kostenschwellwert: 5
max Grad an Para: 12/ 8

--Problem von verwaisten Usern


default: SQL User mit Login


--ContDB
--auf Server Eigenständigkeit aktivieren--jede DB ist immer noch eine "normle DB'
--pro DB kann man Eigenst. aktiveren
USE [master]
GO
ALTER DATABASE [testdb] SET CONTAINMENT = PARTIAL WITH NO_WAIT
GO

--jetzt neuer Benutzer mit Kennwort
--Benutzer mit Login immer noch möglich

USE [testdb]
GO
CREATE USER [Evi] WITH PASSWORD=N'ppedv2019!'
GO


--man sieht nur die DB auf der man als Uer mit Login enthalten 
--Repklikation geht nicht 
--CDT CDC geht auch nicht


---mit Windows Konten vermutlich nicht notwendig

--kein Jobs