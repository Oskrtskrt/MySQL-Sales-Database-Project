# Online Sales Database & Analysis

## Overview

This project involved transforming a raw online sales dataset into a structured relational database using MySQL and then analyzing the data to answer business-focused questions.

The project began with a denormalized dataset containing customer, product, warehouse, and sales information. I separated this information into related tables, established primary and foreign key relationships, and used SQL to analyze the resulting database.

The results of the SQL analysis were then organized in Excel and visualized using charts to communicate insights in a simple format.

## Project Workflow

Raw Sales Data → MySQL Relational Database → SQL Analysis → Excel Visualization

## Database Design

The original dataset contained customer, product, warehouse, and sales information within a single `RawData` table.

I transformed the raw data into four related tables:

- **Customers** — Customer identification and location information
- **Products** — Product descriptions, categories, and pricing
- **Warehouses** — Warehouse and manufacturer information
- **Sales** — Transaction-level sales information

### Relationships

The `Sales` table connects the database entities using foreign keys:

- `CustomerID` → `Customers.CustomerID`
- `ProductSKU` → `Products.ProductSKU`
- `WarehouseID` → `Warehouses.WarehouseID`

## SQL Analysis

After creating the relational database, I developed business-focused questions based on the types of insights a manager could use to evaluate sales performance.

SQL was used to answer these questions and analyze areas such as:

- Customer activity
- Product performance
- Sales performance
- Warehouse activity
- Sales channels
- Payment methods
- Returns

### SQL Concepts Used

- `JOIN`
- `SUM()`
- `COUNT()`
- `GROUP BY`
- `ORDER BY`
- Aggregate Functions
- Primary Keys
- Foreign Keys
- Data Normalization
- Relational Database Design

## Excel Analysis

The results from the SQL queries were organized in Excel and used to create charts for communicating the findings.

This provided experience translating SQL results into simple visualizations that could be understood by non-technical stakeholders.

## My Contributions

This was a team project. My primary contributions focused on:

- Designing the relational MySQL database
- Creating tables and establishing primary and foreign key relationships
- Transforming the raw dataset into a relational structure
- Developing SQL queries to answer business questions
- Analyzing query results
- Organizing results in Excel
- Creating charts to communicate findings

## Tools & Technologies

- MySQL
- SQL
- Microsoft Excel

## Project Files

- `MySQLProject.sql` — SQL script containing the database structure, tables, relationships, and data population
- `screenshots/` — Selected screenshots of the database and analysis

## Key Takeaways

This project provided hands-on experience taking raw business data through the full analysis process: structuring data in a relational database, querying it with SQL, answering business questions, and communicating results through Excel visualizations.
