
-- -- There were 33 singleton roles that should be excluded from the final data set:
-- -- only one Accounts Manager, Assistant to the Chief Financial Officer, Benefits Specialist, Chief Executive Officer, Chief Financial Officer, Engineering Manager
---- European Sales Manager, Facilities Administrative Assistant, Human Resources Manager, Information Services Manager, Maintenance Supervisor, Master Scheduler
---- Network Manager, North American Sales Manager, Pacific Sales Manager, Production Control Manager, Quality Assurance Manager, Quality Assurance Supervisor
---- Senior Design Engineer, Shipping and Receiving Supervisor, Vice President of Engineering, Vice President of Production, Vice President of Sales
 
SELECT B.BusinessEntityID Employee_ID, B.NationalIDNumber Employee_Identifier, B.JobTitle, B.role_occurrence Number_Of_Employees_In_Role,
B.HireDate, B.SalariedFlag, B.OrganizationLevel, B.VacationHours, B.SickLeaveHours

FROM   
    (  SELECT *  FROM

		(  SELECT BusinessEntityID, NationalIDNumber, OrganizationLevel, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, VacationHours, SickLeaveHours, SalariedFlag, CurrentFlag,
			row_number () OVER (PARTITION BY JobTitle ORDER BY JobTitle ) AS role_occurrence

           FROM [AdventureWorks2022].[HumanResources].[Employee] (nolock)  ) Q

           WHERE Q.role_occurrence > 1

       ) AS A

LEFT JOIN

    (  SELECT *  FROM

               ( SELECT BusinessEntityID, NationalIDNumber, OrganizationLevel, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, VacationHours, SickLeaveHours, SalariedFlag, CurrentFlag,
                   row_number () OVER (PARTITION BY JobTitle ORDER BY JobTitle ) AS role_occurrence

                FROM [AdventureWorks2022].[HumanResources].[Employee] (nolock) ) P


       )      As B


       ON  B.JobTitle = A.JobTitle 

	   WHERE B.CurrentFlag = 1 -- only select active employees
	group by  B.BusinessEntityID , B.NationalIDNumber, B.JobTitle, B.role_occurrence, B.HireDate, B.SalariedFlag, B.OrganizationLevel, B.VacationHours, B.SickLeaveHours
order by B.JobTitle

