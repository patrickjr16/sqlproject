SELECT * FROM credit.bankchurners;

-- Total Gender

select gender,
	count(*) as total_gender
    from bankchurners
    Group by Gender;
    
-- Total Gender Of Attrited Customer

select SUM(IF(Gender="M",1,"Null")) as MaleAttritedCustomer, SUM(IF(Gender="F",1,"Null")) as FemaleAttritedCustomer
from bankchurners where Attrition_Flag= "Attrited Customer" ;

-- Total Gender Of Existing Customer

select SUM(IF(Gender="M",1,"Null")) as MaleExistingCustomer, SUM(IF(Gender="F",1,"Null")) as FemaleExistingCustomer
from bankchurners where Attrition_Flag= "Existing Customer" ;

-- Distribution of Attrited Customer based on Age Range 

select case when customer_age<30 then '0-30' 
			when customer_age between 30 and 40 then '30-40'
            when customer_age between 40 and 50 then '40-50'
            when customer_age between 50 and 60 then '50-60'
            when customer_age>50 then 'above 60' end as Age,
            count(*) as Age_AttritedCs from bankchurners where Attrition_Flag="Attrited Customer" group by Age order by Age;
            
-- Distribution of Existing Customer based on Age Range
            
select case when customer_age<30 then '0-30' 
			when customer_age between 30 and 40 then '30-40'
            when customer_age between 40 and 50 then '40-50'
            when customer_age between 50 and 60 then '50-60'
            when customer_age>50 then 'above 60' end as Age,
            count(*) Age_ExistingCs from bankchurners where Attrition_Flag="Existing Customer" group by Age order by Age;
            
-- Total Attrited Customer by Income Category

select Income_Category,  
       count(attrition_flag) as IncomeAttritedCs
from bankchurners where Attrition_Flag="Attrited Customer" 
group by Income_Category order by Income_Category desc;
            
-- Total Existing Customer by Income Category            

select Income_Category,  
       count(attrition_flag) as IncomeExistingCs
from bankchurners where Attrition_Flag="Existing Customer" 
group by Income_Category order by Income_Category desc;

-- Distribution of Customer based on Marital Status

Select attrition_flag ,
	   Marital_status, 
       count(*) from bankchurners 
       group by marital_status, Attrition_Flag order by Marital_Status;

-- Distribution of Customer based on Card Category

Select Attrition_Flag ,
	   Card_Category, 
       count(Card_Category) from bankchurners 
       group by Card_Category,Attrition_Flag order by Attrition_Flag;
       
-- Distribution of Customer based on Education
       
Select attrition_flag,
	   Education_Level, 
       Count(*) from bankchurners 
       group by Attrition_Flag, Education_Level order by Education_Level;
       
-- Distribution Attrited Customer by Period of Relationship With Bank
       
Select case when months_on_book<20 then '0-20'
		    when months_on_book between 20 and 30 then '20-30'
            when months_on_book between 30 and 40 then '30-40'
            when months_on_book between 40 and 50 then '40-50'
            when months_on_book>50 then 'Above 50' End as PeriodMonths,
            count(*) as Total_Months from bankchurners where Attrition_Flag = 'Attrited Customer' group by PeriodMonths order by PeriodMonths;
            
-- Distribution Existing Customer by Period of Relationship With Bank
            
Select case when months_on_book<20 then '0-20'
		    when months_on_book between 20 and 30 then '20-30'
            when months_on_book between 30 and 40 then '30-40'
            when months_on_book between 40 and 50 then '40-50'
            when months_on_book>50 then 'Above 50' End as PeriodMonths,
            count(*) as Total_Months from bankchurners where Attrition_Flag = 'Existing Customer' group by PeriodMonths order by PeriodMonths;
            
-- Gender Distribution of Customer by Number of Products Held 
            
select Attrition_Flag, Total_relationship_count, 
	   count(*) from bankchurners where gender="F" 
       group by Attrition_Flag, Total_Relationship_Count order by Total_Relationship_Count, Attrition_Flag;


select Attrition_Flag, Total_relationship_count, 
	   count(*) from bankchurners where gender="M" 
       group by Attrition_Flag,Total_Relationship_Count order by Total_Relationship_Count,Attrition_Flag;
       
-- Customer Distribution by Number of Inactive Months
       
Select attrition_flag,
	   Months_Inactive_12_Mon, 
       count(*) from bankchurners 
       group by Months_Inactive_12_Mon,Attrition_Flag order by Months_Inactive_12_mon;
       
-- Customer Distribution by Ratio Utilization Card
       
select attrition_flag, 
	   AVG(avg_utilization_ratio)*100
       from bankchurners group by Attrition_Flag ;

-- Distribution of Attrited Customer based on Card Limit Range

Select case when Credit_Limit<5000 then '0-5000'
		    when Credit_Limit between 5000 and 10000 then '5000-10000'
            when Credit_Limit between 10000 and 15000 then '10000-15000'
            when Credit_Limit between 15000 and 20000 then '15000-20000'
            when Credit_Limit between 20000 and 25000 then '20000-25000' 
            when credit_limit between 25000 and 30000 then '25000-30000'
            when credit_limit>30000 then 'Above 30000'End as CreditLimit,
            count(*) from bankchurners Where Attrition_Flag = 'Attrited Customer' group by CreditLimit order by CreditLimit;
            
-- Distribution of Existing Customer based on Card Limit Range
            
Select case when Credit_Limit<5000 then '0-5000'
		    when Credit_Limit between 5000 and 10000 then '5000-10000'
            when Credit_Limit between 10000 and 15000 then '10000-15000'
            when Credit_Limit between 15000 and 20000 then '15000-20000'
            when Credit_Limit between 20000 and 25000 then '20000-25000' 
            when credit_limit between 25000 and 30000 then '25000-30000'
            when credit_limit>30000 then 'Above 30000'End as CreditLimit,
            count(*) from bankchurners Where Attrition_Flag = 'Existing Customer' group by CreditLimit order by CreditLimit;
       
       



       

       




		