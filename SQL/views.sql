SELECT 
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivery_date > o.promised_delivery_date THEN 1 ELSE 0 END) AS delayed_deliveries,
    CAST(
        100.0 * SUM(CASE WHEN d.delivery_date > o.promised_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*) 
    AS DECIMAL(5,2)) AS delay_percentage
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id;



-----------------------

CREATE VIEW vw_OnTimePerformance AS
SELECT 
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) AS on_time_deliveries,
    SUM(CASE WHEN d.delivery_date > o.promised_delivery_date THEN 1 ELSE 0 END) AS delayed_deliveries,
    CAST(
        100.0 * SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*) 
    AS DECIMAL(5,2)) AS on_time_percentage
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id;


--------------------------

CREATE VIEW vw_AvgDeliveryTime AS
SELECT 
    AVG(DATEDIFF(DAY, o.order_date, d.delivery_date)) AS avg_delivery_days
FROM Orders o
JOIN Deliveries d ON o.order_id = d.order_id;



-------------------------



CREATE VIEW vw_DelayReasons AS
SELECT 
    delay_reason,
    COUNT(*) AS total_delays
FROM Shipment_Details
WHERE delay_reason IS NOT NULL
GROUP BY delay_reason;

-----------------

CREATE VIEW vw_AgentPerformance AS
SELECT 
    a.agent_name,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) AS on_time_deliveries,
    CAST(
        100.0 * SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*) 
    AS DECIMAL(5,2)) AS on_time_percentage
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN Delivery_Agents a ON d.agent_id = a.agent_id
GROUP BY a.agent_name;

----------------------------


CREATE VIEW vw_RegionPerformance AS
SELECT 
    c.region,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) AS on_time_deliveries,
    CAST(
        100.0 * SUM(CASE WHEN d.delivery_date <= o.promised_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*) 
    AS DECIMAL(5,2)) AS on_time_percentage
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Deliveries d ON o.order_id = d.order_id
GROUP BY c.region;
