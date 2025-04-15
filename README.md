# Data Warehouse and Analytics Project

## 🚀 What This Project is All About

Welcome to a hands-on, end-to-end data engineering journey! This repository showcases a modern data warehouse solution built with best practices in mind. Here’s what you’ll explore inside:

### 🏗️ Modern Data Architecture
A layered **Medallion Architecture** implementation—**Bronze**, **Silver**, and **Gold**—designed to ensure data quality, scalability, and performance.

### 🔄 Robust ETL Pipelines
Custom-built pipelines that handle the **extraction, transformation, and loading** of data from raw sources into structured layers using industry-standard workflows.

### 🧠 Smart Data Modeling
Design of **star schema** structures with optimized **fact and dimension tables** to power analytical workloads and accelerate insights.

### 📊 Actionable Analytics
Dynamic dashboards and **SQL-driven reports** that turn data into meaningful business intelligence.

---

## 📦 Data Flow Diagram 

![Diagram_1 drawio](https://github.com/user-attachments/assets/de69d475-0179-4b37-b487-775e71ee1dea) 

This diagram illustrates a **3-layer data architecture** designed to transform raw business data into actionable insights.  

## 🔍 Overview  

- **Sources**: CRM & ERP systems feed raw data into the pipeline.  
- **Bronze Layer**: Stores unprocessed data (e.g., `cm_sales_details`, `cust_info`).  
- **Silver Layer**: Contains cleaned, standardized, or enriched versions of Bronze tables.  
- **Gold Layer**: Optimized for analytics (e.g., star schema with `fact_sales`, `dim_customers`).  

## 🚀 Why It Matters  
- **Scalable**: Handles raw to refined data in structured stages.  
- **Analytics-Ready**: Gold Layer enables fast reporting and BI tools.  
- **Traceability**: Preserves raw data (Bronze) while enabling transformations.

## Integration Model

![Diagram_2 drawio](https://github.com/user-attachments/assets/9983fe49-c689-4a3e-b868-35960df847df)


flowchart LR  
  CRM -->|crm_prd_info| Products  
  CRM -->|crm_cust_info| Customers  
  CRM -->|prd_key + cst_id| Sales  
  ERP -->|erp_px_cat_g1v2| Products  
  ERP -->|erp_cust_az12 + erp_loc_a101| Customers  

