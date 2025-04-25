                                             #OLA Data Analyst Project

#SQL Questions & Answers:
create database Ola;
use Ola;

#Retrieve all successful bookings:
Create View Successful_Booking As
select * from ola
WHERE Booking_Status='Success';
select * from Successful_Booking;

#2. Find the average ride distance for each vehicle type:
create view Ride_Distance_From_Each_Vehicle As
select Vehicle_Type,avg(Ride_Distance) As Ride_Distance from ola
Group By Vehicle_Type;
select * from Ride_Distance_From_Each_Vehicle;

#Get the total number of cancelled rides by customers:
create view canceled_rides_by_customers As
Select Count(*) from ola
WHERE Booking_Status='Canceled by Customer';
select* from canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Top5_customers As
select Customer_ID,count(Booking_ID) As
ride_limit from ola
group by Customer_ID
order by ride_limit DESC LIMIT 5;
select * from Top5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_Canceled_By_Drivers_P_C_Issues As
select count(*) from ola where Canceled_Rides_by_Driver='Personal & Car related issue';
select * from Rides_Canceled_By_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating As
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating from ola
WHERE Vehicle_Type='Prime Sedan';
select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
create view Payment_Method As
select * from ola
WHERE Payment_Method='UPI';
select * from Payment_Method;

#8. Find the average customer rating per vehicle type:
create view Customer_Rate_On_Vehicle_Type As
select Vehicle_Type,avg(Customer_Rating) as total_rating from ola
group by  Vehicle_Type;
select * from Customer_Rate_On_Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view total_successful_booking as
select sum(Booking_Value) as total_successful_value from ola
where Booking_Status='Success';
select * from total_successful_booking;

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides_With_Reasons as
select Booking_ID,Incomplete_Rides_Reason from ola
WHERE Incomplete_Rides='Yes';
select * from Incomplete_Rides_With_Reasons;




