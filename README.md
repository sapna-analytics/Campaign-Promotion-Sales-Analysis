# 📊 Campaign & Promotion Sales Analysis

## 📌 Project Overview

This project is an end-to-end **Campaign & Promotion Sales Analysis** designed to evaluate how promotional campaigns impact product sales, quantity sold, store performance, and customer demand across different cities and product categories.

The project uses **Excel, SQL Server, and Power BI** to perform data preparation, analysis, business calculations, and interactive visualization.

The analysis follows a complete data analytics workflow:

**Data Analysis in Excel → SQL-based Business Analysis → Power BI Data Modeling & Dashboarding**

---

## 🎯 Objective

The primary objective of this project is to analyze sales and promotional performance and identify:

- How promotions affect quantity sold
- Which promotion types perform best
- Which products and categories generate the highest sales
- Which cities and stores perform best
- Which products dominate overall sales
- How sales performance varies across campaigns
- Key opportunities for improving promotional strategies

---

## 💼 Business Problem

Retail businesses frequently use promotions such as **BOGOF, percentage discounts, and cashback offers** to increase product demand.

However, simply running promotions does not guarantee better performance. The business needs to understand:

- Which promotions actually increase sales volume?
- Which products benefit most from promotions?
- Which cities and stores generate the highest sales?
- Which product categories contribute most to revenue?
- Are promotional campaigns producing meaningful improvements in quantity sold?
- Are sales highly concentrated in a small number of products?

The goal of this analysis is to convert raw campaign and sales data into actionable business insights.

---

## 📂 Dataset Description

The dataset contains **1,500 sales events** recorded across multiple stores, products, cities, and promotional campaigns.

The data is organized into a dimensional model consisting of one fact table and three dimension tables.

### Fact Table — `fact_events`

Contains event-level sales and promotion information.

| Column | Description |
|---|---|
| `event_id` | Unique identifier for each event |
| `store_id` | Store identifier |
| `campaign_id` | Campaign identifier |
| `product_code` | Product identifier |
| `base_price` | Base price of the product |
| `promo_type` | Type of promotion applied |
| `quantity_sold(before_promo)` | Quantity sold before promotion |
| `quantity_sold(after_promo)` | Quantity sold after promotion |

### Dimension Tables

#### `dim_products`

Contains product-level information:

- `product_code`
- `product_name`
- `category`

#### `dim_stores`

Contains store and geographical information:

- `store_id`
- `city`

#### `dim_campaigns`

Contains campaign information:

- `campaign_id`
- `campaign_name`
- `start_date`
- `end_date`

---

## 🛠️ Tools & Technologies

### Microsoft Excel

Excel was used for data-level calculations, lookup operations, aggregation, and validation.

Key functions used:

- `SUMIF`
- `SUMIFS`
- `XLOOKUP`
- `VLOOKUP`
- `IFERROR`
- Conditional calculations and data validation

### SQL Server

SQL Server was used for structured data analysis and business-level querying.

Key SQL concepts used:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `TOP`
- `SUM`
- `AVG`
- `COUNT`
- `COUNT(DISTINCT)`
- `CASE`
- `JOIN`
- CTEs
- Window Functions
- `RANK()`
- `PARTITION BY`
- Percentage calculations

### Power BI

Power BI was used to build the analytical data model, create DAX calculations, and develop interactive dashboards.

Key features used:

- Star Schema Data Model
- Relationships between fact and dimension tables
- DAX Measures
- DAX Calculated Columns
- KPI Cards
- Clustered Column Charts
- Bar Charts
- Map Visual
- Interactive Slicers
- Top-N Analysis
- Promotion Performance Analysis

---

## 🔗 Data Model

The project follows a **star schema** approach.

```text
                    ┌──────────────────┐
                    │  dim_campaigns   │
                    │                  │
                    │ campaign_id      │
                    │ campaign_name    │
                    │ start_date       │
                    │ end_date         │
                    └────────┬─────────┘
                             │
                             │ 1 : *
                             │
┌──────────────────┐         ▼         ┌──────────────────┐
│   dim_stores     │    ┌───────────┐  │   dim_products   │
│                  │    │           │  │                  │
│ store_id         │───▶│fact_events│◀─│ product_code     │
│ city             │    │           │  │ product_name     │
└──────────────────┘    └───────────┘  │ category         │
                                       └──────────────────┘
