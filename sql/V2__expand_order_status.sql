-- Expand first: keep the legacy status column as a rollback path.
ALTER TABLE orders
    ADD COLUMN payment_status
        ENUM('PENDING', 'PAID', 'CANCELLED') NULL,
    ADD COLUMN delivery_status
        ENUM('NOT_READY', 'PACKED', 'SHIPPED', 'DELIVERED')
        NOT NULL DEFAULT 'NOT_READY';
