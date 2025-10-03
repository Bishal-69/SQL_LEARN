-- DATA CLEANING ----------------------                      working with world_layoffs  (db) 

-- https://www.kaggle.com/datasets/swaptr/layoffs-2022  (dowload layoffs ( table) )

select *
from layoffs;


-- 1. Remove Duplicates
-- 2.Standardize the data
-- 3.NUll values or blank Values
-- 4. Remove any Columns ( irrelivant colns)

-- _____________________________________________________________________________________________________________________________________________________________________________________________________________________________
-- REMOVING Duplicates

CREATE TABLE layoffs_staging   -- creating same table as layoffs cuz we want the raw data (layoffs ) as it is 
LIKE layoffs;


select *
from layoffs_staging;


INSERT INTO layoffs_staging   -- just copying values of layoffs
SELECT *
FROM layoffs;


-- --------------------------------------------------------------------------------------------------------------------------------


WITH duplicate_row_CTE AS (                       -- sub query used  to return the row ( duplicate rows)

    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage , country, funds_raised
            ORDER BY company
        ) AS row_num
    FROM layoffs_staging
)

SELECT *
FROM duplicate_row_CTE
WHERE row_num > 1;


-- diving into duplicated company just to check -------------
select * 
from layoffs_staging
where company = 'cazoo';

select * 
from layoffs_staging
where company = 'Beyond Meat';

-- --------------------------------------------------------------------------------------------



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` bigint DEFAULT NULL,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * 
from layoffs_staging2;


INSERT INTO layoffs_staging2
 SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage , country, funds_raised
            ORDER BY company
        ) AS row_num
    FROM layoffs_staging;


SET SQL_SAFE_UPDATES = 0;  -- off the safe mode

DELETE 
from layoffs_staging2
where row_num >1;

select * 
from layoffs_staging2;

-- __________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

-- Standarding data now  ( look at company , industry 

SELECT company, (TRIM(company))
from layoffs_staging2;

UPDATE layoffs_staging2         -- removing white space from our company name 
SET company = TRIM(company);

select distinct company           -- all set here
from layoffs_staging2;

-- -----------------------------------------------------------------------------------
select distinct industry   -- all good here
from layoffs_staging2
order by 1;

-- -----------------------------------------------------------------------------------  
-- location work 

-- Add a region column to preserve U.S. vs Non-U.S. region

ALTER TABLE layoffs_staging2 ADD COLUMN region VARCHAR(50);

-- Step 1: Set region based on original text
UPDATE layoffs_staging2
SET region = 'Non-U.S.'
WHERE location LIKE '%,Non-U.S.%';

UPDATE layoffs_staging2
SET region = 'U.S.'
WHERE region IS NULL;

-- Step 2: Clean location names (remove the suffix)
UPDATE layoffs_staging2
SET location = TRIM(REPLACE(location, ',Non-U.S.', ''));


SELECT DISTINCT location, region
FROM layoffs_staging2
ORDER BY location;

select *
from layoffs_staging2;

-- work on contry ------------------------------------------------------------------------------------------------------------------
 
SELECT DISTINCT country  -- all good
FROM layoffs_staging2
ORDER BY country;


--   DATE convert into time series --------------------------------------------------------------------------------------------------------
Update layoffs_staging2                             -- updating  into proper time series
SET `date`=str_to_date(`date`,'%m/%d/%Y') ;

ALTER TABLE layoffs_staging2                         -- changing ( date:text ) type to ( date: date ) type
MODIFY COLUMN `date` DATE;

select date 
from layoffs_staging2;
-- __________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

-- removing NULL values or Blank values

select*
from layoffs_staging2
where (industry IS NULL OR industry = '') ;


SELECT *
FROM layoffs_staging2
WHERE (percentage_laid_off IS NULL OR TRIM(percentage_laid_off) = '')
  AND (funds_raised IS NULL OR TRIM(funds_raised) = '');

   

   
   

