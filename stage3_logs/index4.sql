tee index4.txt;
EXPLAIN ANALYZE
SELECT
l.city,
l.state,
ROUND(AVG(w.tmax_c), 1) AS avg_high,
ROUND(STDDEV_SAMP(w.tmax_c), 2) AS stdev_high,
COUNT(*) AS days
FROM
weather_observations w
JOIN
locations l ON l.location_id = w.location_id
WHERE
w.observed_on >= DATE_SUB('2025-08-05', INTERVAL 30 DAY)
GROUP BY
l.city, l.state
HAVING days >= 30
ORDER BY stdev_high DESC
LIMIT 15;
CREATE INDEX idx_weather_location_date ON weather_observations(location_id, observed_on);
EXPLAIN ANALYZE
SELECT
l.city,
l.state,
ROUND(AVG(w.tmax_c), 1) AS avg_high,
ROUND(STDDEV_SAMP(w.tmax_c), 2) AS stdev_high,
COUNT(*) AS days
FROM
weather_observations w
JOIN
locations l ON l.location_id = w.location_id
WHERE
w.observed_on >= DATE_SUB('2025-08-05', INTERVAL 30 DAY)
GROUP BY
l.city, l.state
HAVING days >= 30
ORDER BY stdev_high DESC
LIMIT 15;
DROP INDEX idx_weather_location_date ON weather_observations;
CREATE INDEX idx_locations_city_state ON locations(city, state);
EXPLAIN ANALYZE
SELECT
l.city,
l.state,
ROUND(AVG(w.tmax_c), 1) AS avg_high,
ROUND(STDDEV_SAMP(w.tmax_c), 2) AS stdev_high,
COUNT(*) AS days
FROM
weather_observations w
JOIN
locations l ON l.location_id = w.location_id
WHERE
w.observed_on >= DATE_SUB('2025-08-05', INTERVAL 30 DAY)
GROUP BY
l.city, l.state
HAVING days >= 30
ORDER BY stdev_high DESC
LIMIT 15;
DROP INDEX idx_locations_city_state ON locations;
CREATE INDEX idx_weather_tmax ON weather_observations(tmax_c);
EXPLAIN ANALYZE
SELECT
l.city,
l.state,
ROUND(AVG(w.tmax_c), 1) AS avg_high,
ROUND(STDDEV_SAMP(w.tmax_c), 2) AS stdev_high,
COUNT(*) AS days
FROM
weather_observations w
JOIN
locations l ON l.location_id = w.location_id
WHERE
w.observed_on >= DATE_SUB('2025-08-05', INTERVAL 30 DAY)
GROUP BY
l.city, l.state
HAVING days >= 30
ORDER BY stdev_high DESC
LIMIT 15;
DROP INDEX idx_weather_tmax ON weather_observations;
notee;

