-- 1. Find the Total Number of Bookings for Each Flight?
select f.flight_id, f.flight_number, count(b.booking_id) as total_bookings from flights f
left join bookings b on f.flight_id = b.flight_id
group by f.flight_id, b.flight_id
ORDER BY total_bookings DESC;

-- 2. List All Passengers Who Have Booked a Specific Flight (e.g., Flight Number 'AI202') ?
SELECT 
    p.passenger_id,
    p.first_name,
    p.last_name,
    p.email,
    p.phone
FROM 
    Passengers p
JOIN 
    Bookings b ON p.passenger_id = b.passenger_id
JOIN 
    Flights f ON b.flight_id = f.flight_id
WHERE 
    f.flight_number = 'AI202';

-- 3. Find the Total Number of Flights Departing from a Specific Airport (e.g., 'JFK') 
SELECT 
    a.airport_name,
    a.city,
    COUNT(f.flight_id) AS total_departing_flights
FROM 
    Airports a
JOIN 
    Flights f ON a.airport_id = f.departure_airport_id
WHERE 
    a.airport_name = 'Chhatrapati Shivaji Maharaj International Airport'
GROUP BY 
    a.airport_name, a.city;

-- 4. Find the Flight with the Most Passengers Booked (Most Popular Flight)
SELECT 
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Flights f
JOIN 
    Bookings b ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id, f.flight_number
ORDER BY 
    total_bookings DESC
LIMIT 1;

-- 5. Get the Total Payment Amount for All Confirmed Bookings 
SELECT 
    SUM(p.amount) AS total_payment_amount
FROM 
    Payments p
JOIN 
    Bookings b ON p.booking_id = b.booking_id
WHERE 
    b.status = 'Confirmed';

-- 6. List All Flights Departing After a Specific Date and Time (e.g., '2024-06-01 10:00:00') 
SELECT 
    flight_id,
    flight_number,
    departure_time,
    arrival_time,
    status
FROM 
    Flights
WHERE 
    departure_time > '2024-06-01 10:00:00'
ORDER BY 
    departure_time;

-- 7. Find the Number of Bookings Made in Each Seat Class (e.g., Economy, Business) 
SELECT 
    seat_class,
    COUNT(booking_id) AS total_bookings
FROM 
    Bookings
GROUP BY 
    seat_class
ORDER BY 
    total_bookings DESC;

-- 8. List All Flights That Have Been Cancelled 
SELECT 
    flight_id,
    flight_number,
    departure_time,
    arrival_time,
    status
FROM 
    Flights
WHERE 
    status = 'Cancelled';

-- 9. Find the Average Payment Amount for Confirmed Bookings 
SELECT 
    AVG(p.amount) AS average_payment_amount
FROM 
    Payments p
JOIN 
    Bookings b ON p.booking_id = b.booking_id
WHERE 
    b.status = 'Confirmed';

-- 10. Get the Total Number of Bookings and Total Payment Amount for Each Passenger 
SELECT 
    p.passenger_id,
    p.first_name,
    p.last_name,
    COUNT(b.booking_id) AS total_bookings,
    SUM(pay.amount) AS total_payment_amount
FROM 
    Passengers p
LEFT JOIN 
    Bookings b ON p.passenger_id = b.passenger_id
LEFT JOIN 
    Payments pay ON b.booking_id = pay.booking_id
GROUP BY 
    p.passenger_id, p.first_name, p.last_name
ORDER BY 
    total_bookings DESC;
	

	

 

