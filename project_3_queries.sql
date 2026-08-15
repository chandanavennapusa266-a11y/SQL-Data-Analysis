-- 01_select_all.sql
-- Display the first 20 records
SELECT *
FROM orders
LIMIT 20;


-- 02_where_filter.sql
-- Orders with quantity greater than 2
SELECT OrderID, CustomerID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
WHERE Quantity > 2
ORDER BY Quantity DESC;


-- 03_order_by.sql
-- Highest-value orders
SELECT OrderID, CustomerID, Product, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 20;


-- 04_group_by_product.sql
-- Order count, total revenue and average order value by product
SELECT
    Product,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;


-- 05_group_by_payment.sql
-- Orders and revenue by payment method
SELECT
    PaymentMethod,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;


-- 06_group_by_status.sql
-- Orders by order status
SELECT
    OrderStatus,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;


-- 07_customer_aggregation.sql
-- Customer-level purchase summary
SELECT
    CustomerID,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_spent,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC;


-- 08_having.sql
-- Customers with at least 2 orders and total spending above 1000
SELECT
    CustomerID,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_spent
FROM orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 2
   AND SUM(TotalPrice) > 1000
ORDER BY total_spent DESC;


-- 09_date_analysis.sql
-- Monthly order count and revenue
SELECT
    strftime('%Y-%m', Date) AS order_month,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY strftime('%Y-%m', Date)
ORDER BY order_month;


-- 10_referral_source.sql
-- Performance by referral source
SELECT
    ReferralSource,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;


-- 11_coupon_analysis.sql
-- Coupon usage analysis
SELECT
    CouponCode,
    COUNT(OrderID) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY CouponCode
ORDER BY order_count DESC;


-- 12_percentage_contribution.sql
-- Product percentage contribution to total revenue
SELECT
    Product,
    SUM(TotalPrice) AS product_revenue,
    ROUND(
        100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders),
        2
    ) AS revenue_percentage
FROM orders
GROUP BY Product
ORDER BY revenue_percentage DESC;


-- 13_data_quality.sql
-- Verify record count and unique OrderIDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT OrderID) AS unique_order_ids,
    COUNT(*) - COUNT(DISTINCT OrderID) AS duplicate_order_id_count
FROM orders;
