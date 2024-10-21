create database steel_industry_db ;
use steel_industry_db ;

CREATE TABLE steel_production (
  `Grade of Steel` VARCHAR(255),
  `Automotive application` VARCHAR(50),
  `Scrap Steel (%)` varchar(50),
  `DRI or Pig Iron (%)`VARCHAR(50) ,
  `Iron Ore (%)`VARCHAR(50),
  `Phosphorus (%)` FLOAT,
  `Carbon (%)` FLOAT,
  `Melting Time (EAF)` VARCHAR(50),
  `Production Volume` VARCHAR(50),
  `Yield` VARCHAR(50),
  `BF Stage Cycle Time` VARCHAR(50),
  `EAF Stage Cycle Time` VARCHAR(50),
  `LRF Stage Cycle Time` VARCHAR(50),
  `Total Cycle Time` VARCHAR(50),
  `BF Electricity (kWh)` VARCHAR(50),
  `EAF Electricity (kWh)` VARCHAR(50),
  `LRF Electricity (kWh)` VARCHAR(50),
  `Total Electricity Consumption (kWh)` INTEGER,
  `Original Cost per Ton` VARCHAR(60),
  `New Scrap Steel (%)` VARCHAR(50),
  `New DRI or Pig Iron (%)` VARCHAR(50),
  `New Iron Ore (%)` INTEGER,
  `New Electricity Consumption (kWh) Total` INTEGER,
  `BF Electricity (kWh) (New)` VARCHAR(50),
  `EAF Electricity (kWh) (New)` VARCHAR(50),
  `LRF Electricity (kWh) (New)` VARCHAR(50),
  `Estimated Cost per Ton ($)` VARCHAR(50)
);

-- LOAD DATA ---------------

-- LOADED DATA USING IMPORT DATA WIZARD------------------ 

select * from steel_production ;



-- FIRST BUSSINESS MOMENT
-- MEAN
SELECT 
    AVG(`Scrap Steel (%)`) AS mean_scrap_steel,
    AVG(`DRI or Pig Iron (%)`) AS mean_dri_pig_iron,
    AVG(`Iron Ore (%)`) AS mean_iron_ore,
    AVG(`Phosphorus (%)`) AS mean_phosphorus,
    AVG(`Carbon (%)`) AS mean_carbon,
    AVG(`Melting Time (EAF)`) AS mean_melting_time,
    AVG(`Production Volume`) AS mean_production_volume,
    AVG(CAST(REPLACE(`Yield`, '%', '') AS DECIMAL(10, 2))) AS Mean_Yeild,
    AVG(`BF Stage Cycle Time`) AS mean_bf_stage_time,
    AVG(`EAF Stage Cycle Time`) AS mean_eaf_stage_time,
    AVG(`LRF Stage Cycle Time`) AS mean_lrf_stage_time,
    AVG(`Total Cycle Time`) AS mean_total_cycle_time,
    AVG(`BF Electricity (kWh)`) AS mean_bf_electricity,
    AVG(`EAF Electricity (kWh)`) AS mean_eaf_electricity,
    AVG(`LRF Electricity (kWh)`) AS mean_lrf_electricity,
    AVG(`Total Electricity Consumption (kWh)`) AS mean_total_electricity,
    AVG(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS Mean_original_Cost_per_ton,
    AVG(`New Scrap Steel (%)`) AS mean_new_scrap_steel,
    AVG(`New DRI or Pig Iron (%)`) AS mean_new_dri_pig_iron,
    AVG(`New Iron Ore (%)`) AS mean_new_iron_ore,
    AVG(`New Electricity Consumption (kWh) Total`) AS mean_new_total_electricity,
    AVG(`BF Electricity (kWh) (New)`) AS mean_new_bf_electricity,
    AVG(`EAF Electricity (kWh) (New)`) AS mean_new_eaf_electricity,
    AVG(`LRF Electricity (kWh) (New)`) AS mean_new_lrf_electricity,
    AVG(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))) AS Mean_Estimated_Cost_per_ton
FROM
    steel_production;
    

