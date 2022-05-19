select * from  sys.dm_os_wait_Stats

--           SUPENDED                LCK_M_S          RUNNABLE
--|---------------------------------------------|-----------------| RUNNING
--0...                                                            80                      100


--wait_time : 100ms
--signal_time: Warten auf CPU    20ms
--100-20--- Wartezeit uf Resource

--signal_time sollte immer unter 25% der gesamten Zeit sein, sonst CPU Engpass
--die Werte sind leider kummulierend
--was sagt mir eigtl der Wert: 36743  schlimm oder nicht 
--wann wurde der Server neu gestartet, weil die Wert zurückgesetzt werden

--Lösung für Problem: Verhältnis zur Gesamtzeit
----Man merkt sich alle x Minuten die akteullen Werte

							 800       810      820       830
--LCK_M_S         150         160       165      345

--regelm. wegspeichern
--abfrage ..öh..die ist weg


---Datensammler  Datacollector--oder manuell

--der QueryStore...  sch* Abfragen --> DTA

--






--Para: CXPACKET

select * from sys.dm_os_wait_stats where wait_type like 'CX%'
