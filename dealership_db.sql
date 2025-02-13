
CREATE DATABASE CarManagement;
USE CarManagement;

-- Creating the Cars table
CREATE TABLE Cars (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- Creating the Car_Owners table
CREATE TABLE Car_Owners (
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CarID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID) ON DELETE SET NULL
);

-- Creating the Servicing table
CREATE TABLE Servicing (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    CarID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    Description TEXT NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID) ON DELETE CASCADE
);

-- Creating the Parts table
CREATE TABLE Parts (
    PartID INT AUTO_INCREMENT PRIMARY KEY,
    PartName VARCHAR(100) NOT NULL,
    CarID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID) ON DELETE CASCADE
);

-- Inserting sample data into Cars table
INSERT INTO Cars (Brand, Model, Year, Price) VALUES
('Toyota', 'Corolla', 2024, 103526.63),
('Honda', 'Civic', 2019, 62105.64),
('Ford', 'Focus', 2020, 134824.51),
('BMW', 'X5', 2016, 149477.96),
('Mercedes', 'C-Class', 2018, 95806.89);

-- Inserting sample data into Car_Owners table
INSERT INTO Car_Owners (Name, Email, CarID) VALUES
('Troy Williams', 'david22@forbes.net', 1),
('Carrie Singleton', 'coryanderson@yahoo.com', 2),
('Christopher Price', 'carmenrobinson@hotmail.com', 3);

-- Inserting sample data into Servicing table
INSERT INTO Servicing (CarID, ServiceDate, Description, Cost) VALUES
(1, '2024-02-10', 'Oil Change', 100.00),
(2, '2024-01-15', 'Brake Replacement', 300.00);

-- Inserting sample data into Parts table
INSERT INTO Parts (PartName, CarID, Price, Quantity) VALUES
('Brake Pads', 2, 50.00, 4),
('Air Filter', 1, 25.00, 1);

-- CRUD Operations --

DELIMITER $$

-- CREATE: Insert a new car procedure
CREATE PROCEDURE AddCar(IN brand VARCHAR(50), IN model VARCHAR(50), IN year INT, IN price DECIMAL(10,2))
BEGIN
    INSERT INTO Cars (Brand, Model, Year, Price) VALUES (brand, model, year, price);
END $$

-- READ: Get all cars procedure
CREATE PROCEDURE GetAllCars()
BEGIN
    SELECT * FROM Cars;
END $$

-- UPDATE: Update car price procedure
CREATE PROCEDURE UpdateCarPrice(IN carID INT, IN newPrice DECIMAL(10,2))
BEGIN
    UPDATE Cars SET Price = newPrice WHERE CarID = carID;
END $$

-- DELETE: Remove a car procedure
CREATE PROCEDURE DeleteCar(IN carID INT)
BEGIN
    DELETE FROM Cars WHERE CarID = carID;
END $$

-- CRUD for Servicing
CREATE PROCEDURE AddService(IN carID INT, IN serviceDate DATE, IN description TEXT, IN cost DECIMAL(10,2))
BEGIN
    INSERT INTO Servicing (CarID, ServiceDate, Description, Cost) VALUES (carID, serviceDate, description, cost);
END $$

CREATE PROCEDURE GetAllServices()
BEGIN
    SELECT * FROM Servicing;
END $$

CREATE PROCEDURE DeleteService(IN serviceID INT)
BEGIN
    DELETE FROM Servicing WHERE ServiceID = serviceID;
END $$

-- CRUD for Parts
CREATE PROCEDURE AddPart(IN partName VARCHAR(100), IN carID INT, IN price DECIMAL(10,2), IN quantity INT)
BEGIN
    INSERT INTO Parts (PartName, CarID, Price, Quantity) VALUES (partName, carID, price, quantity);
END $$

CREATE PROCEDURE GetAllParts()
BEGIN
    SELECT * FROM Parts;
END $$

CREATE PROCEDURE DeletePart(IN partID INT)
BEGIN
    DELETE FROM Parts WHERE PartID = partID;
END $$

DELIMITER ;

-- Using procedures
CALL AddCar('Bugatti', 'Chiron', 2023, 3000000.00);
CALL GetAllCars();
CALL UpdateCarPrice(1, 45000.00);
CALL DeleteCar(5);
CALL GetAllServices();
CALL GetAllParts();
