create database if not exists `TravelOnTheGO`;
use `TravelOnTheGO`;

create table if not exists passenger(passenger_name varchar (50),
category varchar (30),
gender varchar (5),
boarding_city varchar (50),
destination_city varchar (50),
distance int not null,
bus_type varchar(50));

create table if not exists price(bus_type varchar(50),
distance int not null,
price int null);

Insert into passenger values 
('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', '350', 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', '700', 'Sitting'),
('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', '600', 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai' ,'Mumbai', '1500','Sleeper'),
('Udit','Non-AC', 'M', 'Trivandrum', 'Panaji', '1000', 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', '500', 'Sitting'),
('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', '700', 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', '500', 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', '700', 'Sitting');

Insert into price values 
('Sleeper','350','770'),
('Sleeper','500','1100'),
('Sleeper','600','1320'),
('Sleeper','700','1540'),
('Sleeper','1000','2200'),
('Sleeper','1200','2640'),
('Sleeper','1500','2700'),
('Sitting','500','620'),
('Sitting','600','744'),
('Sitting','700','868'),
('Sitting','1000','1240'),
('Sitting','1200','1488'),
('Sitting','1500','1860');

#Q3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
Select Gender, count(Gender) from passenger where distance >=600
group by Gender;

#Q4) Find the minimum ticket price for Sleeper Bus
Select min(Price) from price
where Bus_type = 'Sleeper';

#Q5) Select passenger names whose names start with character 'S'
Select Passenger_name from passenger
where Passenger_name like 'S%';

#Q6) Calculate price charged for each passenger displaying Passenger name, Boarding City,Destination City, Bus_Type, Price in the output
Select p.Passenger_name, p.Boarding_city, p.Destination_City, p.Bus_Type, pr.price from passenger as p
join price as pr on p.Distance = pr.Distance
group by p.Passenger_name;

#Q7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KM s
Select p.Passenger_name, pr. Price from passenger as p 
join Price as pr on
p.Bus_type = pr.Bus_type  
where p.Distance >1000 and p.Bus_Type = 'Sitting';
# No passenger is in sitting bus type with distance >1000

#Q8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as 
Boardng_city, p2.Bus_type, p2.Price FROM passenger p1, price p2 WHERE 
Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

#Q9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
Select distinct(Distance) 
from passenger
order by Distance desc;

#Q10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables
Select passenger_name,(distance/(select sum(distance) from passenger))*100 as percentage
from passenger;

#Q11) Display the distance, price in three categories in table Price
	#a) Expensive if the cost is more than 1000

	#b) Average Cost if the cost is less than 1000 and greater than 500

	#c) Cheap otherwise
SELECT passenger.distance, Price.price,
CASE
	WHEN Price.price > 1000 THEN "Expensive"
    WHEN Price.price < 1000 and price > 500 THEN "Average_Cost"
    ELSE "Cheap" 
END as Price_Catergory
FROM passenger join Price on passenger.distance = price.distance
group by passenger.distance;




