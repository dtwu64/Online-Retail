# Analysis of Online Retail II Dataset
SQL queries and Tableau dashboard to analyze an online retail business

## Project Overview
The Online Retail II dataset from the UC Irvine Machine Repository (https://archive.ics.uci.edu/dataset/502/online+retail+ii) "contains all the transactions occurring for a UK-based and registered, non-store online retail between 01/12/2009 and 09/12/2011. The company mainly sells unique all-occasion gift-ware. Many customers of the company are wholesalers."
I wanted to analyze this data to gain various business and customer insights for this retailer. My goal was to practice writing SQL queries for this purpose and visualizing the data in a Tableau dashboard for presenting actionable insights.

## Dataset
The Online Retail II dataset includes two tables, one for orders occuring between December 1, 2009 and December 9, 2010, and another for orders occuring between December 1, 2010 and December 9, 2011. Each table includes columns for `invoiceno` (an identifying number for each order, which can include multiple products/purchases), `stockcode` (an identifying alphanumeric string for each product purchased), `description` of the product purchased, `quantity` of the product purchased, `invoicedate` (when the order was placed), `unitprice` (how much one unit of the product sells for), `customerid` (a unique identifier for each customer), and `country` where the order was placed from. I combined the tables together via union (stacked them on top of each other) and also created a `revenue` (per product per order) column by multiplying the `unitprice` and `quantity` columns together. 

## Methods
I performed PostgreSQL queries in pgAdmin 4 to analyze various KPIs including: total revenue, yearly revenue, monthly revenue, revenue by products, revenue by country, and customer recency, frequency, and monetary value. For product revenue, products were sorted into different product categories based on manual examination of the top 100 products by revenue (and everything else not falling into one of the categories was labeled as "other"). For the customer RFM, recency was determined by how many days since the most recent purchase (Dec. 9, 2011) for each customer with 0 days being the most recent and best, frequency was determined by number of orders for each customer with most orders being the best, and monetary was determined by revenue for each customer with highest revenue being the best. This data was combined into one table; then, NTILE was used to give each customer a score for each of the categories from 1 to 5 with 5 being the best. 

The results of the queries for monthly revenue, revenue by country, revenue by products, and customer RFM were also exported to be used as data sources in Tableau for creating the dashboard.

Visualization on the Tableau dashboard are:
* Large text highlighting total revenue, total number of orders, and total number of customers
* Line chart showing revenue over time. A trend line can be toggled on and off.
* Bar chart showing revenue per country. Each bar is also colorerd based on revenue just for aesthetics. There is a slide controller to select how many countries to display (default is top 10 countries).
* Side-by-side bar charts showing top products. The left chart shows revenue by product category and the right chart shows quantity by product category. You can click to the right of each of the x-axis labels to choose which chart to put in order.
* Histogram and bar chart for customer information (recency, frequency, and monetary). There are buttons to switch between the categories (using dynamic zone visability, inspiration from: https://www.youtube.com/watch?v=85qGR2SStks). The histogram shows how many customers fall in each bin for days since purchase (as of 12/9/11), number of orders, and revenue, respectively (some histograms are truncated when there too few customers in the later bins). The bar chart is colored based on if the customer is a "champion" (score of 5 in each category), "loyal customer" (scores of 4 or higher in each category, but not all 5's), "potential loyalist" (scores of 3 or higher in all categories, but not 4's or higher in all), or "other". There is also a slide controller to controller how many customers are displayed on the bar graph.

## Key Findings
Overall, revenue is trending upwards, but the line chart makes it easy to see there is seasonality. The business performs best in November, but the early parts of the year (January and February) tend to be the worst. Perhaps the business can improve promotions during these times, or create specialized products for these seasons to try to increase sales.

The UK produces the most revenue, which makes sense because it's a UK-based business. The next 4 countries with the highest revenue are Ireland, Netherlands, Germany, and France. Maybe the business can look into methods for increasing sales in these 4 countries since they already have some customer base there.

Although they are in different orders depending on if you sort by revenue or quantity, three product categories (not including other) are at the top of both lists: bag/shopper, light-related, and sign. As these are popular items, the business could consider trying to create more products in these categories or emphasizing them even more in ad campaigns (could bring in more customers).

About 7.9% of the customers fall into the "champion" category with a score of 5 in recency, frequency and monetary value. About 22.1% of customers have a score of at least 4 in recency, frequency, and monetary value (including the champions). Further work would need to be done if the business wanted to target specific customers (*e.g.*, customers with high monetary value but low recency who might have forgotten about the business but could buy a lot again if reminded). If there was more data to link customer IDs with addition info about the customers (*i.e.*, demographics), we could also look to find other customers with similar traits to the top customers to target (*e.g.*, with promotions) and increase their loyalty. 

## Repository
* The SQL queries are included in "SQL Queries for Online Retail," and some of the .sql files include commentary about the results of the query to suggest potential actions the business can take to improve KPIs.
* The view of the table used for all queries is included as "orders.csv"
* Other tables exported from the queries for use as data sources in Tableau are included in "Data Sources for Tableau."
* There's also a file, "Chart Selection.csv", used to create buttons for the dynamic zone visability in the Tableau dashboard.
* The Tableau workbook is included as "Online Retail Tableau.twb"
* An image of the dashboard is included as "Online Retail Dashboard.png"
