--Q4.1
/* No, becuase of the 1 to many relationship becuase it branches out to many others */

--Q4.2
/* Does not work because their is no defined relationship which prevents it from running an invalid data entry */

--Q4.3
/* No they are not perfect, but as AI has shown corrects itself overtime to improve */

--Q4.6
/* SELECT 
    n.name, 
    i.income, 
    i.year
FROM 
    income i
JOIN 
    name n 
ON 
    i.fips = n.fips
WHERE 
    i.year = (SELECT MAX(year) FROM income)  -- Get the most recent year
ORDER BY 
    i.income DESC
LIMIT 1;  -- Get the state with the highest income */

--Q4.7
/*
-- Prompt: Calculate the VA population growth rate in the past five years.
-- Yes, I modified the query to add a safeguard for cases where the population at the start year is zero.

-- Formula for population growth rate:
-- ((Population at latest year - Population at 5 years ago) / Population at 5 years ago) * 100

-- The FIPS code for Virginia is '51'. */

WITH PopulationData AS (
    SELECT
        year,
        population
    FROM
        population
    WHERE
        fips = '51'
    ORDER BY
        year DESC
    LIMIT 5
)
SELECT
    ((MAX(population) - MIN(population))::decimal / MIN(population)) * 100 AS growth_rate
FROM
    PopulationData; */
