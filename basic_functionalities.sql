select * from locations

select * from make_details

select * from stolen_vehicles ORDER BY date_stolen

SELECT
vehicle_type, 
YEAR(date_stolen) AS 'year_of_stolen', 
COUNT(*) AS 'amounts_of_thefts'
FROM 
stolen_vehicles 
WHERE 
vehicle_type IS NOT NULL
GROUP BY vehicle_type, YEAR(date_stolen)
ORDER BY 'amounts_of_thefts' DESC;

-- 2
SELECT
md.make_name,
COUNT(*) AS 'steals'
FROM
make_details md 
JOIN stolen_vehicles sv 
ON md.make_id = sv.make_id
GROUP BY md.make_name
ORDER BY 'steals' DESC

-- 3
SELECT
l.region,
COUNT(*) AS 'steals'
FROM
locations l
JOIN stolen_vehicles sv
ON l.location_id = sv.location_id
GROUP BY
l.region
ORDER BY
'steals' DESC

-- 4
SELECT 
DATENAME(WEEKDAY, date_stolen) AS 'day_of_week',
COUNT(*) AS 'steals'
FROM 
stolen_vehicles
GROUP BY 
DATENAME(WEEKDAY, date_stolen)
ORDER BY
'steals' DESC

-- 5
SELECT
l.density,
COUNT(*) AS 'steals'
FROM
locations l 
JOIN stolen_vehicles sv
ON l.location_id = sv.location_id
GROUP BY 
l.density
ORDER BY 'steals' DESC 

-- WINDOWS FUNCTIONS

-- 6 
SELECT DISTINCT
vehicle_type,
model_year,
date_stolen,
FORMAT(date_stolen, 'yyyy-MM') AS 'year_month',
COUNT(*) OVER(PARTITION BY FORMAT(date_stolen, 'yyyy-MM')) 'stolen_cars_per_month'
FROM
stolen_vehicles
WHERE 
vehicle_type IS NOT NULL
ORDER BY
'year_month'

-- 7
SELECT
model_year,
COUNT(*) OVER(PARTITION BY model_year) 'stolen_cars_by_model_year'
FROM
stolen_vehicles
WHERE 
vehicle_type IS NOT NULL
ORDER BY model_year











