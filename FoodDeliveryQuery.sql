
use FoodDeliveryDB;
/*
select SUM(Price)
from Food,Providers
where MethodOfPayment ='С карта';

select WorkerName,WorkerShift 
From Workers
Where WorkerShift='Нощна';

Select Client_ID,Mark
From Providers
Where Mark > 8.0;

Select Provider_ID,TimeDelivery
From Providers
Where TimeDelivery < 00:30:00 ;


SELECT FoodName_ID,TypeOfFood,
Case
when FoodName_ID = 'Картофки със сирене' then 'Гарнитура'
when FoodName_ID = 'Пилешка супа' then 'Супа'
when FoodName_ID = 'Салата капрезе' then 'Салата'
when FoodName_ID = 'Свински ребра' then 'Основно ястие'
when FoodName_ID = 'Шоколадово суфле' then 'Десерт'
End
From Food
order by FoodName_ID
*/
select Name,s.FoodName_ID, SUM(c.Quantity*s.Price) as PriceFood
From OrderDate c
inner join Food s
on c.FoodName_ID = s.FoodName_ID
inner join Clients n
on c.Client_ID = n.Client_ID
group by Name,s.FoodName_ID,TypeOfFood


select TypeOfFood, SUM(c.Quantity*s.Price) as PriceFood
From OrderDate c
inner join Food s
on s.FoodName_ID = c.FoodName_ID
group by TypeOfFood


select s.FoodName_ID
From OrderDate c
inner join Food s
on s.FoodName_ID = c.FoodName_ID
Order by c.FoodName_ID DESC;


