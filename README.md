# Data Analytics Project 3 — SQL Data Analysis

## Objective

Use SQL queries to extract insights from the cleaned e-commerce order dataset.

This project covers:
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT
- SUM
- AVG
- HAVING
- date-based grouping
- percentage contribution
- basic data-quality validation

## Database

SQLite database: `ecommerce_analysis.db`

Table: `orders`

## Dataset

The project uses the cleaned dataset from Project 1.

Rows: 1200
Columns: 14

## Example Findings

- Highest-revenue product: Chair
- Highest-revenue product revenue: 195620.11
- Top payment method by revenue: Credit Card
- Most common order status: Cancelled
- Top referral source by revenue: Instagram

## Files

- `ecommerce_analysis.db` — SQLite database
- `project_3_queries.sql` — all SQL queries in one file
- `sql_queries/` — individual SQL query files
- `query_results/` — CSV output for each query
- `sql_query_results.xlsx` — all query results in one workbook
- `README.md` — project documentation

## How to Run

### Option 1: SQLite
Open `ecommerce_analysis.db` with a SQLite client and run the SQL files.

### Option 2: Python
Use Python's built-in `sqlite3` module to connect to the database and execute the queries.

## Project Requirement Mapping

1. SELECT queries → `01_select_all.sql`
2. WHERE → `02_where_filter.sql`
3. ORDER BY → `03_order_by.sql`
4. GROUP BY → `04_group_by_product.sql`, `05_group_by_payment.sql`, etc.
5. COUNT, SUM, AVG → aggregation queries
6. HAVING → `08_having.sql`
7. Business insight → product, customer, referral, coupon and monthly analyses
