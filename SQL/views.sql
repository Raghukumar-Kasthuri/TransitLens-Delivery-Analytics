USE [April_Excel]
GO

/****** Object:  View [dbo].[vw_AgentPerformance]    Script Date: 19-04-2026 10:42:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_AgentPerformance] AS
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
GO


------------------------------------------------


USE [April_Excel]
GO

/****** Object:  View [dbo].[vw_AvgDeliveryTime]    Script Date: 19-04-2026 10:42:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_AvgDeliveryTime] AS
SELECT 
    AVG(DATEDIFF(DAY, o.order_date, d.delivery_date)) AS avg_delivery_days
FROM Orders o
JOIN Deliveries d ON o.order_id = d.order_id;


GO


---------------------------------------------------------

USE [April_Excel]
GO

/****** Object:  View [dbo].[vw_DelayReasons]    Script Date: 19-04-2026 10:42:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_DelayReasons] AS
SELECT 
    delay_reason,
    COUNT(*) AS total_delays
FROM Shipment_Details
WHERE delay_reason IS NOT NULL
GROUP BY delay_reason;
GO


---------------------------------------------



USE [April_Excel]
GO

/****** Object:  View [dbo].[vw_OnTimePerformance]    Script Date: 19-04-2026 10:42:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_OnTimePerformance] AS
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
GO


-----------------------------------------------------------------
USE [April_Excel]
GO

/****** Object:  View [dbo].[vw_RegionPerformance]    Script Date: 19-04-2026 10:43:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_RegionPerformance] AS
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
GO


