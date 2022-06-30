SELECT * FROM games.vgsales;


-- JUMLAH GENRE

SELECT  Genre,
		count(Genre) AS Total_Genre 
		FROM vgsales 
		GROUP BY genre
		ORDER BY Total_Genre DESC;
        
-- TOP 5 SALES GAMES


SELECT Name, 
	   Genre,
	   Round(NA_sales + EU_sales + JP_sales + Other_sales, 2) AS Total_Sales
FROM vgsales
ORDER BY Total_sales DESC
LIMIT 5;
       

-- TOP 5 SALES PUBLISHER

SELECT Publisher,
	   Round(SUM(NA_sales + EU_sales + JP_sales + Other_sales), 2) as Total_Sales
FROM vgsales
GROUP BY Publisher
LIMIT 5;
       
-- TOTAL SALES PER SERVER

SELECT Round(SUM(NA_sales),2) AS Total_NA,
	   Round(SUM(EU_Sales),2) AS Total_EU,
       Round(SUM(JP_Sales),2) AS Total_JP,
       Round(SUM(Other_Sales),2) AS Total_Other
FROM vgsales;

-- TOTAL SALES PER PLATFORM

SELECT DISTINCT Platform,
	   Count(Platform) AS Total_Platform,
       Round(SUM(NA_sales + EU_sales + JP_sales + Other_sales), 2) AS Total_Sales
FROM vgsales
GROUP BY Platform
ORDER BY Total_Platform DESC;
       

       

       

	   