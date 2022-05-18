--INSTANZEN
--Security, Perfmormanc
--25


/*
Dienstkonto

lokale Konten, autom Kennwortänderungen

NT Service\SQLAgent$HR -----  >\\NAS\BACKUP  Computerkonto
NT Service\MSSQL$HR

werden immer für lokale Zugriffe verwendet


Logshipping
auch bei Verwendung von DOM KOnten für Dienste

DOM\svcSQL
DOM\svcAgent


Kann ein Jobschritt ein anderes Konto verwenden  statt Agentkonto: Proxykonto
SSIS



Volumewartungstask  (keine SQL Geschichte/ lok Sicherheitsrichtlinien_ zuweisen von Volumeaertungsaufgaben)
Vergrößerung ohne vorher ausnullen zu müssen




+64--> 128MB
---------------------------------------------
11111111111111111111111111111111110mavPert.docx
---------------------------------------------

!! dir c.\


einem guten Admin ist das egal..


Startparameter -e  dürfen auch Windows Admin rein



Datenverzeichnisse:
Regel: Trenne Daten von Logs phsikalisch


TEMPDB

Anzahl der (Daten-)Dateien_ = Anzahl der Kerne max 8
Traceflags
-T1117 Dateien wachsen gleichmäßig (nur bei automatischen Wachstum)
-T1118  (uniform extens statt mixced extents)


--MAXDOP
jede Abfrage verwendet entweder 1 Kern oder alle (Wert des MAXDOP)
abh. von Kostenschwellwert:  5 SQL Dollar
Regel: es müssen definitiv nicht alle Kerne für eine ABfrage verwendet, weil oft schlechter
je mehr Kerne desto höher der CPU AUfwand
früher: 0 (= alle)




MAX Speicher (Datenpuffer)
lmitieren, weil es auch ein OS gibt  60160(64GB)
bei 12 GB --> 10200 2 GB

Formel: 10%
2 bis 10GB





*/


