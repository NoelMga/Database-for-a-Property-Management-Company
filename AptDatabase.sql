CREATE TABLE MAINTENANCE (
 MaintenanceID Int NOT NULL IDENTITY(5,5),
 MaintenanceStatus Char(100),
 MaintenanceDate DATE NOT NULL,
 MaintenanceCost Char(50),
 CONSTRAINT MAINTENANCE_PK PRIMARY KEY(MaintenanceID)
 );


CREATE TABLE TENANTS (
 TenantID INT NOT NULL IDENTITY(10,10),
 PhoneNumber INT NOT NULL,
 FirstName Char(25) NOT NULL,
 LastName Char(25) NOT NULL,
 SSN bigint NOT NULL,
 DateofBirth DATE NOT NULL,
 Email VARCHAR(100) NOT NULL,
 MaintenanceNumber INT NOT NULL,
 CONSTRAINT TABLE_PK PRIMARY KEY(TenantID),
 CONSTRAINT TenantMaintenance_Fk FOREIGN KEY(MaintenanceNumber)
REFERENCES Maintenance(MaintenanceID)
 );

 CREATE TABLE TenantsMaintenance (
 TenantID INT NOT NULL,
 MaintenanceID INT NOT NULL,
 CONSTRAINT TenantsMaintenance_PK PRIMARY KEY(TenantID,MaintenanceID)
 
 );
 




CREATE TABLE LEASE (
 LeaseID Int NOT NULL IDENTITY (1,1),
 LeaseSign DATE NOT NULL,
 LeaseStart DATE NOT NULL,
 MonthlyRate INT NOT NULL,
 DepositAmount INT NOT NULL,
 AparmentID INT NOT NULL,
 TenantID INT NOT NULL,
 CONSTRAINT LEASE_PK PRIMARY KEY(LeaseID),
 CONSTRAINT LEASE_TENANT_FK FOREIGN KEY(TenantID)
 REFERENCES TENANTS(TenantID)
 );

 CREATE TABLE TenantsLease (
 TenantID INT  NOT NULL,
 LeaseID INT NOT NULL,
 CONSTRAINT TenantsLease_PK PRIMARY KEY(TenantID,LeaseID),
);
 
 

 CREATE TABLE ApartmentUnit(
 ApartmentID INT NOT NULL IDENTITY(2,2),
 Size CHAR(35) NOT NULL,
 Price CHAR(20) NOT NULL,
 AparmentNumber CHAR(10) NOT NULL,
 AvailableUnits CHAR(10) NOT NULL,
 NumberBedrooms CHAR(2) NOT NULL,
 NumberBathrooms CHAR(2) NOT NULL,
 LeaseID INT NOT NULL,
 CONSTRAINT APARTMENTUNIT_PK PRIMARY KEY(ApartmentID),
 CONSTRAINT APARTMENT_LEASE_FK FOREIGN KEY(LeaseID)
 REFERENCES LEASE(LeaseID)
 );

 CREATE TABLE ApartmentMaintanence (
 MaintenanceID INT NOT NULL,
 ApartmentID INT NOT NULL,
 CONSTRAINT ApartmentMaintanence_PK PRIMARY KEY(MaintenanceID,ApartmentID)
 );



 CREATE TABLE Building(
 BuildingID INT NOT NULL IDENTITY(20,1),
 StreetAddress CHAR(55) NOT NULL,
 City CHAR(40) NOT NULL,
 State CHAR(15) NOT NULL, 
 ZIP CHAR(5) NOT NULL,
 ApartmentID INT NOT NULL,
 CONSTRAINT BUILDING_PK PRIMARY KEY(BuildingID),
 CONSTRAINT BuildingApartment_FK FOREIGN KEY(ApartmentID)
 REFERENCES ApartmentUnit(ApartmentID)
 );

 CREATE TABLE Amenities(
 AmenitiesID INT NOT NULL IDENTITY(4,1),
 AmenitiesDescription CHAR(100) NULL,
 CONSTRAINT AMENITITES_PK PRIMARY KEY(AmenitiesID)
 );

 CREATE TABLE BuildingAmenities (
 AmenitiesID INT NOT NULL,
 BuildingID INT NOT NULL,
 CONSTRAINT BuildingAmenities_PK PRIMARY KEY(AmenitiesID,BuildingID)
 );


 INSERT INTO MAINTENANCE(MaintenanceStatus,MaintenanceDate,MaintenanceCost)
 VALUES ('Request is on Standby','04/24/2024','Cost of Repair USD 250');

 INSERT INTO MAINTENANCE(MaintenanceStatus,MaintenanceDate,MaintenanceCost)
 VALUES ('Request is on Schedule','01/22/2024','Cost of Repair USD 87');

 INSERT INTO MAINTENANCE(MaintenanceStatus,MaintenanceDate,MaintenanceCost)
 VALUES ('Request is behind','02/04/2024','Cost of Repair USD 300');

 INSERT INTO MAINTENANCE(MaintenanceStatus,MaintenanceDate,MaintenanceCost)
 VALUES ('Reuest is on time','04/24/2024','Cost of Repair USD 450');
 
 INSERT INTO MAINTENANCE(MaintenanceStatus,MaintenanceDate,MaintenanceCost)
 VALUES ('Request completed early','04/22/2024','Cost of Repair USD 500')





 INSERT INTO TENANTS(PhoneNumber,FirstName,LastName,SSN,DateofBirth,Email,MaintenanceNumber)
 VALUES ('205428614','Frank','Ocean','619441299','12/01/1999','FrankOcean@gmail.com','5');

 INSERT INTO TENANTS(PhoneNumber,FirstName,LastName,SSN,DateofBirth,Email,MaintenanceNumber)
 VALUES ('404488111','Kayla','Williams','555555555','10/10/1980','KaylaWilliams@gmail.com','10');

 INSERT INTO TENANTS(PhoneNUmber,FirstName,LastName,SSN,DateofBirth,Email,MaintenanceNumber)
 VALUES ('913428111','Eugene','Harris','444444444','11/30/1961','EugeneHarris@gmail.com','15');

 INSERT INTO TENANTS(PhoneNumber,FirstName,LastName,SSN,DateofBirth,Email,MaintenanceNumber)
 VALUES ('678444111','Shay','Johnson','222224444','01/01/1991','ShayJohnson@gmail.com','20');