# MEDIAN
SELECT
      (SELECT AVG(sub.scrap_steel) AS Scrap_Steel_Median
FROM (
    SELECT 
        `Scrap Steel (%)` AS scrap_steel,
        ROW_NUMBER() OVER (ORDER BY `Scrap Steel (%)`) AS rn,
        COUNT(*) OVER () AS cnt
    FROM steel_production
) sub
WHERE sub.rn IN (FLOOR((sub.cnt + 1) / 2), CEIL((sub.cnt + 1) / 2))
) AS Scrap_Steel_Median,


    (SELECT AVG(`DRI or Pig Iron (%)`)
     FROM (
        SELECT `DRI or Pig Iron (%)`,
               ROW_NUMBER() OVER (ORDER BY `DRI or Pig Iron (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS DRI_or_Pig_Iron_Median,

    (SELECT AVG(`Iron Ore (%)`)
     FROM (
        SELECT `Iron Ore (%)`,
               ROW_NUMBER() OVER (ORDER BY `Iron Ore (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Iron_Ore_Median,

    (SELECT AVG(`Phosphorus (%)`)
     FROM (
        SELECT `Phosphorus (%)`,
               ROW_NUMBER() OVER (ORDER BY `Phosphorus (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Phosphorus_Median,

    (SELECT AVG(`Carbon (%)`)
     FROM (
        SELECT `Carbon (%)`,
               ROW_NUMBER() OVER (ORDER BY `Carbon (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Carbon_Median,

    (SELECT AVG(`Melting Time (EAF)`)
     FROM (
        SELECT `Melting Time (EAF)`,
               ROW_NUMBER() OVER (ORDER BY `Melting Time (EAF)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Melting_Time_EAF_Median,

    (SELECT AVG(`Production Volume`)
     FROM (
        SELECT `Production Volume`,
               ROW_NUMBER() OVER (ORDER BY `Production Volume`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Production_Volume_Median,

    (SELECT AVG(`Yield`)
     FROM (
        SELECT `Yield`,
               ROW_NUMBER() OVER (ORDER BY `Yield`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Yield_Median,

    (SELECT AVG(`BF Stage Cycle Time`)
     FROM (
        SELECT `BF Stage Cycle Time`,
               ROW_NUMBER() OVER (ORDER BY `BF Stage Cycle Time`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS BF_Stage_Cycle_Time_Median,

    (SELECT AVG(`EAF Stage Cycle Time`)
     FROM (
        SELECT `EAF Stage Cycle Time`,
               ROW_NUMBER() OVER (ORDER BY `EAF Stage Cycle Time`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS EAF_Stage_Cycle_Time_Median,

    (SELECT AVG(`LRF Stage Cycle Time`)
     FROM (
        SELECT `LRF Stage Cycle Time`,
               ROW_NUMBER() OVER (ORDER BY `LRF Stage Cycle Time`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS LRF_Stage_Cycle_Time_Median,

    (SELECT AVG(`Total Cycle Time`)
     FROM (
        SELECT `Total Cycle Time`,
               ROW_NUMBER() OVER (ORDER BY `Total Cycle Time`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Total_Cycle_Time_Median,

    (SELECT AVG(`BF Electricity (kWh)`)
     FROM (
        SELECT `BF Electricity (kWh)`,
               ROW_NUMBER() OVER (ORDER BY `BF Electricity (kWh)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS BF_Electricity_Median,

    (SELECT AVG(`EAF Electricity (kWh)`)
     FROM (
        SELECT `EAF Electricity (kWh)`,
               ROW_NUMBER() OVER (ORDER BY `EAF Electricity (kWh)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS EAF_Electricity_Median,

    (SELECT AVG(`LRF Electricity (kWh)`)
     FROM (
        SELECT `LRF Electricity (kWh)`,
               ROW_NUMBER() OVER (ORDER BY `LRF Electricity (kWh)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS LRF_Electricity_Median,

    (SELECT AVG(`Total Electricity Consumption (kWh)`)
     FROM (
        SELECT `Total Electricity Consumption (kWh)`,
               ROW_NUMBER() OVER (ORDER BY `Total Electricity Consumption (kWh)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Total_Electricity_Consumption_Median,

    (SELECT AVG(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS Mean_original_Cost_per_ton
     FROM (
        SELECT `Original Cost per Ton`,
               ROW_NUMBER() OVER (ORDER BY `Original Cost per Ton`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Original_Cost_per_Ton_Median,

    (SELECT AVG(`New Scrap Steel (%)`)
     FROM (
        SELECT `New Scrap Steel (%)`,
               ROW_NUMBER() OVER (ORDER BY `New Scrap Steel (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_Scrap_Steel_Median,

    (SELECT AVG(`New DRI or Pig Iron (%)`)
     FROM (
        SELECT `New DRI or Pig Iron (%)`,
               ROW_NUMBER() OVER (ORDER BY `New DRI or Pig Iron (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_DRI_or_Pig_Iron_Median,

    (SELECT AVG(`New Iron Ore (%)`)
     FROM (
        SELECT `New Iron Ore (%)`,
               ROW_NUMBER() OVER (ORDER BY `New Iron Ore (%)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_Iron_Ore_Median,

    (SELECT AVG(`New Electricity Consumption (kWh) Total`)
     FROM (
        SELECT `New Electricity Consumption (kWh) Total`,
               ROW_NUMBER() OVER (ORDER BY `New Electricity Consumption (kWh) Total`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_Electricity_Consumption_Total_Median,

    (SELECT AVG(`BF Electricity (kWh) (New)`)
     FROM (
        SELECT `BF Electricity (kWh) (New)`,
               ROW_NUMBER() OVER (ORDER BY `BF Electricity (kWh) (New)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_BF_Electricity_Median,

    (SELECT AVG(`EAF Electricity (kWh) (New)`)
     FROM (
        SELECT `EAF Electricity (kWh) (New)`,
               ROW_NUMBER() OVER (ORDER BY `EAF Electricity (kWh) (New)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_EAF_Electricity_Median,

    (SELECT AVG(`LRF Electricity (kWh) (New)`)
     FROM (
        SELECT `LRF Electricity (kWh) (New)`,
               ROW_NUMBER() OVER (ORDER BY `LRF Electricity (kWh) (New)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS New_LRF_Electricity_Median,

   
  (SELECT AVG(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))) AS Mean_Estimated_Cost_per_ton
     FROM (
        SELECT `Estimated Cost per Ton ($)`,
               ROW_NUMBER() OVER (ORDER BY `Estimated Cost per Ton ($)`) AS rn,
               COUNT(*) OVER () AS cnt
        FROM steel_production
     ) sub
     WHERE sub.rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
    ) AS Estimated_Cost_per_Ton_Median;

# MODE
SELECT
    -- Mode for Scrap Steel (%)
   ( SELECT `Scrap Steel (%)`
FROM steel_production
GROUP BY `Scrap Steel (%)`
ORDER BY COUNT(*) DESC, `Scrap Steel (%)` ASC
LIMIT 1) AS `Mode_Scrap Steel (%)`,

    
    -- Mode for DRI or Pig Iron (%)
    (SELECT `DRI or Pig Iron (%)`
     FROM steel_production
     GROUP BY `DRI or Pig Iron (%)`
     ORDER BY COUNT(*) DESC, `DRI or Pig Iron (%)` ASC
     LIMIT 1) AS `Mode_DRI or Pig Iron (%)`,
    
    -- Mode for Iron Ore (%)
    (SELECT `Iron Ore (%)`
     FROM steel_production
     GROUP BY `Iron Ore (%)`
     ORDER BY COUNT(*) DESC, `Iron Ore (%)` ASC
     LIMIT 1) AS `Mode_Iron Ore (%)`,
    
    -- Mode for Phosphorus (%)
    (SELECT `Phosphorus (%)`
     FROM steel_production
     GROUP BY `Phosphorus (%)`
     ORDER BY COUNT(*) DESC, `Phosphorus (%)` ASC
     LIMIT 1) AS `Mode_Phosphorus (%)`,
    
    -- Mode for Carbon (%)
    (SELECT `Carbon (%)`
     FROM steel_production
     GROUP BY `Carbon (%)`
     ORDER BY COUNT(*) DESC, `Carbon (%)` ASC
     LIMIT 1) AS `Mode_Carbon (%)`,
    
    -- Mode for Melting Time (EAF)
    (SELECT `Melting Time (EAF)`
     FROM steel_production
     GROUP BY `Melting Time (EAF)`
     ORDER BY COUNT(*) DESC, `Melting Time (EAF)` ASC
     LIMIT 1) AS `Mode_Melting Time (EAF)`,

    -- Mode for Production Volume
    (SELECT `Production Volume`
     FROM steel_production
     GROUP BY `Production Volume`
     ORDER BY COUNT(*) DESC, `Production Volume` ASC
     LIMIT 1) AS `Mode_Production Volume`,

    -- Mode for Yield
    (SELECT `Yield`
     FROM steel_production
     GROUP BY `Yield`
     ORDER BY COUNT(*) DESC, `Yield` ASC
     LIMIT 1) AS `Mode_Yield`,

    -- Mode for BF Stage Cycle Time
    (SELECT `BF Stage Cycle Time`
     FROM steel_production
     GROUP BY `BF Stage Cycle Time`
     ORDER BY COUNT(*) DESC, `BF Stage Cycle Time` ASC
     LIMIT 1) AS `Mode_BF Stage Cycle Time`,

    -- Mode for EAF Stage Cycle Time
    (SELECT `EAF Stage Cycle Time`
     FROM steel_production
     GROUP BY `EAF Stage Cycle Time`
     ORDER BY COUNT(*) DESC, `EAF Stage Cycle Time` ASC
     LIMIT 1) AS `Mode_EAF Stage Cycle Time`,

    -- Mode for LRF Stage Cycle Time
    (SELECT `LRF Stage Cycle Time`
     FROM steel_production
     GROUP BY `LRF Stage Cycle Time`
     ORDER BY COUNT(*) DESC, `LRF Stage Cycle Time` ASC
     LIMIT 1) AS `Mode_LRF Stage Cycle Time`,

    -- Mode for Total Cycle Time
    (SELECT  `Total Cycle Time`
     FROM steel_production
     GROUP BY  `Total Cycle Time`
     ORDER BY COUNT(*) DESC,  `Total Cycle Time` ASC
     LIMIT 1) AS `Mode_Total Cycle Time`,

    -- Mode for BF Electricity (kWh)
    (SELECT `BF Electricity (kWh)`
     FROM steel_production
     GROUP BY `BF Electricity (kWh)`
     ORDER BY COUNT(*) DESC, `BF Electricity (kWh)` ASC
     LIMIT 1) AS `Mode_BF Electricity (kWh)`,

    -- Mode for EAF Electricity (kWh)
    (SELECT `EAF Electricity (kWh)`
     FROM steel_production
     GROUP BY `EAF Electricity (kWh)`
     ORDER BY COUNT(*) DESC, `EAF Electricity (kWh)` ASC
     LIMIT 1) AS `Mode_EAF Electricity (kWh)`,

    -- Mode for LRF Electricity (kWh)
    (SELECT `LRF Electricity (kWh)`
     FROM steel_production
     GROUP BY `LRF Electricity (kWh)`
     ORDER BY COUNT(*) DESC, `LRF Electricity (kWh)` ASC
     LIMIT 1) AS `Mode_LRF Electricity (kWh)`,

    -- Mode for Total Electricity Consumption (kWh)
    (SELECT `Total Electricity Consumption (kWh)`
     FROM steel_production
     GROUP BY `Total Electricity Consumption (kWh)`
     ORDER BY COUNT(*) DESC, `Total Electricity Consumption (kWh)` ASC
     LIMIT 1) AS `Mode_Total Electricity Consumption (kWh)`,

    -- Mode for Original Cost per Ton
    (SELECT `Original Cost per Ton`
     FROM steel_production
     GROUP BY `Original Cost per Ton`
     ORDER BY COUNT(*) DESC, `Original Cost per Ton` ASC
     LIMIT 1) AS `Mode_Original Cost per Ton`,

    -- Mode for New Scrap Steel (%)
    (SELECT `New Scrap Steel (%)`
     FROM steel_production
     GROUP BY `New Scrap Steel (%)`
     ORDER BY COUNT(*) DESC, `New Scrap Steel (%)` ASC
     LIMIT 1) AS `Mode_New Scrap Steel (%)`,

    -- Mode for New DRI or Pig Iron (%)
    (SELECT `New DRI or Pig Iron (%)`
     FROM steel_production
     GROUP BY `New DRI or Pig Iron (%)`
     ORDER BY COUNT(*) DESC, `New DRI or Pig Iron (%)` ASC
     LIMIT 1) AS `Mode_New DRI or Pig Iron (%)`,

    -- Mode for New Iron Ore (%)
    (SELECT `New Iron Ore (%)`
     FROM steel_production
     GROUP BY `New Iron Ore (%)`
     ORDER BY COUNT(*) DESC, `New Iron Ore (%)` ASC
     LIMIT 1) AS `Mode_New Iron Ore (%)`,

    -- Mode for New Electricity Consumption (kWh) Total
    (SELECT `New Electricity Consumption (kWh) Total`
     FROM steel_production
     GROUP BY `New Electricity Consumption (kWh) Total`
     ORDER BY COUNT(*) DESC, `New Electricity Consumption (kWh) Total` ASC
     LIMIT 1) AS `Mode_New Electricity Consumption (kWh) Total`,

    -- Mode for BF Electricity (kWh) (New)
    (SELECT `BF Electricity (kWh) (New)`
     FROM steel_production
     GROUP BY `BF Electricity (kWh) (New)`
     ORDER BY COUNT(*) DESC, `BF Electricity (kWh) (New)` ASC
     LIMIT 1) AS `Mode_BF Electricity (kWh) (New)`,

    -- Mode for EAF Electricity (kWh) (New)
    (SELECT `EAF Electricity (kWh) (New)`
     FROM steel_production
     GROUP BY `EAF Electricity (kWh) (New)`
     ORDER BY COUNT(*) DESC, `EAF Electricity (kWh) (New)` ASC
     LIMIT 1) AS `Mode_EAF Electricity (kWh) (New)`,

    -- Mode for LRF Electricity (kWh) (New)
    (SELECT `LRF Electricity (kWh) (New)`
     FROM steel_production
     GROUP BY `LRF Electricity (kWh) (New)`
     ORDER BY COUNT(*) DESC, `LRF Electricity (kWh) (New)` ASC
     LIMIT 1) AS `Mode_LRF Electricity (kWh) (New)`,

    -- Mode for Estimated Cost per Ton ($)
    (SELECT `Estimated Cost per Ton ($)`
     FROM steel_production
     GROUP BY `Estimated Cost per Ton ($)`
     ORDER BY COUNT(*) DESC, `Estimated Cost per Ton ($)` ASC
     LIMIT 1) AS `Mode_Estimated Cost per Ton ($)`
;




-- SECOND BUSSINESS MOMENT
-- VARIANCE
SELECT 
    VARIANCE(`Scrap Steel (%)`) AS var_scrap_steel,
    VARIANCE(`DRI or Pig Iron (%)`) AS var_dri_pig_iron,
    VARIANCE(`Iron Ore (%)`) AS var_iron_ore,
    VARIANCE(`Phosphorus (%)`) AS var_phosphorus,
    VARIANCE(`Carbon (%)`) AS var_carbon,
    VARIANCE(`Melting Time (EAF)`) AS var_melting_time_eaf,
    VARIANCE(`Production Volume`) AS var_production_volume,
    VARIANCE(`Yield`) AS var_yield,
    VARIANCE(`BF Stage Cycle Time`) AS var_bf_stage_cycle_time,
    VARIANCE(`EAF Stage Cycle Time`) AS var_eaf_stage_cycle_time,
    VARIANCE(`LRF Stage Cycle Time`) AS var_lrf_stage_cycle_time,
    VARIANCE(`Total Cycle Time`) AS var_total_cycle_time,
    VARIANCE(`BF Electricity (kWh)`) AS var_bf_electricity_kWh,
    VARIANCE(`EAF Electricity (kWh)`) AS var_eaf_electricity_kWh,
    VARIANCE(`LRF Electricity (kWh)`) AS var_lrf_electricity_kWh,
    VARIANCE(`Total Electricity Consumption (kWh)`) AS var_total_electricity_consumption,
    VARIANCE(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS Var_original_Cost_per_ton,
    VARIANCE(`New Scrap Steel (%)`) AS var_new_scrap_steel,
    VARIANCE(`New DRI or Pig Iron (%)`) AS var_new_dri_pig_iron,
    VARIANCE(`New Iron Ore (%)`) AS var_new_iron_ore,
    VARIANCE(`New Electricity Consumption (kWh) Total`) AS var_new_total_electricity_consumption,
    VARIANCE(`BF Electricity (kWh) (New)`) AS var_bf_electricity_kWh_new,
    VARIANCE(`EAF Electricity (kWh) (New)`) AS var_eaf_electricity_kWh_new,
    VARIANCE(`LRF Electricity (kWh) (New)`) AS var_lrf_electricity_kWh_new,
   VARIANCE(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))) AS Var_Estimated_Cost_per_ton
FROM 
    steel_production;

-- STANDARD DEVIATION
SELECT 
    STDDEV(`Scrap Steel (%)`) AS STDDEV_scrap_steel,
    STDDEV(`DRI or Pig Iron (%)`) AS STDDEV_dri_pig_iron,
    STDDEV(`Iron Ore (%)`) AS STDDEV_iron_ore,
    STDDEV(`Phosphorus (%)`) AS STDDEV_phosphorus,
    STDDEV(`Carbon (%)`) AS STDDEV_carbon,
    STDDEV(`Melting Time (EAF)`) AS STDDEV_melting_time_eaf,
    STDDEV(`Production Volume`) AS STDDEV_production_volume,
    STDDEV(`Yield`) AS STDDEV_yield,
    STDDEV(`BF Stage Cycle Time`) AS STDDEV_bf_stage_cycle_time,
    STDDEV(`EAF Stage Cycle Time`) AS STDDEV_eaf_stage_cycle_time,
    STDDEV(`LRF Stage Cycle Time`) AS STDDEV_lrf_stage_cycle_time,
    STDDEV(`Total Cycle Time`) AS STDDEV_total_cycle_time,
    STDDEV(`BF Electricity (kWh)`) AS STDDEV_bf_electricity_kWh,
    STDDEV(`EAF Electricity (kWh)`) AS STDDEV_eaf_electricity_kWh,
    STDDEV(`LRF Electricity (kWh)`) AS STDDEV_lrf_electricity_kWh,
    STDDEV(`Total Electricity Consumption (kWh)`) AS STDDEV_total_electricity_consumption,
     STDDEV(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS STDDEV_Original_Cost_per_ton,
    STDDEV(`New Scrap Steel (%)`) AS STDDEV_new_scrap_steel,
    STDDEV(`New DRI or Pig Iron (%)`) AS STDDEV_new_dri_pig_iron,
    STDDEV(`New Iron Ore (%)`) AS STDDEV_new_iron_ore,
    STDDEV(`New Electricity Consumption (kWh) Total`) AS STDDEV_new_total_electricity_consumption,
    STDDEV(`BF Electricity (kWh) (New)`) AS STDDEV_bf_electricity_kWh_new,
    STDDEV(`EAF Electricity (kWh) (New)`) AS STDDEV_eaf_electricity_kWh_new,
    STDDEV(`LRF Electricity (kWh) (New)`) AS STDDEV_lrf_electricity_kWh_new,
    STDDEV(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))) AS STDDEV_Estimated_Cost_per_ton
FROM 
    steel_production;
    
# Range
SELECT
    MAX(CAST(`Scrap Steel (%)` AS DECIMAL)) - MIN(CAST(`Scrap Steel (%)` AS DECIMAL)) AS range_scrap_steel,
    MAX(CAST(`DRI or Pig Iron (%)` AS DECIMAL)) - MIN(CAST(`DRI or Pig Iron (%)` AS DECIMAL)) AS range_dri_pig_iron,
    MAX(CAST(`Iron Ore (%)` AS DECIMAL)) - MIN(CAST(`Iron Ore (%)` AS DECIMAL)) AS range_iron_ore,
    MAX(CAST(`Phosphorus (%)` AS DECIMAL)) - MIN(CAST(`Phosphorus (%)` AS DECIMAL)) AS range_phosphorus,
    MAX(CAST(`Carbon (%)` AS DECIMAL)) - MIN(CAST(`Carbon (%)` AS DECIMAL)) AS range_carbon,
    MAX(CAST(`Melting Time (EAF)` AS DECIMAL)) - MIN(CAST(`Melting Time (EAF)` AS DECIMAL)) AS range_melting_time_eaf,
    MAX(CAST(`Production Volume` AS DECIMAL)) - MIN(CAST(`Production Volume` AS DECIMAL)) AS range_production_volume,
    (MAX(CAST(REPLACE(`Yield`, '%', '') AS DECIMAL) / 100.0) - MIN(CAST(REPLACE(`Yield`, '%', '') AS DECIMAL) / 100.0)) AS range_yield,
    MAX(CAST(`BF Stage Cycle Time` AS DECIMAL)) - MIN(CAST(`BF Stage Cycle Time` AS DECIMAL)) AS range_bf_stage_cycle_time,
    MAX(CAST(`EAF Stage Cycle Time` AS DECIMAL)) - MIN(CAST(`EAF Stage Cycle Time` AS DECIMAL)) AS range_eaf_stage_cycle_time,
    MAX(CAST(`LRF Stage Cycle Time` AS DECIMAL)) - MIN(CAST(`LRF Stage Cycle Time` AS DECIMAL)) AS range_lrf_stage_cycle_time,
    MAX(CAST(`Total Cycle Time` AS DECIMAL)) - MIN(CAST(`Total Cycle Time` AS DECIMAL)) AS range_total_cycle_time,
    MAX(CAST(`BF Electricity (kWh)` AS DECIMAL)) - MIN(CAST(`BF Electricity (kWh)` AS DECIMAL)) AS range_bf_electricity_kwh,
    MAX(CAST(`EAF Electricity (kWh)` AS DECIMAL)) - MIN(CAST(`EAF Electricity (kWh)` AS DECIMAL)) AS range_eaf_electricity_kwh,
    MAX(CAST(`LRF Electricity (kWh)` AS DECIMAL)) - MIN(CAST(`LRF Electricity (kWh)` AS DECIMAL)) AS range_lrf_electricity_kwh,
    MAX(CAST(`Total Electricity Consumption (kWh)` AS DECIMAL)) - MIN(CAST(`Total Electricity Consumption (kWh)` AS DECIMAL)) AS range_total_electricity_consumption_kwh,
   MAX(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL))-
 MIN(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL)) AS range_original_cost_per_ton,
    MAX(CAST(`New Scrap Steel (%)` AS DECIMAL)) - MIN(CAST(`New Scrap Steel (%)` AS DECIMAL)) AS range_new_scrap_steel,
    MAX(CAST(`New DRI or Pig Iron (%)` AS DECIMAL)) - MIN(CAST(`New DRI or Pig Iron (%)` AS DECIMAL)) AS range_new_dri_pig_iron,
    MAX(CAST(`New Iron Ore (%)` AS DECIMAL)) - MIN(CAST(`New Iron Ore (%)` AS DECIMAL)) AS range_new_iron_ore,
    MAX(CAST(`New Electricity Consumption (kWh) Total` AS DECIMAL)) - MIN(CAST(`New Electricity Consumption (kWh) Total` AS DECIMAL)) AS range_new_total_electricity_consumption_kwh,
    MAX(CAST(`BF Electricity (kWh) (New)` AS DECIMAL)) - MIN(CAST(`BF Electricity (kWh) (New)` AS DECIMAL)) AS range_bf_electricity_kwh_new,
    MAX(CAST(`EAF Electricity (kWh) (New)` AS DECIMAL)) - MIN(CAST(`EAF Electricity (kWh) (New)` AS DECIMAL)) AS range_eaf_electricity_kwh_new,
    MAX(CAST(`LRF Electricity (kWh) (New)` AS DECIMAL)) - MIN(CAST(`LRF Electricity (kWh) (New)` AS DECIMAL)) AS range_lrf_electricity_kwh_new,
    MAX(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL))-
 MIN(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL))AS range_estimated_cost_per_ton
FROM
    steel_production;
    
    
-- THIRD BUSSINESS MOMENT
-- SKEWNESS



SELECT
    ROUND(
        AVG(POW(`Scrap Steel (%)` - (SELECT AVG(`Scrap Steel (%)`) FROM steel_production), 3)) /
        POW(STD(`Scrap Steel (%)`), 3), 4
    ) AS `Skewness_Scrap_Steel`,
    ROUND(
        AVG(POW(`DRI or Pig Iron (%)` - (SELECT AVG(`DRI or Pig Iron (%)`) FROM steel_production), 3)) /
        POW(STD(`DRI or Pig Iron (%)`), 3), 4
    ) AS `Skewness_DRI_or_Pig_Iron`,
    ROUND(
        AVG(POW(`Iron Ore (%)` - (SELECT AVG(`Iron Ore (%)`) FROM steel_production), 3)) /
        POW(STD(`Iron Ore (%)`), 3), 4
    ) AS `Skewness_Iron_Ore`,
    ROUND(
        AVG(POW(`Phosphorus (%)` - (SELECT AVG(`Phosphorus (%)`) FROM steel_production), 3)) /
        POW(STD(`Phosphorus (%)`), 3), 4
    ) AS `Skewness_Phosphorus`,
    ROUND(
        AVG(POW(`Carbon (%)` - (SELECT AVG(`Carbon (%)`) FROM steel_production), 3)) /
        POW(STD(`Carbon (%)`), 3), 4
    ) AS `Skewness_Carbon`,
    ROUND(
        AVG(POW(`Melting Time (EAF)` - (SELECT AVG(`Melting Time (EAF)`) FROM steel_production), 3)) /
        POW(STD(`Melting Time (EAF)`), 3), 4
    ) AS `Skewness_Melting_Time_EAF`,
    ROUND(
        AVG(POW(`Production Volume` - (SELECT AVG(`Production Volume`) FROM steel_production), 3)) /
        POW(STD(`Production Volume`), 3), 4
    ) AS `Skewness_Production_Volume`,
    ROUND(
        AVG(POW(`Yield` - (SELECT AVG(`Yield`) FROM steel_production), 3)) /
        POW(STD(`Yield`), 3), 4
    ) AS `Skewness_Yield`,
    ROUND(
        AVG(POW(`BF Stage Cycle Time` - (SELECT AVG(`BF Stage Cycle Time`) FROM steel_production), 3)) /
        POW(STD(`BF Stage Cycle Time`), 3), 4
    ) AS `Skewness_BF_Stage_Cycle_Time`,
    ROUND(
        AVG(POW(`EAF Stage Cycle Time` - (SELECT AVG(`EAF Stage Cycle Time`) FROM steel_production), 3)) /
        POW(STD(`EAF Stage Cycle Time`), 3), 4
    ) AS `Skewness_EAF_Stage_Cycle_Time`,
    ROUND(
        AVG(POW(`LRF Stage Cycle Time` - (SELECT AVG(`LRF Stage Cycle Time`) FROM steel_production), 3)) /
        POW(STD(`LRF Stage Cycle Time`), 3), 4
    ) AS `Skewness_LRF_Stage_Cycle_Time`,
    ROUND(
        AVG(POW(`Total Cycle Time` - (SELECT AVG(`Total Cycle Time`) FROM steel_production), 3)) /
        POW(STD(`Total Cycle Time`), 3), 4
    ) AS `Skewness_Total_Cycle_Time`,
    ROUND(
        AVG(POW(`BF Electricity (kWh)` - (SELECT AVG(`BF Electricity (kWh)`) FROM steel_production), 3)) /
        POW(STD(`BF Electricity (kWh)`), 3), 4
    ) AS `Skewness_BF_Electricity`,
    ROUND(
        AVG(POW(`EAF Electricity (kWh)` - (SELECT AVG(`EAF Electricity (kWh)`) FROM steel_production), 3)) /
        POW(STD(`EAF Electricity (kWh)`), 3), 4
    ) AS `Skewness_EAF_Electricity`,
    ROUND(
        AVG(POW(`LRF Electricity (kWh)` - (SELECT AVG(`LRF Electricity (kWh)`) FROM steel_production), 3)) /
        POW(STD(`LRF Electricity (kWh)`), 3), 4
    ) AS `Skewness_LRF_Electricity`,
    ROUND(
        AVG(POW(`Total Electricity Consumption (kWh)` - (SELECT AVG(`Total Electricity Consumption (kWh)`) FROM steel_production), 3)) /
        POW(STD(`Total Electricity Consumption (kWh)`), 3), 4
    ) AS `Skewness_Total_Electricity_Consumption`,
    ROUND(
        AVG(POW(
            CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2)) - 
            (SELECT AVG(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) FROM steel_production), 
        3)) /
        POW(STDDEV(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))), 3), 
    4) AS `Skewness_Original_Cost_per_Ton`,
    ROUND(
        AVG(POW(`New Scrap Steel (%)` - (SELECT AVG(`New Scrap Steel (%)`) FROM steel_production), 3)) /
        POW(STD(`New Scrap Steel (%)`), 3), 4
    ) AS `Skewness_New_Scrap_Steel`,
    ROUND(
        AVG(POW(`New DRI or Pig Iron (%)` - (SELECT AVG(`New DRI or Pig Iron (%)`) FROM steel_production), 3)) /
        POW(STD(`New DRI or Pig Iron (%)`), 3), 4
    ) AS `Skewness_New_DRI_or_Pig_Iron`,
    ROUND(
        AVG(POW(`New Iron Ore (%)` - (SELECT AVG(`New Iron Ore (%)`) FROM steel_production), 3)) /
        POW(STD(`New Iron Ore (%)`), 3), 4
    ) AS `Skewness_New_Iron_Ore`,
    ROUND(
        AVG(POW(`New Electricity Consumption (kWh) Total` - (SELECT AVG(`New Electricity Consumption (kWh) Total`) FROM steel_production), 3)) /
        POW(STD(`New Electricity Consumption (kWh) Total`), 3), 4
    ) AS `Skewness_New_Electricity_Consumption`,
    ROUND(
        AVG(POW(`BF Electricity (kWh) (New)` - (SELECT AVG(`BF Electricity (kWh) (New)`) FROM steel_production), 3)) /
        POW(STD(`BF Electricity (kWh) (New)`), 3), 4
    ) AS `Skewness_BF_Electricity_New`,
    ROUND(
        AVG(POW(`EAF Electricity (kWh) (New)` - (SELECT AVG(`EAF Electricity (kWh) (New)`) FROM steel_production), 3)) /
        POW(STD(`EAF Electricity (kWh) (New)`), 3), 4
    ) AS `Skewness_EAF_Electricity_New`,
    ROUND(
        AVG(POW(`LRF Electricity (kWh) (New)` - (SELECT AVG(`LRF Electricity (kWh) (New)`) FROM steel_production), 3)) /
        POW(STD(`LRF Electricity (kWh) (New)`), 3), 4
    ) AS `Skewness_LRF_Electricity_New`,
    ROUND(
        AVG(POW(
            CAST(REPLACE(`Estimated Cost per Ton ($)` , '$', '') AS DECIMAL(10, 2)) - 
            (SELECT AVG(CAST(REPLACE(`Estimated Cost per Ton ($)` , '$', '') AS DECIMAL(10, 2))) 
             FROM steel_production), 
        3)) /
        POW(STDDEV(CAST(REPLACE(`Estimated Cost per Ton ($)` , '$', '') AS DECIMAL(10, 2))), 3), 
    4) AS `Skewness_Estimate_Cost_per_Ton`
FROM steel_production;

-- FOURTH BUSSINESS MOMONT
-- KURTOSIS
SELECT 
    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Scrap_Steel`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_DRI_or_Pig_Iron`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Iron Ore (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Iron Ore (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Iron Ore (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Iron_Ore`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Phosphorus (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Phosphorus (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Phosphorus (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Phosphorus`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Carbon (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Carbon (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Carbon (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Carbon`,

    ROUND(
        (
            AVG(
                POW(
                    `Melting Time (EAF)` - 
                    (SELECT AVG(`Melting Time (EAF)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`Melting Time (EAF)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Melting_Time_EAF`,

    ROUND(
        (
            AVG(
                POW(
                    `Production Volume` - 
                    (SELECT AVG(`Production Volume`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`Production Volume`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Production_Volume`,

    ROUND(
        (
            AVG(
                POW(
                    `Yield` - 
                    (SELECT AVG(`Yield`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`Yield`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Yield`,

    ROUND(
        (
            AVG(
                POW(
                    `BF Stage Cycle Time` - 
                    (SELECT AVG(`BF Stage Cycle Time`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`BF Stage Cycle Time`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_BF_Stage_Cycle_Time`,

    ROUND(
        (
            AVG(
                POW(
                    `EAF Stage Cycle Time` - 
                    (SELECT AVG(`EAF Stage Cycle Time`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`EAF Stage Cycle Time`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_EAF_Stage_Cycle_Time`,

    ROUND(
        (
            AVG(
                POW(
                    `LRF Stage Cycle Time` - 
                    (SELECT AVG(`LRF Stage Cycle Time`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`LRF Stage Cycle Time`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_LRF_Stage_Cycle_Time`,

    ROUND(
        (
            AVG(
                POW(
                    `Total Cycle Time` - 
                    (SELECT AVG(`Total Cycle Time`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`Total Cycle Time`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Total_Cycle_Time`,

    ROUND(
        (
            AVG(
                POW(
                    `BF Electricity (kWh)` - 
                    (SELECT AVG(`BF Electricity (kWh)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`BF Electricity (kWh)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_BF_Electricity`,

    ROUND(
        (
            AVG(
                POW(
                    `EAF Electricity (kWh)` - 
                    (SELECT AVG(`EAF Electricity (kWh)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`EAF Electricity (kWh)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_EAF_Electricity`,

    ROUND(
        (
            AVG(
                POW(
                    `LRF Electricity (kWh)` - 
                    (SELECT AVG(`LRF Electricity (kWh)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`LRF Electricity (kWh)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_LRF_Electricity`,

    ROUND(
        (
            AVG(
                POW(
                    `Total Electricity Consumption (kWh)` - 
                    (SELECT AVG(`Total Electricity Consumption (kWh)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`Total Electricity Consumption (kWh)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Total_Electricity_Consumption`,

 ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Original_Cost_per_Ton`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`New Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`New Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`New Scrap Steel (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_New_Scrap_Steel`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`New DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`New DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`New DRI or Pig Iron (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_New_DRI_or_Pig_Iron`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`New Iron Ore (%)`, '%', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`New Iron Ore (%)`, '%', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`New Iron Ore (%)`, '%', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_New_Iron_Ore`,

    ROUND(
        (
            AVG(
                POW(
                    `New Electricity Consumption (kWh) Total` - 
                    (SELECT AVG(`New Electricity Consumption (kWh) Total`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`New Electricity Consumption (kWh) Total`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_New_Electricity_Consumption_Total`,

    ROUND(
        (
            AVG(
                POW(
                    `BF Electricity (kWh) (New)` - 
                    (SELECT AVG(`BF Electricity (kWh) (New)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`BF Electricity (kWh) (New)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_BF_Electricity_New`,

    ROUND(
        (
            AVG(
                POW(
                    `EAF Electricity (kWh) (New)` - 
                    (SELECT AVG(`EAF Electricity (kWh) (New)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`EAF Electricity (kWh) (New)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_EAF_Electricity_New`,

    ROUND(
        (
            AVG(
                POW(
                    `LRF Electricity (kWh) (New)` - 
                    (SELECT AVG(`LRF Electricity (kWh) (New)`) FROM steel_production),
                4)
            ) / POW(
                STDDEV(`LRF Electricity (kWh) (New)`), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_LRF_Electricity_New`,

    ROUND(
        (
            AVG(
                POW(
                    CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2)) - 
                    (SELECT AVG(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))) 
                     FROM steel_production),
                4)
            ) / POW(
                STDDEV(CAST(REPLACE(`Estimated Cost per Ton ($)`, '$', '') AS DECIMAL(10, 2))), 4
            )
        ) - 3, 
    4) AS `Excess_Kurtosis_Estimated_Cost_per_Ton`
FROM steel_production;



-- Data Preproccessing ----------------------------------------------------

WITH DuplicateRecords AS (
    SELECT
        `Grade of Steel`,
        ROW_NUMBER() OVER (
            PARTITION BY
                `Scrap Steel (%)`,
                `DRI or Pig Iron (%)`,
                `Iron Ore (%)`,
                `Phosphorus (%)`,
                `Carbon (%)`,
                `Melting Time (EAF)`,
                `Production Volume`,
                `Yield`,
                `BF Stage Cycle Time`,
                `EAF Stage Cycle Time`,
                `LRF Stage Cycle Time`,
                `Total Cycle Time`,
                `BF Electricity (kWh)`,
                `EAF Electricity (kWh)`,
                `LRF Electricity (kWh)`,
                `Total Electricity Consumption (kWh)`,
                `Original Cost per Ton`
            ORDER BY `Grade of Steel`
        ) AS row_num
    FROM steel_production
)
SELECT *
FROM DuplicateRecords
WHERE row_num > 1;

-- ------------------------------------------------------------------------------------------------------------------------------

-- Drop duplicates
DELETE FROM steel_production
WHERE (`Scrap Steel (%)`,
                `DRI or Pig Iron (%)`,
                `Iron Ore (%)`,
                `Phosphorus (%)`,
                `Carbon (%)`,
                `Melting Time (EAF)`,
                `Production Volume`,
                `Yield`,
                `BF Stage Cycle Time`,
                `EAF Stage Cycle Time`,
                `LRF Stage Cycle Time`,
                `Total Cycle Time`,
                `BF Electricity (kWh)`,
                `EAF Electricity (kWh)`,
                `LRF Electricity (kWh)`,
                `Total Electricity Consumption (kWh)`,
                `Original Cost per Ton`) IN (
    SELECT `Scrap Steel (%)`,
                `DRI or Pig Iron (%)`,
                `Iron Ore (%)`,
                `Phosphorus (%)`,
                `Carbon (%)`,
                `Melting Time (EAF)`,
                `Production Volume`,
                `Yield`,
                `BF Stage Cycle Time`,
                `EAF Stage Cycle Time`,
                `LRF Stage Cycle Time`,
                `Total Cycle Time`,
                `BF Electricity (kWh)`,
                `EAF Electricity (kWh)`,
                `LRF Electricity (kWh)`,
                `Total Electricity Consumption (kWh)`,
                `Original Cost per Ton`
    FROM (
        SELECT `Scrap Steel (%)`,
                `DRI or Pig Iron (%)`,
                `Iron Ore (%)`,
                `Phosphorus (%)`,
                `Carbon (%)`,
                `Melting Time (EAF)`,
                `Production Volume`,
                `Yield`,
                `BF Stage Cycle Time`,
                `EAF Stage Cycle Time`,
                `LRF Stage Cycle Time`,
                `Total Cycle Time`,
                `BF Electricity (kWh)`,
                `EAF Electricity (kWh)`,
                `LRF Electricity (kWh)`,
                `Total Electricity Consumption (kWh)`,
                `Original Cost per Ton`,
               ROW_NUMBER() OVER (
                   PARTITION BY `Scrap Steel (%)`,
                `DRI or Pig Iron (%)`,
                `Iron Ore (%)`,
                `Phosphorus (%)`,
                `Carbon (%)`,
                `Melting Time (EAF)`,
                `Production Volume`,
                `Yield`,
                `BF Stage Cycle Time`,
                `EAF Stage Cycle Time`,
                `LRF Stage Cycle Time`,
                `Total Cycle Time`,
                `BF Electricity (kWh)`,
                `EAF Electricity (kWh)`,
                `LRF Electricity (kWh)`,
                `Total Electricity Consumption (kWh)`,
                `Original Cost per Ton`
                   ORDER BY (SELECT NULL)
               ) AS rn
        FROM steel_production
    ) AS subquery
    WHERE rn > 1
);


select * from steel_production;
-- ------------------------------------------------------------------------------------------------------------------
select count(*) from steel_production;
-- ----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------
-- OUTLIERS 

-- Update Scrap Steel (%)
UPDATE CARDS AS e
JOIN (
    SELECT
        `Scrap Steel (%)`,
        NTILE(4) OVER (ORDER BY `Scrap Steel (%)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Scrap Steel (%)` = subquery.`Scrap Steel (%)`
SET e.`Scrap Steel (%)` = (
    SELECT AVG(`Scrap Steel (%)`)
    FROM (
        SELECT
            `Scrap Steel (%)`,
            NTILE(4) OVER (ORDER BY `Scrap Steel (%)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update DRI or Pig Iron (%)
UPDATE steel_production AS e
JOIN (
    SELECT
        `DRI or Pig Iron (%)`,
        NTILE(4) OVER (ORDER BY `DRI or Pig Iron (%)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`DRI or Pig Iron (%)` = subquery.`DRI or Pig Iron (%)`
SET e.`DRI or Pig Iron (%)` = (
    SELECT AVG(`DRI or Pig Iron (%)`)
    FROM (
        SELECT
            `DRI or Pig Iron (%)`,
            NTILE(4) OVER (ORDER BY `DRI or Pig Iron (%)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Iron Ore (%)
UPDATE steel_production AS e
JOIN (
    SELECT
        `Iron Ore (%)`,
        NTILE(4) OVER (ORDER BY `Iron Ore (%)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Iron Ore (%)` = subquery.`Iron Ore (%)`
SET e.`Iron Ore (%)` = (
    SELECT AVG(`Iron Ore (%)`)
    FROM (
        SELECT
            `Iron Ore (%)`,
            NTILE(4) OVER (ORDER BY `Iron Ore (%)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Phosphorus (%)
UPDATE steel_production AS e
JOIN (
    SELECT
        `Phosphorus (%)`,
        NTILE(4) OVER (ORDER BY `Phosphorus (%)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Phosphorus (%)` = subquery.`Phosphorus (%)`
SET e.`Phosphorus (%)` = (
    SELECT AVG(`Phosphorus (%)`)
    FROM (
        SELECT
            `Phosphorus (%)`,
            NTILE(4) OVER (ORDER BY `Phosphorus (%)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Carbon (%)
UPDATE steel_production AS e
JOIN (
    SELECT
        `Carbon (%)`,
        NTILE(4) OVER (ORDER BY `Carbon (%)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Carbon (%)` = subquery.`Carbon (%)`
SET e.`Carbon (%)` = (
    SELECT AVG(`Carbon (%)`)
    FROM (
        SELECT
            `Carbon (%)`,
            NTILE(4) OVER (ORDER BY `Carbon (%)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Melting Time (EAF)
UPDATE steel_production AS e
JOIN (
    SELECT
        `Melting Time (EAF)`,
        NTILE(4) OVER (ORDER BY `Melting Time (EAF)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Melting Time (EAF)` = subquery.`Melting Time (EAF)`
SET e.`Melting Time (EAF)` = (
    SELECT AVG(`Melting Time (EAF)`)
    FROM (
        SELECT
            `Melting Time (EAF)`,
            NTILE(4) OVER (ORDER BY `Melting Time (EAF)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Production Volume
UPDATE steel_production AS e
JOIN (
    SELECT
        `Production Volume`,
        NTILE(4) OVER (ORDER BY `Production Volume`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Production Volume` = subquery.`Production Volume`
SET e.`Production Volume` = (
    SELECT AVG(`Production Volume`)
    FROM (
        SELECT
            `Production Volume`,
            NTILE(4) OVER (ORDER BY `Production Volume`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Yield
UPDATE steel_production AS e
JOIN (
    SELECT
        `Yield`,
        NTILE(4) OVER (ORDER BY `Yield`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Yield` = subquery.`Yield`
SET e.`Yield` = (
    SELECT AVG(`Yield`)
    FROM (
        SELECT
            `Yield`,
            NTILE(4) OVER (ORDER BY `Yield`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update BF Stage Cycle Time
UPDATE steel_production AS e
JOIN (
    SELECT
        `BF Stage Cycle Time`,
        NTILE(4) OVER (ORDER BY `BF Stage Cycle Time`) AS quartile
    FROM steel_production
) AS subquery
ON e.`BF Stage Cycle Time` = subquery.`BF Stage Cycle Time`
SET e.`BF Stage Cycle Time` = (
    SELECT AVG(`BF Stage Cycle Time`)
    FROM (
        SELECT
            `BF Stage Cycle Time`,
            NTILE(4) OVER (ORDER BY `BF Stage Cycle Time`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update EAF Stage Cycle Time
UPDATE steel_production AS e
JOIN (
    SELECT
        `EAF Stage Cycle Time`,
        NTILE(4) OVER (ORDER BY `EAF Stage Cycle Time`) AS quartile
    FROM steel_production
) AS subquery
ON e.`EAF Stage Cycle Time` = subquery.`EAF Stage Cycle Time`
SET e.`EAF Stage Cycle Time` = (
    SELECT AVG(`EAF Stage Cycle Time`)
    FROM (
        SELECT
            `EAF Stage Cycle Time`,
            NTILE(4) OVER (ORDER BY `EAF Stage Cycle Time`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update LRF Stage Cycle Time
UPDATE steel_production AS e
JOIN (
    SELECT
        `LRF Stage Cycle Time`,
        NTILE(4) OVER (ORDER BY `LRF Stage Cycle Time`) AS quartile
    FROM steel_production
) AS subquery
ON e.`LRF Stage Cycle Time` = subquery.`LRF Stage Cycle Time`
SET e.`LRF Stage Cycle Time` = (
    SELECT AVG(`LRF Stage Cycle Time`)
    FROM (
        SELECT
            `LRF Stage Cycle Time`,
            NTILE(4) OVER (ORDER BY `LRF Stage Cycle Time`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Total Cycle Time
UPDATE steel_production AS e
JOIN (
    SELECT
        `Total Cycle Time`,
        NTILE(4) OVER (ORDER BY `Total Cycle Time`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Total Cycle Time` = subquery.`Total Cycle Time`
SET e.`Total Cycle Time` = (
    SELECT AVG(`Total Cycle Time`)
    FROM (
        SELECT
            `Total Cycle Time`,
            NTILE(4) OVER (ORDER BY `Total Cycle Time`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update BF Electricity (kWh)
UPDATE steel_production AS e
JOIN (
    SELECT
        `BF Electricity (kWh)`,
        NTILE(4) OVER (ORDER BY `BF Electricity (kWh)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`BF Electricity (kWh)` = subquery.`BF Electricity (kWh)`
SET e.`BF Electricity (kWh)` = (
    SELECT AVG(`BF Electricity (kWh)`)
    FROM (
        SELECT
            `BF Electricity (kWh)`,
            NTILE(4) OVER (ORDER BY `BF Electricity (kWh)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update EAF Electricity (kWh)
UPDATE steel_production AS e
JOIN (
    SELECT
        `EAF Electricity (kWh)`,
        NTILE(4) OVER (ORDER BY `EAF Electricity (kWh)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`EAF Electricity (kWh)` = subquery.`EAF Electricity (kWh)`
SET e.`EAF Electricity (kWh)` = (
    SELECT AVG(`EAF Electricity (kWh)`)
    FROM (
        SELECT
            `EAF Electricity (kWh)`,
            NTILE(4) OVER (ORDER BY `EAF Electricity (kWh)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update LRF Electricity (kWh)
UPDATE steel_production AS e
JOIN (
    SELECT
        `LRF Electricity (kWh)`,
        NTILE(4) OVER (ORDER BY `LRF Electricity (kWh)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`LRF Electricity (kWh)` = subquery.`LRF Electricity (kWh)`
SET e.`LRF Electricity (kWh)` = (
    SELECT AVG(`LRF Electricity (kWh)`)
    FROM (
        SELECT
            `LRF Electricity (kWh)`,
            NTILE(4) OVER (ORDER BY `LRF Electricity (kWh)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Total Electricity Consumption (kWh)
UPDATE steel_production AS e
JOIN (
    SELECT
        `Total Electricity Consumption (kWh)`,
        NTILE(4) OVER (ORDER BY `Total Electricity Consumption (kWh)`) AS quartile
    FROM steel_production
) AS subquery
ON e.`Total Electricity Consumption (kWh)` = subquery.`Total Electricity Consumption (kWh)`
SET e.`Total Electricity Consumption (kWh)` = (
    SELECT AVG(`Total Electricity Consumption (kWh)`)
    FROM (
        SELECT
            `Total Electricity Consumption (kWh)`,
            NTILE(4) OVER (ORDER BY `Total Electricity Consumption (kWh)`) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);

-- Update Original Cost per Ton
UPDATE steel_production AS e
JOIN (
    SELECT
        CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2)) AS `Original Cost per Ton`,
        NTILE(4) OVER (ORDER BY CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS quartile
    FROM steel_production
) AS subquery
ON CAST(REPLACE(e.`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2)) = subquery.`Original Cost per Ton`
SET e.`Original Cost per Ton` = (
    SELECT CONCAT('$', AVG(CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))))
    FROM (
        SELECT
            CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2)) AS `Original Cost per Ton`,
            NTILE(4) OVER (ORDER BY CAST(REPLACE(`Original Cost per Ton`, '$', '') AS DECIMAL(10, 2))) AS quartile
        FROM steel_production
    ) AS temp
    WHERE quartile = subquery.quartile
)
WHERE subquery.quartile IN (1, 4);




-- -------------------------------------

  SET SQL_SAFE_UPDATES = 0; 
  select * from steel_production;
    


SELECT * from steel_production ;
--    ----------------
-- MISSING values

-- Replace NULL values in numeric columns with the column's mean

UPDATE steel_production
JOIN (
    SELECT 
        AVG(CAST(`Scrap Steel (%)` AS DECIMAL(10, 2))) AS avg_Scrap_Steel,
        AVG(CAST(`DRI or Pig Iron (%)` AS DECIMAL(10, 2))) AS avg_DRI_or_Pig_Iron,
        AVG(CAST(`Iron Ore (%)` AS DECIMAL(10, 2))) AS avg_Iron_Ore,
        AVG(CAST(`Phosphorus (%)` AS DECIMAL(10, 2))) AS avg_Phosphorus,
        AVG(CAST(`Carbon (%)` AS DECIMAL(10, 2))) AS avg_Carbon,
        AVG(CAST(`Melting Time (EAF)` AS DECIMAL(10, 2))) AS avg_Melting_Time_EAF,
        AVG(CAST(`Production Volume` AS DECIMAL(10, 2))) AS avg_Production_Volume,
        AVG(CAST(`Yield` AS DECIMAL(10, 2))) AS avg_Yield,
        AVG(CAST(`BF Stage Cycle Time` AS DECIMAL(10, 2))) AS avg_BF_Stage_Cycle_Time,
        AVG(CAST(`EAF Stage Cycle Time` AS DECIMAL(10, 2))) AS avg_EAF_Stage_Cycle_Time,
        AVG(CAST(`LRF Stage Cycle Time` AS DECIMAL(10, 2))) AS avg_LRF_Stage_Cycle_Time,
        AVG(CAST(`Total Cycle Time` AS DECIMAL(10, 2))) AS avg_Total_Cycle_Time,
        AVG(CAST(`BF Electricity (kWh)` AS DECIMAL(10, 2))) AS avg_BF_Electricity,
        AVG(CAST(`EAF Electricity (kWh)` AS DECIMAL(10, 2))) AS avg_EAF_Electricity,
        AVG(CAST(`LRF Electricity (kWh)` AS DECIMAL(10, 2))) AS avg_LRF_Electricity,
        AVG(CAST(`Total Electricity Consumption (kWh)` AS DECIMAL(10, 2))) AS avg_Total_Electricity_Consumption,
        AVG(CAST(`Original Cost per Ton` AS DECIMAL(10, 2))) AS avg_Original_Cost_per_Ton
    FROM steel_production
    WHERE 
        `Scrap Steel (%)` REGEXP '^[0-9.]+$' AND
        `DRI or Pig Iron (%)` REGEXP '^[0-9.]+$' AND
        `Iron Ore (%)` REGEXP '^[0-9.]+$' AND
        `Phosphorus (%)` REGEXP '^[0-9.]+$' AND
        `Carbon (%)` REGEXP '^[0-9.]+$' AND
        `Melting Time (EAF)` REGEXP '^[0-9.]+$' AND
        `Production Volume` REGEXP '^[0-9.]+$' AND
        `Yield` REGEXP '^[0-9.]+$' AND
        `BF Stage Cycle Time` REGEXP '^[0-9.]+$' AND
        `EAF Stage Cycle Time` REGEXP '^[0-9.]+$' AND
        `LRF Stage Cycle Time` REGEXP '^[0-9.]+$' AND
        `Total Cycle Time` REGEXP '^[0-9.]+$' AND
        `BF Electricity (kWh)` REGEXP '^[0-9.]+$' AND
        `EAF Electricity (kWh)` REGEXP '^[0-9.]+$' AND
        `LRF Electricity (kWh)` REGEXP '^[0-9.]+$' AND
        `Total Electricity Consumption (kWh)` REGEXP '^[0-9.]+$' AND
        `Original Cost per Ton` REGEXP '^[0-9.]+$'
) AS averages
SET 
    `Scrap Steel (%)` = COALESCE(`Scrap Steel (%)`, averages.avg_Scrap_Steel),
    `DRI or Pig Iron (%)` = COALESCE(`DRI or Pig Iron (%)`, averages.avg_DRI_or_Pig_Iron),
    `Iron Ore (%)` = COALESCE(`Iron Ore (%)`, averages.avg_Iron_Ore),
    `Phosphorus (%)` = COALESCE(`Phosphorus (%)`, averages.avg_Phosphorus),
    `Carbon (%)` = COALESCE(`Carbon (%)`, averages.avg_Carbon),
    `Melting Time (EAF)` = COALESCE(`Melting Time (EAF)`, averages.avg_Melting_Time_EAF),
    `Production Volume` = COALESCE(`Production Volume`, averages.avg_Production_Volume),
    `Yield` = COALESCE(`Yield`, averages.avg_Yield),
    `BF Stage Cycle Time` = COALESCE(`BF Stage Cycle Time`, averages.avg_BF_Stage_Cycle_Time),
    `EAF Stage Cycle Time` = COALESCE(`EAF Stage Cycle Time`, averages.avg_EAF_Stage_Cycle_Time),
    `LRF Stage Cycle Time` = COALESCE(`LRF Stage Cycle Time`, averages.avg_LRF_Stage_Cycle_Time),
    `Total Cycle Time` = COALESCE(`Total Cycle Time`, averages.avg_Total_Cycle_Time),
    `BF Electricity (kWh)` = COALESCE(`BF Electricity (kWh)`, averages.avg_BF_Electricity),
    `EAF Electricity (kWh)` = COALESCE(`EAF Electricity (kWh)`, averages.avg_EAF_Electricity),
    `LRF Electricity (kWh)` = COALESCE(`LRF Electricity (kWh)`, averages.avg_LRF_Electricity),
    `Total Electricity Consumption (kWh)` = COALESCE(`Total Electricity Consumption (kWh)`, averages.avg_Total_Electricity_Consumption),
    `Original Cost per Ton` = COALESCE(`Original Cost per Ton`, averages.avg_Original_Cost_per_Ton)
WHERE 
    `Scrap Steel (%)` IS NULL OR
    `DRI or Pig Iron (%)` IS NULL OR
    `Iron Ore (%)` IS NULL OR
    `Phosphorus (%)` IS NULL OR
    `Carbon (%)` IS NULL OR
    `Melting Time (EAF)` IS NULL OR
    `Production Volume` IS NULL OR
    `Yield` IS NULL OR
    `BF Stage Cycle Time` IS NULL OR
    `EAF Stage Cycle Time` IS NULL OR
    `LRF Stage Cycle Time` IS NULL OR
    `Total Cycle Time` IS NULL OR
    `BF Electricity (kWh)` IS NULL OR
    `EAF Electricity (kWh)` IS NULL OR
    `LRF Electricity (kWh)` IS NULL OR
    `Total Electricity Consumption (kWh)` IS NULL OR
    `Original Cost per Ton` IS NULL;
-- -----------------------------------------------------------------------------------------
-- MISSING values

-- Replace NULL values in numeric columns with the column's mean
UPDATE cards
SET 
    No_of_Sheets_Used = COALESCE(No_of_Sheets_Used, (SELECT AVG(No_of_Sheets_Used) FROM cards)),
    No_of_cards_Printed = COALESCE(No_of_cards_Printed, (SELECT AVG(No_of_cards_Printed) FROM cards)),
    No_of_Half_cards = COALESCE(No_of_Half_cards, (SELECT AVG(No_of_Half_cards) FROM cards)),
    No_of_Quarter_cards = COALESCE(No_of_Quarter_cards, (SELECT AVG(No_of_Quarter_cards) FROM cards)),
    Accepted_cards = COALESCE(Accepted_cards, (SELECT AVG(Accepted_cards) FROM cards)),
    Rejected_cards = COALESCE(Rejected_cards, (SELECT AVG(Rejected_cards) FROM cards)),
    Embedding_Errors = COALESCE(Embedding_Errors, (SELECT AVG(Embedding_Errors) FROM cards))
WHERE 
    No_of_Sheets_Used IS NULL OR
    No_of_cards_Printed IS NULL OR
    No_of_Half_cards IS NULL OR
    No_of_Quarter_cards IS NULL OR
    Accepted_cards IS NULL OR
    Rejected_cards IS NULL OR
    Embedding_Errors IS NULL;


    
select * from steel_production ;

