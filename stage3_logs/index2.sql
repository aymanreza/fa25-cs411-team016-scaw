tee output.txt;
DROP INDEX idx_weather_loc ON weather_observations;
CREATE INDEX idx_weather_tmax ON weather_observations (tmax_c);
EXPLAIN ANALYZE
SELECT l.city, l.state, w.observed_on, 'heat_wave' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.tmax_c >= 35

UNION

SELECT l.city, l.state, w.observed_on, 'hard_freeze' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.tmin_c <= 0

UNION

SELECT l.city, l.state, w.observed_on, 'very_heavy_rain' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.precip_mm >= 50
ORDER BY state, city, observed_on, event;
DROP INDEX idx_weather_tmax ON weather_observations;
CREATE INDEX idx_weather_precip ON weather_observations (precip_mm);
EXPLAIN ANALYZE
SELECT l.city, l.state, w.observed_on, 'heat_wave' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.tmax_c >= 35

UNION

SELECT l.city, l.state, w.observed_on, 'hard_freeze' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.tmin_c <= 0

UNION

SELECT l.city, l.state, w.observed_on, 'very_heavy_rain' AS event
FROM weather_observations AS w
JOIN locations AS l ON l.location_id = w.location_id
WHERE w.precip_mm >= 50
ORDER BY state, city, observed_on, event;

DROP INDEX idx_weather_precip ON weather_observations;
notee;
