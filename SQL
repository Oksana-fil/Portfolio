CREATE TABLE Hotels 
(
   HotelId int IDENTITY NOT NULL PRIMARY KEY,
   HotelName varchar(20) NOT NULL,
   StarsCount int NOT NULL,
   CreationYear int NOT NULL,
   Adress varchar(40)
)

CREATE TABLE rooms
(
   RoomId int IDENTITY Not Null PRIMARY KEY,
   RoomNumber int Not Null,
   HotelIdy int Not Null FOREIGN KEY REFERENCES Hotels(HotelId)
)

CREATE TABLE Clients
(
   ClientId int IDENTITY NOT NULL PRIMARY KEY,
   ClientName varchar (20),
   Email varchar (20),
   Age int NOT NULL
)

CREATE TABLE Orders 
(
   OrderId Int IDENTITY NOT NULL PRIMARY KEY,
   ClientId int NOT NULL FOREIGN KEY REFERENCES Clients(ClientId),
   RoomId int NOT NULL FOREIGN KEY REFERENCES Rooms(RoomId),
   Price int NOT NULL,
   DaysCount int NOT NULL
   )

SELECT TOP (1000) [HotelId]
      ,[HotelName]
      ,[StarsCount]
      ,[CreationYear]
      ,[Adress]
  FROM [HotelDB].[dbo].[Hotels]

  SELECT TOP (1000) [RoomId]
      ,[RoomNumber]
      ,[HotelIdy]
  FROM [HotelDB].[dbo].[rooms]

 INSERT INTO Clients (ClientName, Email, Age) VALUES 
  ('Vasya', 'Pupkin@gmail.com', 20),
  ('Anton', 'ldprod123@gmail.com', 20),
  ('Anna', 'anton799@gmail.com', 30),
  ('Professor', 'kornev86@gmail.com', 60)

  SELECT * FROM Clients WHERE Age = 20
  SELECT Clients.ClientName, Clients.Email FROM Clients
  SELECT * FROM Clients

  SELECT * FROM Clients WHERE Clients.ClientName = 'Anton'
  SELECT * FROM Clients WHERE Clients.ClientName Like 'a%'
  SELECT * FROM Clients WHERE Clients.ClientName Like 'a%'
  SELECT * FROM Clients WHERE Clients.ClientName Like 'An_on'
  SELECT * FROM Clients WHERE Clients.ClientName Like '%a%'
  SELECT * FROM Clients WHERE Clients.ClientName Like 'a%g'
  SELECT * FROM Clients WHERE Email Like '%@%'
  SELECT Clients.ClientId, Clients.ClientName, Clients.Email, Age FROM Clients WHERE Age = 20
  SELECT Count(Age) as AgeCount FROM Clients WHERE Age = 20
  SELECT SUM (Age) as SumAge FROM Clients WHERE ClientName Like 'A%'
  SELECT Avg (Age) as AvgAge FROM Clients
  SELECT MAX (Age) FROM Clients 
  SELECT MIN (Age) FROM Clients 


  INSERT INTO Hotels (HotelName, StarsCount, CreationYear, Adress) VALUES
  ('Bukovina', 5, 2010, 'Holovna str. 100'),
  ('Marion', 5, 2020, 'Bukovel')

  INSERT INTO Rooms (RoomNumber, HotelIdy) Values 
  (100, 1),
  (101, 1),
  (102, 1),
  (103, 1),
  (200, 1),
  (201, 1),
  (1, 2),
  (2, 2),
  (3, 2),
  (4, 2)


   SELECT * FROM Clients 
   SELECT * FROM Hotels 
   SELECT * FROM Rooms 
   SELECT * FROM Orders 

   SELECT * FROM Orders JOIN Clients on Orders.ClientId = Clients.ClientId
   SELECT * FROM Orders JOIN Rooms on Orders.RoomId = Rooms.RoomId
   SELECT * FROM Rooms RIGHT JOIN Hotels on Hotels.HotelId = Rooms.HotelIdy

   INSERT INTO Hotels (HotelName, StarsCount, CreationYear, Adress) VALUES
   ('Edelweiss', 3, 2020, 'Buko')


  INSERT INTO Orders (ClientId, RoomId, Price, DaysCount) VALUES 
   (1, 1, 100, 1),
   (2, 4, 1000, 2),
   (3, 2, 100, 2),
   (4, 3, 1000, 1),
   (5, 5, 250, 1),
   (6, 1, 300, 3),
   (7, 6, 400, 1),
   (8, 2, 500, 2),
   (9, 2, 700, 3),
   (10, 3, 800, 4)


   SELECT Price, Count(Price) From Orders GROUP BY Price 
   SELECT DaysCount, Count(DaysCount) From Orders GROUP BY DaysCount
   SELECT Age, Count(Age) FROM Clients GROUP BY Age 
   SELECT RoomId, MAX(Price) FROM Orders GROUP BY RoomId

    SELECT Age, Count(Age) FROM Clients GROUP BY Age HAVING Age <31

	SELECT * FROM Orders ORDER BY Price DESC
	 SELECT * FROM Clients ORDER BY ClientName DESC

  

  UPDATE Hotels SET StarsCount = 4 WHERE HotelId = 1
  UPDATE Hotels SET StarsCount = 5 WHERE HotelId = 2

  UPDATE Hotels SET StarsCount = 1 , CreationYear = 2003, Adress = 'Chernivtsi' WHERE HotelId = 1

  DELETE FROM Hotels WHERE HotelId = 1

  DROP TABLE Hotels
