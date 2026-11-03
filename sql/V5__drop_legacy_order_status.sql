-- Contract only after every running application version uses payment_status.
ALTER TABLE orders
    DROP COLUMN status;

