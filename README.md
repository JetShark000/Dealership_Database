Car Management Database
---
Overview
---
The Car Management Database is designed to efficiently manage vehicle data, including car details, ownership records, servicing history, and parts inventory. The database enables CRUD (Create, Read, Update, Delete) operations for all entities and ensures data integrity through relational constraints.

Database Schema
---
The database consists of the following tables:

Cars - Stores details of available cars (Brand, Model, Year, Price).

Car_Owners - Maintains records of car owners with references to their vehicles.

Servicing - Tracks car servicing details including service date, description, and cost.

Parts - Stores information about car parts, their prices, and quantities.

Features
---
Full CRUD operations for Cars, Owners, Servicing, and Parts.

Referential integrity enforced with foreign key constraints.

Stored procedures for simplified operations:

AddCar, GetAllCars, UpdateCarPrice, DeleteCar

AddService, GetAllServices, DeleteService

AddPart, GetAllParts, DeletePart

Usage
---
Creating a new car record:

CALL AddCar('Toyota', 'Camry', 2024, 32000.00);

Retrieving all cars:

CALL GetAllCars();

Updating car price:

CALL UpdateCarPrice(1, 35000.00);

Adding a new service record:

CALL AddService(1, '2024-02-15', 'Engine Tune-up', 250.00);

Retrieving all parts:

CALL GetAllParts();

Installation

Execute the provided SQL script to create the database and tables.

Run the stored procedures to insert, retrieve, update, or delete records as needed.

Contact
---
For questions or contributions, do not hesitate to reach out.

Last Updated: February 2024
