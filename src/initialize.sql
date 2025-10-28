LOAD DATA LOCAL INFILE '/path/to/your_original.csv'
INTO TABLE zip_zones
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@zip_code, @zone, @city, @state, @lat, @lon)
SET zip = TRIM(@zip_code), usda_zone = TRIM(@zone);
