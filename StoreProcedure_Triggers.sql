-- Store Procedure and Triggers

-- Store Procedures

-- Create a New Order
-- Use case: safely creates an order without leaving bad data behind
DELIMITER $$
	CREATE PROCEDURE create_order(
		IN p_customer_id INT,
        IN p_restaurant_id INT,
        IN p_total_amount DECIMAL(10,2)
    )
    BEGIN
		DECLARE exit handler FOR SQLEXCEPTION
        BEGIN
			ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO orders(
		customer_id,
        restaurant_id,
        order_status,
        total_amount,
        order_date
    )
    VALUES (
		p_customer_id,
        p_restaurant_id,
        'PLACED',
        p_total_amount,
        NOW()
    );
    
    COMMIT;
  END$$

DELIMITER ;


-- Get Customer Order History
--  Use case: for customer support and analytics
DELIMITER $$

	CREATE PROCEDURE get_customer_orders(
		IN p_customer_id INT
    )
	BEGIN
		SELECT
			o.order_id,
            o.order_date,
            o.status,
            o.total_amount,
            r.restaurant_name
		FROM orders o
        JOIN restaurants r
			ON o.restaurant_id = r.restaurant_id
		WHERE o.customer_id = p_customer_id
        ORDER BY o.order_date DESC;
    END$$
DELIMITER ;

-- Test store procedure
CALL get_customer_orders(1);


-- Completed an order
DELIMITER $$
	
    CREATE PROCEDURE complete_order(
		IN p_order_id INT,
        IN p_paid_amount DECIMAL(10,2)
    )
    BEGIN
		START TRANSACTION;
        
        UPDATE orders
        SET order_status = 'COMPLETED'
        WHERE order_id = p_order_id;
        
        INSERT INTO payments(
			order_id,
            payment_status,
            paid_amount
        )
        VALUES(
			p_order_id,
            'Completed',
            p_paid_amount
        );
        
        COMMIT;
    END$$
DELIMITER ;

-- Triggers: Automatic 

-- Prevent Negative Order Total
DELIMITER $$

CREATE TRIGGER trg_validate_order_total
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	IF NEW.total_amount < 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order total cannot be negative';
	END IF;
END$$

DELIMITER ;




