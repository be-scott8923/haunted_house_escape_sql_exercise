SELECT SUM(favorite_number) AS sum
FROM ghosts
WHERE name LIKE 'B%';

SELECT subject_name, min(painted_year)
FROM portraits;

SELECT course, AVG(poison_level)
FROM meals
GROUP BY course
HAVING AVG(poison_level) > 7;

SELECT title, name
FROM authors
JOIN books ON authors.author_id = books.author_id
WHERE death_year < 1900
GROUP BY name;

SELECT experiment_name, MAX(success_rate)
FROM experiments;

SELECT name, cause_of_death, CASE
    WHEN cause_of_death = 'old age' THEN 'peaceful'
    ELSE 'tragic'
END AS 'Peacefulness'
FROM tombstones;

WITH ranked_chimes AS (SELECT chime_id,
                              volume,
                              chime_time,
                              LAG(volume) OVER (ORDER BY chimes.chime_time)
                                  AS previous_volume
                       FROM chimes)
SELECT chime_id, chime_time, volume
FROM ranked_chimes
WHERE volume > previous_volume;

SELECT l.door_name, a.key_id, AVG(k.power_level)
FROM locks l
JOIN attempts a ON l.lock_id = a.lock_id
JOIN keys k ON a.key_id = k.key_id
WHERE a.success = 1
GROUP BY a.key_id
ORDER BY AVG(k.power_level) DESC
LIMIT 1;