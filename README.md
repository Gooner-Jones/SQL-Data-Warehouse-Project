# SQL-Data-Warehouse-Project
Building a modern data warehouse using SQL Server, including ETL processes, data modeling &amp; analytics.
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

# Data Architecture
The data architecture for this project follows the Medallion Architecture: Bronze, Silver, and Gold layers
1. Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. Silver Layer: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.

# Project Overview
This project showcases the design and implementation of a modern SQL-based Data Warehouse using the Medallion Architecture framework (Bronze, Silver, Gold layers). It reflects best practices for building scalable, analytics-ready data infrastructure in a real-world setting.

Key components include:

- Data Architecture: Structuring a layered warehouse to support clean data flow and efficient query performance.

- ETL Pipelines: Extracting, transforming, and loading data from raw sources into curated layers using modular SQL workflows.

- Data Modeling: Designing star schema models with well-structured fact and dimension tables to support robust analytics.

- Analytics & Reporting: Generating insight-driven reports and dashboards through advanced SQL queries.

This repository highlights expertise in:

- SQL Development & Optimization

- Data Engineering & ETL Design

- Data Warehouse Architecture

- Dimensional Modeling

- Analytical Reporting & Insights

# Important Links & Tools:

- **[Datasets](datasets/):** Access to the project dataset (csv files).
- **[Data Catalog ](docs/data_catalog.md):** Data Catalog for Gold Layer.
- **[Naming Conventions](docs/namimng_conventions.md):** Outlines the naming conventions used for schemas, tables, views, columns, and other objects.

# Project Requirements

Building the Data Warehouse (Data Engineering)
Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

Specifications
- Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.
- Data Quality: Cleanse and resolve data quality issues prior to analysis.
- Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
- Scope: Focus on the latest dataset only; historization of data is not required.
- Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

# BI: Analytics & Reporting (Data Analysis)

Objective
- Develop SQL-based analytics to deliver detailed insights into:
1. Customer Behavior
2. Product Performance
3. Sales Trends
4. These insights empower stakeholders with key business metrics, enabling strategic decision-making

# License

This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.

# About Me
Hi, I'm Neo Jones — a Microsoft Certified Fabric Analytics Engineer and Microsoft Certified Fabric Data Engineer Associate with a growing passion for data engineering. I thrive on solving real-world problems using SQL, and I'm especially excited about the capabilities of Microsoft Fabric. From building data pipelines to exploring insights in the Lakehouse, I enjoy every part of working with data inside this evolving ecosystem.

This portfolio reflects my journey into the tech field, showcasing my hands-on projects, SQL skills, and curiosity-driven learning. Outside of work and code, I’m a proud single dad and a lifelong Arsenal supporter (yes, even through the tough seasons!).

Thanks for checking out my work — let’s build something great with data.














