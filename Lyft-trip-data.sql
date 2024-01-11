/*** LYFT Trip Data ***/

SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

/**
Information of the riders last name respective to each of the trip
**/
SELECT
  t.id,
  t.date,
  t.pickup,
  t.dropoff,
  t.rider_id,
  r.last
FROM
  trips AS t
  LEFT JOIN riders AS r ON t.rider_id = r.id
  
/**
Information of the respective Car model for each of the trip
**/
SELECT
  t.*,
  c.model
FROM
  trips AS t
  LEFT JOIN cars AS c ON t.car_id = c.id;

/**
The new riders data are in! There are three new users this month.
Stack the riders table on top of the new table named riders2.
**/
SELECT * FROM riders
UNION
  SELECT * FROM riders2;
  
/**
What is the average cost for a trip?
**/
SELECT
  AVG(cost) AS average_cost
FROM
  trips;
  
/**
Find all the riders who have used Lyft less than 500 times! (In both riders and riders2 tables)
**/
SELECT
  id, first, total_trips
FROM
  riders
WHERE
  total_trips < 500
UNION
SELECT
  id, first, total_trips
FROM riders2
WHERE
  total_trips < 500
ORDER BY
  total_trips ASC;

/**
Calculate the number of cars that are active.
**/
SELECT
  COUNT(id) AS total_active_cars
FROM
  cars
WHERE
  status = "active";
  
/**
It’s safety recall time for cars that have been on the road for a while.
Write a query that finds the two cars that have the highest trips_completed.
**/
SELECT
  model,
  trips_completed
FROM
  cars
ORDER BY
  trips_completed DESC
LIMIT 2;

