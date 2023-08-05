
use ecommerce;
desc users_data;

select * from users_data;
select count(distinct country) from users_data;
select count(distinct language) from users_data;

select gender,sum(socialNbFollowers) from users_data group by gender;

select count(*) Profile_users from users_data where hasProfilePicture = 'True';

select count(*) Any_Ecommerce_App_users from users_data where hasAnyApp = 'True';

select count(*) Android_users from users_data where hasAndroidApp = 'True';

select count(*) Ios_users from users_data where hasIosApp = 'True';

select * from users_data;

select country Country ,count(type) Total_no_of_buyers from users_data where productsBought>=1 group by country order by Total_no_of_buyers desc;

select * from users_data;

select country Country,count(type) Total_no_of_sellers from users_data where productsSold>=1 group by country order by Total_no_of_sellers asc;

select country,max(productsPassRate) MaximumProductPassRate from users_data group by country order by MaximumProductPassRate desc limit 0,10;

select count(type) No_users,language from users_data where hasAnyApp='True' group by language;

select'Wishlist' Female_choice,count(productsWished) Female_Users from users_data where gender ='F'
and productsWished>0  UNION SELECT 'Like' Female_choice,count(socialProductsLiked) from users_data
where gender ='F' and socialProductsLiked>0;

select'Seller' Male_choice,count(productsSold) Male_Users from users_data where gender='M'
and productsSold>0 UNION SELECT 'Buyer' Male_choice,count(productsBought) from users_data
where gender='M' and productsBought>0;

select country,max(productsBought) Maximum_no_of_buyers from users_data group by country order by Maximum_no_of_buyers;

SELECT country, count(PRODUCTSSOLD) ZERO_SELLERS FROM USERS_DATA WHERE productsSold = 0
GROUP BY country HAVING country != ALL (SELECT COUNTRY AS SELLERS FROM USERS_DATA
WHERE productsSold != 0 GROUP BY COUNTRY) order by ZERO_SELLERS desc limit 0,10;

select identifierHash,type,country,daysSinceLastLogin from users_data order by daysSinceLastLogin limit 110;

select gender,count(daysSinceLastLogin) Not_logged from users_data where gender='f' and daysSinceLastLogin>=100;

select country,gender,count(type) Female_users from users_data where gender='F' and hasAnyApp='True' group by country;

select country,gender,count(type) Male_users from users_data where gender='M' and hasAnyApp='True' group by country;

select country,gender,count(type),avg(productsSold) Average_Sold,avg(productsBought) Average_Bought from users_data where gender='M' group by country;
