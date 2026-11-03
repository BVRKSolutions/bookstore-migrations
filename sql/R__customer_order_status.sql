CREATE OR REPLACE VIEW customer_order_status AS
SELECT
    o.id AS order_id,
    c.name AS customer_name,
    o.payment_status,
    o.delivery_status,
    o.ordered_at
FROM orders o
JOIN customers c ON c.id = o.customer_id;

