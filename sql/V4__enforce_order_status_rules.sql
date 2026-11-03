-- Run after V3 has backfilled every existing order during maintenance.
ALTER TABLE orders
    MODIFY COLUMN payment_status
        ENUM('PENDING', 'PAID', 'CANCELLED') NOT NULL;
