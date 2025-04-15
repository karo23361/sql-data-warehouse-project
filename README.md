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


# Data Integration Model: CRM + ERP Unified View  

This diagram outlines a **hybrid integration model** combining customer, product, and transactional data from **CRM** and **ERP** systems into a cohesive analytics-ready structure.  

---

## 📦 **Data Sources & Entities**  

### **CRM System**  
- **Product Data**:  
  - `crm_prd_info` (Current/historical products)  
    - Keys: `prd_key`, `PRODUCT` (name/details)  
- **Customer Data**:  
  - `crm_cust_info`  
    - Keys: `cst_id`, `cst_key`, `CUSTOMER` (core attributes)  
- **Transactional Data**:  
  - Linked via `prd_key` + `cst_id` in `SALES` records.  

### **ERP System**  
- **Product Enrichment**:  
  - `erp_px_cat_g1v2`: Product categories (`id`, `PRODUCT`).  
- **Customer Enrichment**:  
  - `erp_cust_az12`: Birthdates (`cid` linked to `CUSTOMER`).  
  - `erp_loc_a101`: Customer country (`cid`).  

---

## 🔗 **Integration Logic**  
1. **Customer 360°**:  
   - Merge `crm_cust_info` (CRM) with ERP’s `erp_cust_az12` (birthdates) and `erp_loc_a101` (location).  
2. **Product Hierarchy**:  
   - Combine CRM’s `crm_prd_info` with ERP’s `erp_px_cat_g1v2` for category mapping.  
3. **Sales Context**:  
   - Transactional records link products (`prd_key`) and customers (`cst_id`) for end-to-end analysis.  

---

## 💡 **Key Benefits**  
- **Holistic Insights**: Correlate sales with customer demographics (age/location) and product categories.  
- **Data Consistency**: Resolve overlaps (e.g., `PRODUCT` names) across systems.  
- **Scalable Joins**: Clear foreign keys (`cid`, `prd_key`) enable efficient aggregation.  

*Example Use Case:*  
*"Analyze sales performance by customer age group and country, filtered by product category."*  

*(Ideal for ELT pipelines or virtual federation with tools like dbt, Snowflake, or Power BI.)*  

