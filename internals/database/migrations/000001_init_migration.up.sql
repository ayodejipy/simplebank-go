CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "accounts" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	"name" VARCHAR(100) NOT NULL,
	"password" VARCHAR NOT NULL,
	"currency" VARCHAR(20) NOT NULL,
	"balance" DECIMAL(12, 2) DEFAULT 0.0,
	"created_at" TIMESTAMP NOT NULL DEFAULT (NOW()),
	"updated_at" TIMESTAMP NOT NULL DEFAULT (NOW()),
	"deleted_at" TIMESTAMP NULL
);

CREATE TABLE "transactions" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	"sender_id" uuid NOT NULL,
	"receiver_id" uuid NOT NULL,
	"amount" VARCHAR(50) NOT NULL,
	"created_at" TIMESTAMP NOT NULL DEFAULT (NOW()),
	"updated_at" TIMESTAMP NOT NULL,
	"deleted_at" TIMESTAMP NULL
);


ALTER TABLE "transactions" ADD FOREIGN KEY ("sender_id") REFERENCES "accounts" ("id");
ALTER TABLE "transactions" ADD FOREIGN KEY ("receiver_id") REFERENCES "accounts" ("id");

CREATE INDEX ON "accounts" ("id");

CREATE INDEX ON "transactions" ("sender_id");
CREATE INDEX ON "transactions" ("receiver_id");
CREATE INDEX ON "transactions" ("sender_id", "receiver_id");