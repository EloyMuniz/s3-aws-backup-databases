-- CreateTable
CREATE TABLE "use_users" (
    "use_uuid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "use_email" VARCHAR(50),
    "use_password" VARCHAR(255),
    "use_date_expire" VARCHAR(50),
    "use_quant" INTEGER,
    "use_token" VARCHAR(255),
    "use_created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "use_updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "use_name" VARCHAR(255),

    CONSTRAINT "pk_use" PRIMARY KEY ("use_uuid")
);
