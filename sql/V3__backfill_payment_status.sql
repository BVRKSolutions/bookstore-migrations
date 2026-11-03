-- Existing orders keep their original payment meaning.
UPDATE orders
SET payment_status = status
WHERE payment_status IS NULL;

