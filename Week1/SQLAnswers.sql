-- Question 3

SELECT count("VendorID") as trips

FROM public.green_taxi_trips

where  "lpep_pickup_datetime" between '2019-01-15' and '2019-01-16'
;




-- Question 4  

SELECT "lpep_pickup_datetime"::TIMESTAMP::DATE as PU_DATE,
		"trip_distance"

FROM public.green_taxi_trips
--where time between '2018-01-01' and '2018-01-31'
order by "trip_distance" DESC
LIMIT 1
;



-- Question 5

SELECT "lpep_pickup_datetime"::TIMESTAMP::DATE as pudate
     , count(*) FILTER (WHERE "passenger_count" = 2) AS passengers2
     , count(*) FILTER (WHERE "passenger_count" = 3) AS passengers3
FROM   public.green_taxi_trips
Where "lpep_pickup_datetime" between '2019-01-01' and '2019-01-02'
GROUP BY 1

;


-- Question 6

SELECT t."lpep_pickup_datetime"::TIMESTAMP::DATE as PU_DATE,
		t."trip_distance",
		pu."Zone",
		dro."Zone"

FROM public.green_taxi_trips t 
	JOIN public.taxi_zone pu on t."PULocationID" = pu."LocationID"
	JOIN public.taxi_zone dro on t."DOLocationID" = dro."LocationID"
where pu."Zone" like 'Astoria' and dro."Zone" in ('Central Park','Jamaica','South Ozone Park','Long Island City/Queens Plaza')
order by t."trip_distance" DESC
LIMIT 1

;

