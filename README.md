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

## 📈 Key Analysis Performed

1. Sales Performance Analysis
- Calculated total sales
- Calculated average sales per event
- Analyzed sales by product category
- Identified top-performing products
- Identified top-performing stores

2. Promotion Performance Analysis
- Compared quantity sold before and after promotions
- Analyzed performance by promotion type
- Calculated percentage increase in quantity sold
- Evaluated the effectiveness of different promotional offers

**Promotion types analyzed include:**

BOGOF

25% OFF

33% OFF

50% OFF

500 Cashback

3. Product Analysis
- Top 10 products by sales
- Top products based on quantity sold
- Product contribution to total sales
- Category-level sales performance

5. Store & City Analysis
- Top 10 stores by sales
- Quantity sold by city
- Sales performance across cities
- Identification of high-performing locations

6. Campaign Analysis
- Campaign-level performance
- Comparison of promotional campaigns
- Analysis of campaign-driven sales and quantity performance

6. Advanced SQL Analysis

**SQL analysis included:**

- Top products and stores
- Promotion performance
- Product ranking within cities
- Percentage increase after promotions
- Aggregated sales by category and city
- Ranking using window functions
- Multi-table analysis using joins and CTEs

---

## 📊 Power BI Dashboard

The Power BI dashboard provides an interactive view of overall sales and promotion performance.

**Key KPIs**
- Total Sales: 388.69M
- Total Events: 1,500
- Average Sales per Event: 259.12K
- Quantity Sold Before Promo: 209K
- Quantity Sold After Promo: 435K
- Dashboard Analysis

**The dashboard includes:**

- Sales by Product Category
- Quantity Sold by City
- Quantity Sold Before vs After Promotion
- Top Product by Sales
- Top 10 Stores by Sales
- Top 10 Products by Sales
- City-level analysis
- Campaign filters

---

## 🔍 Key Insights

**1. Promotions were associated with a substantial increase in quantity sold**

Total quantity increased from approximately 209K before promotion to 435K after promotion, representing an increase of roughly 108% based on the aggregated before/after quantities.

This indicates that promotional activity was strongly associated with higher sales volume.

Note: This comparison measures the recorded before-vs-after quantities in the dataset; it should not automatically be interpreted as a causal effect of promotions without additional controls.

**2. BOGOF generated the highest post-promotion quantity**

Among the analyzed promotion types, BOGOF generated the highest quantity sold after promotion, making it one of the strongest promotions in terms of sales volume.

**3. One product dominates overall sales**

Atliq_Home_Essential_8_Product_Combo generated approximately 224.85M in sales.

With total sales of approximately 388.69M, this product contributes around 58% of total sales.

This indicates a significant concentration of revenue in a single product.

**4. Combo products are the largest sales category**

The Combo1 category generated approximately 224.85M, considerably higher than the other product categories.

This category therefore represents a major contributor to overall sales.

**5. Bengaluru has the highest quantity sold**

Bengaluru recorded the highest quantity sold among the analyzed cities, followed by Chennai and Hyderabad.

This suggests that these locations represent important markets for sales and promotional activity.

**6. Store-level performance is relatively concentrated**

The top-performing stores generated approximately 9.5M–10.7M in sales individually.

This provides an opportunity to investigate why certain stores consistently outperform others.

**7. Not every promotion performed equally**

The before-vs-after promotion analysis shows that the improvement in quantity sold varies considerably by promotion type.

Therefore, applying the same promotional strategy across all products may not be optimal.

----

## 💡 Business Recommendations

**1. Prioritize high-performing promotions**

Promotions that demonstrate stronger increases in quantity sold should receive greater attention in future campaigns.

However, promotion selection should also consider profit margin, not only sales volume.

**2. Optimize BOGOF campaigns**

Since BOGOF generated the highest post-promotion quantity in this dataset, the business should investigate whether similar offers can be expanded to suitable high-demand products.

The profitability of BOGOF campaigns should be evaluated before scaling them.

**3. Reduce dependency on the top-selling product**

Approximately 58% of total sales comes from one product.

The business should avoid excessive dependency on a single product by:

Promoting strong secondary products

Creating product bundles

Cross-selling complementary products

Identifying products with growth potential

**4. Focus on high-performing cities**

Bengaluru, Chennai, and Hyderabad show strong quantity performance.

Marketing budgets and promotional campaigns can be prioritized in these markets while investigating opportunities to improve performance in lower-performing cities.

**5. Use targeted promotions instead of blanket discounts**

Different promotion types produce different results.

Promotions should therefore be selected based on:

Product category

Product demand

Historical performance

City

Store

Profit margin

**6. Evaluate profitability, not just quantity**

A promotion that increases quantity sold may still reduce profitability.

Future analysis should include:

Discount amount

Profit margin

Profit per product

Promotion cost

Incremental revenue

Incremental profit

This would provide a more complete measure of promotion effectiveness.

---

## 🧠 Skills Demonstrated

**Excel**

- Conditional aggregation
- Lookup functions
- Error handling
- Data validation
- Spreadsheet-based analysis

**SQL**

- Data extraction and transformation
- Aggregation and grouping
- Filtering aggregated results
- Multi-table joins
- Conditional logic using CASE
- CTEs
- Window functions
- Ranking
- Percentage calculations
-Business-oriented SQL analysis

**Power BI**

- Data modeling
- Star schema design
- Relationship management
- DAX measures
- Calculated columns
- KPI development
- Interactive dashboard development
- Data visualization
- Top-N analysis
- Business insight generation

---

## 📌 Project Outcome

This project demonstrates an end-to-end data analytics workflow by combining Excel for data-level analysis, SQL Server for structured business analysis, and Power BI for data modeling, DAX calculations, visualization, and interactive reporting.

The analysis converts raw campaign and sales data into actionable insights related to promotion effectiveness, product performance, category contribution, and geographical sales performance.

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
