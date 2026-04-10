# 🚚 TransitLens: Delivery Performance Analytics System

---

## 📌 Project Overview

Delivery and logistics companies often face challenges in tracking delivery performance, identifying delay causes, and evaluating operational efficiency.

This project focuses on building a **data-driven analytics system** using SQL Server and Excel to monitor delivery performance and generate actionable insights.

---

## 🎯 Objective

The main objective of this project is to:

* Analyze delivery performance
* Identify key factors causing delays
* Evaluate agent and regional efficiency
* Build an interactive dashboard for business insights

---

## 🛠️ Tools & Technologies Used

* Microsoft SQL Server (Database & Querying)
* Microsoft Excel (Dashboard & Visualization)
* GitHub (Version Control & Documentation)

---

## 🧠 Key Business KPIs

The following KPIs were designed to measure performance:

* On-Time Delivery Percentage
* Average Delivery Time
* Delay Reasons Analysis
* Agent Performance
* Region Performance

---

## 🗂️ Database Design

The database is designed using a **Star Schema approach**, consisting of fact and dimension tables.

### 📊 Tables Created

* Customers
* Orders
* Deliveries
* Delivery_Agents
* Shipment_Details

### 🔗 Relationships

* Customers → Orders
* Orders → Deliveries
* Deliveries → Shipment Details
* Delivery Agents → Deliveries

---

## ⚙️ Data Generation

* Generated 200+ realistic records using SQL scripts
* Included multiple regions, agents, and delivery scenarios
* Simulated real-world delay conditions such as:

  * Traffic
  * Weather
  * Warehouse delays
  * Customer unavailability

---

## 📈 SQL Analysis (Views)

Created reusable SQL views to calculate KPIs:

* `vw_OnTimePerformance`
* `vw_AvgDeliveryTime`
* `vw_DelayReasons`
* `vw_AgentPerformance`
* `vw_RegionPerformance`

These views simplify data extraction and improve performance for reporting.

---

## 📊 Excel Dashboard

An interactive dashboard was built in Excel using:

* KPI Cards (On-Time %, Avg Time, Total Deliveries)
* Pie Chart (On-Time vs Delayed)
* Bar Chart (Delay Reasons)
* Column Chart (Agent Performance)
* Region Performance Analysis

---

## 📸 Dashboard Preview

(Add your dashboard screenshot here)

---

## 💡 Key Insights

* Majority of deliveries are completed on time
* Traffic and warehouse delays are major contributors to late deliveries
* Certain regions show higher delay percentages
* Performance varies significantly across delivery agents

---

## 🚀 Recommendations

* Optimize delivery routes to reduce traffic delays
* Improve warehouse processing efficiency
* Provide training for low-performing agents
* Implement real-time tracking for better monitoring

---

## 📚 Learnings

Through this project, I learned:

* Designing databases based on business KPIs
* Writing advanced SQL queries and views
* Connecting SQL Server with Excel
* Building dashboards for business analysis
* Thinking like a data analyst

---

## 🔮 Future Enhancements

* Integrate Power BI for advanced visualization
* Automate data pipeline using ETL tools
* Add real-time data tracking
* Enhance dashboard interactivity with filters

---

## 🙌 Conclusion

This project demonstrates how data can be used to improve delivery performance and support business decision-making through structured analysis and visualization.

---

⭐ If you found this project useful, feel free to give it a star!
