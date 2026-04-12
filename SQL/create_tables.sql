CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    region VARCHAR(50),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    promised_delivery_date DATE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Delivery_Agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    region VARCHAR(50),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);



CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    agent_id INT,
    delivery_date DATE,
    delivery_status VARCHAR(20),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (agent_id) REFERENCES Delivery_Agents(agent_id)
);



CREATE TABLE Shipment_Details (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    distance_km DECIMAL(5,2),
    delivery_time_hours DECIMAL(5,2),
    delay_reason VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
