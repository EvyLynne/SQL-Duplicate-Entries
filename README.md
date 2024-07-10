# SQL-Duplicate-Entries
Returning Duplicate entries in a table for root cause anaylsis of how duplicate rows are being inserted into a table by the software solution.  
This was different than just locating duplicate rows and deleting them.  <br>
The client needed all rows returned where there were duplicate entries including the first row, but no rows without duplicates.  <br>
UPDATE: I ran into a second use case for this solution.  I needed to check a table with slowly changing dimensions to verify I pull the correct records.  Since I'm becoming familiar with the data, I needed to see the recrods with multiple entries. <br>
To publish on GitHub, I used the AdventureWorks database with a contrived example. <br>
This query returns the rows in a table with duplicate entries along with the first occurrence and each consecutive occurrence but removes any rows that do not have a duplicate. <br>
This is written in T-SQL for SQL Server Version:  Microsoft SQL Server 2022 (RTM-GDR) (KB5029379) - 16.0.1105.1 (X64)   Aug 24 2023 02:40:55   Copyright (C) 2022 Microsoft Corporation  Developer Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 22621: ) (Hypervisor) <br>
For purpose of this demo, I used the AdventureWorks2022 database pulling from the HumanResources.Employee table.  I used the JobTitle field for duplicate entries. https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
For this sample, I found employee information for all jobs with multiple active employees grouped by hire date, salaried / not-salaried, organization level, vacation hours and sick leave hours.   
