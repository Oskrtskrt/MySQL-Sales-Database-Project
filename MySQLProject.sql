create database OnlineSales;
use  OnlineSales;

CREATE TABLE raw_data (
    InvoiceNumber        VARCHAR(50),
    ProductSKU           VARCHAR(100),
    CustomerID           VARCHAR(50),
    WarehouseID          VARCHAR(50),
    Description          VARCHAR(255),
    Quantity             INT,
    InvoiceDate          DATE,
    UnitPrice            DECIMAL(10,2),
    Country              VARCHAR(100),
    Category             VARCHAR(100),
    SalesChannel         VARCHAR(100),
    WarehouseLocation    VARCHAR(255),
    ManufacturerCountry  VARCHAR(100),
    FirstName            VARCHAR(100),
    LastName             VARCHAR(100),
    WarehouseAddress     VARCHAR(255)
);
CREATE TABLE Customer (
    CustomerID INT  NOT NULL PRIMARY KEY,
    Country VARCHAR(255)
);
INSERT INTO Customer (CustomerID, Country)
SELECT 
    CustomerID,
    MIN(Country) AS Country
FROM raw_data
GROUP BY CustomerID;


CREATE TABLE Product (
    ProductSKU VARCHAR(20) NOT NULL PRIMARY KEY,
    Category VARCHAR(20),
    Description VARCHAR(255)
);

INSERT INTO Product (ProductSKU, Category, Description)
SELECT ProductSKU,
       MAX(Category) AS Category,
       MAX(Description) AS Description
FROM raw_data
WHERE ProductSKU IS NOT NULL AND LENGTH(TRIM(ProductSKU)) > 0
GROUP BY ProductSKU;

;


CREATE TABLE Warehouse (
    WarehouseID INT NOT NULL PRIMARY KEY,
    WarehouseCity VARCHAR(20),
    WarehouseCountry VARCHAR(20)
);
INSERT INTO Warehouse (WarehouseID, WarehouseCity, WarehouseCountry)
SELECT
    WarehouseID,
    MIN(WarehouseLocation),
    MIN(ManufacturerCountry)
FROM raw_data
GROUP BY WarehouseID;


CREATE TABLE Sales (
    SaleID INTEGER PRIMARY KEY , 
    InvoiceNumber INT NOT NULL,
    CustomerID INT,
    ProductSKU VARCHAR(20),
    WarehouseID INT,
    Quantity INT,
    InvoiceDate VARCHAR(50),
    SalesChannel VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductSKU) REFERENCES Product(ProductSKU),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

ALTER TABLE Sales
MODIFY COLUMN SaleID INT NOT NULL AUTO_INCREMENT;


INSERT INTO Sales (InvoiceNumber, CustomerID, ProductSKU, WarehouseID, Quantity, InvoiceDate, SalesChannel)
SELECT InvoiceNumber, CustomerID, ProductSKU, WarehouseID, Quantity, InvoiceDate, SalesChannel
FROM raw_data
WHERE InvoiceNumber IS NOT NULL
  AND CustomerID IS NOT NULL
  AND ProductSKU IS NOT NULL;

ALTER TABLE product
DELETE COLUMN unitprice 
Select *
from product;






