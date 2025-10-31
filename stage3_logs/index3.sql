tee index3.txt;
EXPLAIN ANALYZE
SELECT u.user_id, u.email
FROM users AS u
LEFT JOIN plots AS p
  ON p.user_id = u.user_id
 AND p.is_active = 1
GROUP BY u.user_id, u.email
HAVING COUNT(p.plot_id) = 0
LIMIT 15;
CREATE INDEX idx_plots_user_active ON plots(user_id, is_active);
EXPLAIN ANALYZE
SELECT u.user_id, u.email
FROM users AS u
LEFT JOIN plots AS p
  ON p.user_id = u.user_id
 AND p.is_active = 1
GROUP BY u.user_id, u.email
HAVING COUNT(p.plot_id) = 0
LIMIT 15;
DROP INDEX idx_plots_user_active ON plots;
CREATE INDEX idx_users_email ON users(email);
EXPLAIN ANALYZE
SELECT u.user_id, u.email
FROM users AS u
LEFT JOIN plots AS p
  ON p.user_id = u.user_id
 AND p.is_active = 1
GROUP BY u.user_id, u.email
HAVING COUNT(p.plot_id) = 0
LIMIT 15;
DROP INDEX idx_users_email;
CREATE INDEX idx_plots_active_plotid ON plots(is_active, plot_id);
EXPLAIN ANALYZE
SELECT u.user_id, u.email
FROM users AS u
LEFT JOIN plots AS p
  ON p.user_id = u.user_id
 AND p.is_active = 1
GROUP BY u.user_id, u.email
HAVING COUNT(p.plot_id) = 0
LIMIT 15;
DROP INDEX idx_plots_active_plotid ON plots;
notee;