INSERT INTO TENANTS(PhoneNumber,FirstName,LastName,SSN,DateofBirth,Email,MaintenanceNumber)
VALUES ('612111000','Ethel','Simpson','111001111','05/20/1955','EthelSimpson@gmail.com','25');



INSERT INTO LEASE(LeaseSign,LeaseStart,MonthlyRate,DepositAmount,AparmentID,TenantID)
VALUES ('04/01/2021','05/1/2021','800','1600','2','10');

INSERT INTO LEASE(LeaseSign,LeaseStart,MonthlyRate,DepositAmount,AparmentID,TenantID)
VALUES ('12/01/2021','01/1/2022','850','1700','4','20');

INSERT INTO LEASE(LeaseSign,LeaseStart,MonthlyRate,DepositAmount,AparmentID,TenantID)
VALUES('06/01/2023','07/01/2023','700','1400','6','30');

INSERT INTO LEASE(LeaseSign,LeaseStart,MonthlyRate,DepositAmount,AparmentID,TenantID)
VALUES('07/01/2022','08/01/2022','600','1200','8','40');

INSERT INTO LEASE(LeaseSign,LeaseStart,MonthlyRate,DepositAmount,AparmentID,TenantID)
VALUES('01/01/2024','02/01/2024','900','1800','10','50');


INSERT INTO ApartmentUnit(Size,Price,AparmentNumber,AvailableUnits,NumberBedrooms,NumberBathrooms,LeaseID)
VALUES('Unit is 700sqft','1200 Per Month','Unit 1209','2','3','2','1');

INSERT INTO ApartmentUnit(Size,Price,AparmentNumber,AvailableUnits,NumberBedrooms,NumberBathrooms,LeaseID)
VALUES('Unit is 850sqft','1500 Per Month','Unit 1963','1','4','3','2');

