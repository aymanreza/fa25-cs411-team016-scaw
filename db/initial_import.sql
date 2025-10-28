LOAD DATA LOCAL INFILE 'data/locations.csv'
INTO TABLE zip_zones
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@zip_code, @zone, @city, @state, @lat, @lon)
SET zip = TRIM(@zip_code), usda_zone = TRIM(@zone);

LOAD DATA LOCAL INFILE 'data/locations.csv'
INTO TABLE locations
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@zip_code, @zone, @city, @state, @lat, @lon)
SET zip = TRIM(@zip_code), city = TRIM(@city), state = TRIM(@state);

LOAD DATA LOCAL INFILE 'data/users_seed.csv'
INTO TABLE users
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(email, name, password, created_at);

LOAD DATA LOCAL INFILE 'data/crops_info.csv'
INTO TABLE crops
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@common_name, @scientific_name, @ideal_soil, @sun_req, @water_req, @usda_zone_min, @usda_zone_max)
SET
  common_name     = NULLIF(TRIM(@common_name), ''),
  scientific_name = NULLIF(TRIM(@scientific_name), ''),
  ideal_soil      = NULLIF(TRIM(@ideal_soil), ''),
  sun_req         = NULLIF(TRIM(@sun_req), ''),
  water_req       = NULLIF(TRIM(@water_req), ''),
  usda_zone_min   = CAST(NULLIF(TRIM(@usda_zone_min), '') AS SIGNED),
  usda_zone_max   = CAST(NULLIF(TRIM(@usda_zone_max), '') AS SIGNED);
