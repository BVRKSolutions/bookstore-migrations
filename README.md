# MySQL Online Bookstore Schema Migrations

This companion project assumes the database created in the original Online
Bookstore video already exists. It adopts that schema at Flyway version 1,
then evolves `orders.status` into separate payment and delivery states.

Make `BOOKSTORE_DB_PASSWORD` available to Flyway using the secret mechanism
for your local environment, then run from this directory:

```bash
flyway info
flyway baseline
flyway info
flyway migrate
flyway validate
```

The included `.env.example` documents the expected variable name. Copying it
to an ignored `.env` file is one optional local workflow; Flyway does not
require that file, and Windows, CI, or a secret manager can supply the same
environment variable directly.

The checked-in `sql/` directory represents the repository **after** the full
V2–V5 rollout. This tutorial uses a planned maintenance window: stop the
backend, run V2 through V4 in order, deploy and verify the backend that reads
the new columns, and then reopen the bookstore. V5 is deliberately held back
until the rollback window has closed. For filming, add or temporarily expose
each release file only when its chapter begins, matching the sequence in the
video.

Before applying `V5`, verify that the deployed backend no longer reads or
writes the legacy `orders.status` column. V5 is the contract step: it removes
the rollback-compatible column only after the new release is proven.