INSERT INTO ApartmentUnit(Size,Price,AparmentNumber,AvailableUnits,NumberBedrooms,NumberBathrooms,LeaseID)
VALUES('Unit is 750sqft','1300 Per Month','Unit 2014','3','3','1','3');

INSERT INTO ApartmentUnit(Size,Price,AparmentNumber,AvailableUnits,NumberBedrooms,NumberBathrooms,LeaseID)
VALUES('Unit is 650sqft','1100 Per Month','Unit 1984','4','2','1','4');

INSERT INTO ApartmentUnit(Size,Price,AparmentNumber,AvailableUnits,NumberBedrooms,NumberBathrooms,LeaseID)
VALUES('Unit is 1550sqft','2000 Per Month','Unit 1964','1','4','3','5');


INSERT INTO Building(StreetAddress,City,State,ZIP,ApartmentID)
VALUES('1230 King Street','Atlanta','GA','30331','2');

INSERT INTO Building(StreetAddress,City,State,ZIP,ApartmentID)
VALUES('1456 Queen Street','Atlanta','GA','30331','4');

INSERT INTO Building(StreetAddress,City,State,ZIP,ApartmentID)
VALUES('1089 Hero Street','Atlanta','GA','30331','6');

INSERT INTO Building(StreetAddress,City,State,ZIP,ApartmentID)
VALUES('1489 Hello Street','Atlanta','GA','30331','8');

INSERT INTO Building(StreetAddress,City,State,ZIP,ApartmentID)
VALUES('1739 Good Street','Atlanta','GA','30331','10');


INSERT INTO TenantsMaintenance(TenantID,MaintenanceID)
VALUES('10','5');

INSERT INTO TenantsMaintenance(TenantID,MaintenanceID)
VALUES('20','10');

INSERT INTO TenantsMaintenance(TenantID,MaintenanceID)
VALUES('30','15');

INSERT INTO TenantsMaintenance(TenantID,MaintenanceID)
VALUES('40','20');

INSERT TenantsMaintenance(TenantID,MaintenanceID)
VALUES('50','25');


INSERT INTO TenantsLease(TenantID,LeaseID)
VALUES('10','1');

INSERT INTO TenantsLease(TenantID,LeaseID)
VALUES('20','2');

INSERT INTO TenantsLease(TenantID,LeaseID)
VALUES('30','3');

INSERT INTO TenantsLease(TenantID,LeaseID)
VALUES('40','4');

INSERT INTO TenantsLease(TenantID,LeaseID)
VALUES('50','5');


INSERT INTO Amenities(AmenitiesDescription)
VALUES('Refurbished kitchen');

INSERT INTO Amenities(AmenitiesDescription)
VALUES('New Carpet');

INSERT INTO Amenities(AmenitiesDescription)
VALUES('New Stove and Microwave');

INSERT INTO Amenities(AmenitiesDescription)
VALUES('Each Floor has Vending');

INSERT INTO Amenities(AmenitiesDescription)
VALUES('Ring Camera For Each Door');


INSERT INTO ApartmentMaintanence(MaintenanceID,ApartmentID)
VALUES('5','2');

INSERT INTO ApartmentMaintanence(MaintenanceID,ApartmentID)
VALUES('10','4');

INSERT INTO ApartmentMaintanence(MaintenanceID,ApartmentID)
VALUES('15','6');

INSERT INTO ApartmentMaintanence(MaintenanceID,ApartmentID)
VALUES('20','8');

INSERT INTO ApartmentMaintanence(MaintenanceID,ApartmentID)
VALUES('25','10');


INSERT INTO BuildingAmenities(AmenitiesID,BuildingID)
VALUES('4','20');

INSERT INTO BuildingAmenities(AmenitiesID,BuildingID)
VALUES('5','21');

INSERT INTO BuildingAmenities(AmenitiesID,BuildingID)
VALUES('6','22');

INSERT INTO BuildingAmenities(AmenitiesID,BuildingID)
VALUES('7','23');

INSERT INTO BuildingAmenities(AmenitiesID,BuildingID)
VALUES('8','24');
