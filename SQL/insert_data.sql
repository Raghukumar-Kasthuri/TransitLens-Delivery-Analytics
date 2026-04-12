
DECLARE @i INT = 1;

WHILE @i <= 50
BEGIN
    INSERT INTO Customers (customer_id, customer_name, city, region)
    VALUES (
        @i,
        CONCAT('Customer_', @i),
        CASE 
            WHEN @i % 5 = 0 THEN 'Hyderabad'
            WHEN @i % 5 = 1 THEN 'Delhi'
            WHEN @i % 5 = 2 THEN 'Bangalore'
            WHEN @i % 5 = 3 THEN 'Mumbai'
            ELSE 'Kolkata'
        END,
        CASE 
            WHEN @i % 4 = 0 THEN 'South'
            WHEN @i % 4 = 1 THEN 'North'
            WHEN @i % 4 = 2 THEN 'West'
            ELSE 'East'
        END
    );

    SET @i = @i + 1;
END;



DECLARE @i INT = 1;

WHILE @i <= 10
BEGIN
    INSERT INTO Delivery_Agents (agent_id, agent_name, region)
    VALUES (
        100 + @i,
        CONCAT('Agent_', @i),
        CASE 
            WHEN @i % 4 = 0 THEN 'South'
            WHEN @i % 4 = 1 THEN 'North'
            WHEN @i % 4 = 2 THEN 'West'
            ELSE 'East'
        END
    );

    SET @i = @i + 1;
END;
----------------------------------------------------


DECLARE @i INT = 1;

WHILE @i <= 200
BEGIN
    INSERT INTO Orders (order_id, customer_id, order_date, promised_delivery_date)
    VALUES (
        1000 + @i,
        (ABS(CHECKSUM(NEWID())) % 50) + 1,
        DATEADD(DAY, -@i, GETDATE()),
        DATEADD(DAY, 5, DATEADD(DAY, -@i, GETDATE()))
    );

    SET @i = @i + 1;
END;

-----------------------------

DECLARE @i INT = 1;

WHILE @i <= 200
BEGIN
    DECLARE @order_date DATE;
    DECLARE @promised_date DATE;
    DECLARE @delivery_date DATE;

    SELECT 
        @order_date = order_date,
        @promised_date = promised_delivery_date
    FROM Orders WHERE order_id = 1000 + @i;

    SET @delivery_date = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 7), @order_date);

    INSERT INTO Deliveries (delivery_id, order_id, agent_id, delivery_date, delivery_status)
    VALUES (
        5000 + @i,
        1000 + @i,
        (ABS(CHECKSUM(NEWID())) % 10) + 101,
        @delivery_date,
        CASE 
            WHEN @delivery_date <= @promised_date THEN 'On-Time'
            ELSE 'Delayed'
        END
    );

    SET @i = @i + 1;
END;


---------------------


DECLARE @i INT = 1;

WHILE @i <= 200
BEGIN
    INSERT INTO Shipment_Details (shipment_id, order_id, distance_km, delivery_time_hours, delay_reason)
    VALUES (
        9000 + @i,
        1000 + @i,
        (ABS(CHECKSUM(NEWID())) % 50) + 5,
        (ABS(CHECKSUM(NEWID())) % 120) + 24,
        CASE 
            WHEN @i % 5 = 0 THEN 'Traffic'
            WHEN @i % 5 = 1 THEN 'Weather'
            WHEN @i % 5 = 2 THEN 'Warehouse Delay'
            WHEN @i % 5 = 3 THEN 'Customer Not Available'
            ELSE NULL
        END
    );

    SET @i = @i + 1;
END;
