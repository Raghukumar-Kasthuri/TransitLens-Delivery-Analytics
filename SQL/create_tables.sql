USE [April_Excel]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 19-04-2026 10:34:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[customer_id] [int] NOT NULL,
	[customer_name] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [created_at]
GO
-------------------------------------------------------------



USE [April_Excel]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 19-04-2026 10:34:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[order_date] [date] NULL,
	[promised_delivery_date] [date] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [created_at]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO


--------------------------------------------


USE [April_Excel]
GO

/****** Object:  Table [dbo].[Delivery_Agents]    Script Date: 19-04-2026 10:34:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Delivery_Agents](
	[agent_id] [int] NOT NULL,
	[agent_name] [varchar](100) NULL,
	[region] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[agent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Delivery_Agents] ADD  DEFAULT (getdate()) FOR [created_at]
GO


--------------------------------------------------------

USE [April_Excel]
GO

/****** Object:  Table [dbo].[Deliveries]    Script Date: 19-04-2026 10:34:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Deliveries](
	[delivery_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[agent_id] [int] NULL,
	[delivery_date] [date] NULL,
	[delivery_status] [varchar](20) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Deliveries] ADD  DEFAULT (getdate()) FOR [created_at]
GO

ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([agent_id])
REFERENCES [dbo].[Delivery_Agents] ([agent_id])
GO

ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO


---------------------------------------------------------------



USE [April_Excel]
GO

/****** Object:  Table [dbo].[Shipment_Details]    Script Date: 19-04-2026 10:34:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Shipment_Details](
	[shipment_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[distance_km] [decimal](5, 2) NULL,
	[delivery_time_hours] [decimal](5, 2) NULL,
	[delay_reason] [varchar](100) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Shipment_Details] ADD  DEFAULT (getdate()) FOR [created_at]
GO

ALTER TABLE [dbo].[Shipment_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO


----------------------------------------------------------------------------------

