# Database Project

## CSV Files

This project includes the following CSV files:
- `customers.csv`
- `products.csv`
- `orders.csv`
- `order_items.csv`
- `reviews.csv`

## Steps to Create Database and Run Query

1. Create a new database (e.g., using SQLite, PostgreSQL, MySQL, or your preferred database system)
2. Create tables for each CSV file with appropriate columns and data types
3. Import the CSV files into their respective tables
4. Run the SQL query from `queries.sql` to retrieve the joined data

## Final JOIN SQL Query

```sql
SELECT o.order_id,
       c.name AS customer_name,
       o.order_date,
       p.name AS product_name,
       oi.quantity,
       oi.unit_price,
       (oi.quantity * oi.unit_price) AS line_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;
```

This query joins the `orders`, `customers`, `order_items`, and `products` tables to return order details with customer information, product names, quantities, unit prices, and calculated line totals.

