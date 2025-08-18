# DSA-SQL-PROJECT
Using the KULTRA MEGA STORE INVENTORY data set as a case study and project findings, for detailed analysis, informed decision making, and Business Intelligence.
The project is a sequel to my tech learning journey at the INCUBATOR HUB, focusing on DBMS (Database Management System ), which includes data backup, both in the cloud and on-premises, its restoration process, and the usage of  SQL (Server Query Language ) Syntax, operators, Logic, and its inbuilt functions for analysis and other business intelligence.

## Topic: KULTRA MEGA STORE INVENTORY

### Project Overview  
This Data Analysis Project aims to conduct an inquiry, identify challenges, and analyse various parameters in the collected data, which will provide insight and form the basis for increasing revenue (sales), recognising valuable customer and product purchases and optimisation of the most effective shipping mode at the Kultra Mega store.

### Data Source 
The Supplier of the Data for this project is The Incubator Hub, under the flagship program tagged DSA (Digital Skill-Up Africa) as a capstone project findings, and using the Kultra Mega Store Inventory as a dataset
 
### Tools used 
1. Microsoft SQL Server
   - for data Extraction from the database.
   - for data archiving, preservation and feeder to the studio.
2. Ms Server Studio
   - for data query, usage of inbuilt functions and other analysis.
   - for import and Export 
   - Server as a source of data for other data analysis tools.
 3. SQL Syntax and functions
   - for the report and results
  
### Data Cleaning and Preparation 
At the initial phase of the Data cleaning and preparation, we perform the following actions using the import data application in the studio
1. Data quality and integrity
2. Data cleaning and formatting

### Exploratory Data Analysis
EDA involved the exploration of the available data  to answer some questions about the prepared data, such as 
- What are the top 3 regions in terms of sales
- 

  
### Analysis
This is the part where I introduce some basic lines of sql queries and code used in the provided data set for insight and analysis

````` SQL
Select product_category,MAX(Sales) as Highest_Sales
from VW_KMSales_Returned3
Group by product_category
Order by Highest_Sales Desc

`````
###

<img width="1426" height="746" alt="Screenshot 2025-08-15 134702" src="https://github.com/user-attachments/assets/fb5cbceb-bfda-4c6d-9df9-21e2ecd45139" />




<img width="1316" height="443" alt="Screenshot 2025-08-15 141546" src="https://github.com/user-attachments/assets/b1652192-bef4-4373-8f6e-790cba6ab85f" />
