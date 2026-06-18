---SQL queries go here.
Regional Performance
  Query 
SELECT
region,
SUM(sales) total_sales,
SUM(profit) total_profit,
(SUM(profit) / SUM(sales)) * 100 profit_margin
FROM Superstore
GROUP BY region
ORDER BY profit_margin DESC;


Category Performance
  Query
SELECT
category,
SUM(sales) total_sales
FROM Superstore
GROUP BY category
ORDER BY total_sales DESC;


Central Furniture Impact
  Query
SELECT
category,
SUM(sales) total_sales,
SUM(profit) total_profit
FROM Superstore
WHERE region = 'Central'
GROUP BY category
ORDER BY total_profit ASC;

  Query 2
  SELECT
region,
SUM(CASE WHEN category = 'Furniture' THEN profit ELSE 0 END) furniture_profit,
SUM(profit) t_profit,
(SUM(CASE WHEN category = 'Furniture' THEN profit ELSE 0 END) / SUM(profit)) * 100 furniture_impact_pct
FROM Superstore
WHERE region = 'Central'
GROUP BY region;

Loss-making Products
  Query
SELECT
product_name,
SUM(sales) total_sales,
SUM(profit) total_profit
FROM Superstore
WHERE region = 'Central'
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

Discount vs Profit
  Query
SELECT
discount,category,region,
AVG(profit) avg_profit,
COUNT(*) order_count
FROM Superstore
GROUP BY discount,category,region
ORDER BY discount;



