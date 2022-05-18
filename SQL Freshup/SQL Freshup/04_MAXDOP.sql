SELECT      Customers.CompanyName, Customers.CustomerID, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.ShipCity, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.EmployeeID, Orders.ShipCountry, Orders.ShipName, Orders.Freight, 
                   Employees.LastName, Employees.FirstName, Employees.BirthDate, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.ProductName, Products.UnitsInStock
into ku
FROM         Customers INNER JOIN
                   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                   Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                   [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                   Products ON [Order Details].ProductID = Products.ProductID


insert into ku
select * from ku

--551000--> 1,1 MIO DS

--MAXDOP
--sagt, wieviele Prozessoren werden pro ABfrage verwendet
--1 oder MAXDOP Wert

--abh Kostenschwellwert: 5 ( SQL Dollar)


select top 3 * from ku


set statistics io, time on -- Dauer in ms / CPU Zeit in ms und Anzahl der Seiten
--nur bei Bedarf aktivieren (Off)

select country, city, sum(unitprice*quantity) from ku
group by country, city
--Seiten: 49680  (Seiten  8kb * Anzahl in RAM
--, CPU-Zeit = 500 ms, verstrichene Zeit = 98 ms.

--Kostenschwellwert bei 5-- 37 SQL Dollar

select country, city, sum(unitprice*quantity) from ku
group by country, city option  (maxdop 6)

--CPU-Zeit = 281 ms, verstrichene Zeit = 282 ms.

--knapp 60% von vorher

--weniger Seiten --> weniger CPU -- weniger RAM

SCOPED DATABASE 

--pro DB MAXDOP einstellbar
--ist der MAXDOP in der DB 0 gilt der Wert des Servers
--ist der Wert nicht 0, dann gilt der Wert der DB

--SPoint: MAXDOP 1