-- +goose Up
-- +goose StatementBegin
CREATE TYPE "tbl_user_online_enum" AS ENUM (
  'y',
  'n'
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "be_safe_online" (
                                  "id" SERIAL PRIMARY KEY,
                                  "title" text,
                                  "description" text NOT NULL,
                                  "parents_description" text NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_children" (
                                            "id" SERIAL PRIMARY KEY,
                                            "user_id" int NOT NULL,
                                            "haveChildren" int
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "privacy_policy" (
                                  "id" SERIAL PRIMARY KEY,
                                  "title" text,
                                  "description" text NOT NULL,
                                  "parents_description" text
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "tbl_admin" (
                             "id" SERIAL PRIMARY KEY,
                             "username" varchar(111) UNIQUE NOT NULL,
                             "email" varchar(111) UNIQUE NOT NULL,
                             "token" varchar(111),
                             "isVerified" int NOT NULL DEFAULT 0,
                             "password" varchar(111) NOT NULL,
                             "otp" varchar(111),
                             "login_at" timestamp,
                             "created_at" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "tbl_plan" (
                            "id" SERIAL PRIMARY KEY,
                            "plan_type" varchar(111) NOT NULL,
                            "plan_amount" varchar(500) NOT NULL,
                            "duration" varchar(111),
                            "createdAt" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                            "pay_amount" varchar(500) NOT NULL,
                            "saving" varchar(500),
                            "per_month" varchar(500) NOT NULL,
                            "payamount_dlr" varchar(500) NOT NULL,
                            "dlr_conversion" varchar(100) NOT NULL,
                            "plan_id" int DEFAULT 0
);

CREATE TABLE "tbl_token" (
                             "id" SERIAL PRIMARY KEY,
                             "user_id" int NOT NULL,
                             "token" varchar(255) NOT NULL,
                             "expireAt" date NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "tbl_user" (
                            "id" SERIAL PRIMARY KEY,
                            "email" varchar(111) UNIQUE NOT NULL,
                            "googleId" varchar(100) UNIQUE NOT NULL,
                            "username" varchar(111) UNIQUE NOT NULL,
                            "password" varchar(111) NOT NULL,
                            "is_verified" int DEFAULT 0,
                            "online" tbl_user_online_enum NOT NULL DEFAULT 'n',
                            "otp" varchar(10),
                            "socket_id" varchar(200),
                            "created_at" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                            "plan_expire" timestamp,
                            "unique_id" varchar(25),
                            "rp_token" varchar(25),
                            "plan_type" varchar(20) NOT NULL DEFAULT 'free',
                            "name" varchar(20),
                            "plan_id" int NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "blocked_profile" (
                                   "id" SERIAL PRIMARY KEY,
                                   "by_user_id" int NOT NULL,
                                   "to_user_id" int NOT NULL,
                                   "counter" int NOT NULL,
                                   "block_at" date NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "detail_profile" (
                                  "id" SERIAL PRIMARY KEY,
                                  "community" varchar(200),
                                  "date_of_birth" date DEFAULT '1990-01-01',
                                  "current_address" varchar(500),
                                  "marital_status" varchar(200),
                                  "country" varchar(100),
                                  "district" varchar(100),
                                  "education" varchar(100),
                                  "user_id" int NOT NULL,
                                  "plan_id" int NOT NULL,
                                  "siblings" varchar(200),
                                  "religion" varchar(200),
                                  "number_of_children" varchar(10) DEFAULT '0',
                                  "height" float DEFAULT 0,
                                  "bio" varchar(200),
                                  "profession" varchar(200),
                                  "path3" varchar(500),
                                  "interested_in" varchar(155) NOT NULL,
                                  "gender" varchar(55) NOT NULL,
                                  "zodiac" varchar(100) DEFAULT '',
                                  "date_of_subscription" varchar(100),
                                  "resident_status" varchar(20),
                                  "createdAt" timestamp,
                                  "updatedAt" timestamp
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "fav_profile" (
                               "id" SERIAL PRIMARY KEY,
                               "fav_by" int NOT NULL,
                               "fav_to" int NOT NULL,
                               "is_fav" varchar(200) NOT NULL DEFAULT 'true',
                               "fav_at" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "fc_tokens" (
                             "id" SERIAL PRIMARY KEY,
                             "user_id" int NOT NULL,
                             "fc_token" varchar(255),
                             "created_at" timestamp
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "friend_profile" (
                                  "id" SERIAL PRIMARY KEY,
                                  "sender_id" int NOT NULL,
                                  "receiver_id" int NOT NULL,
                                  "status" varchar(200) NOT NULL DEFAULT 'pending',
                                  "friend_at" date NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "messages" (
                            "id" SERIAL PRIMARY KEY,
                            "sender_id" int NOT NULL,
                            "recipient_id" int NOT NULL,
                            "data" text NOT NULL,
                            "isRead" int DEFAULT 0,
                            "sent_at" timestamp,
                            "deleted_for" json
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences" (
                                   "id" SERIAL PRIMARY KEY,
                                   "user_id" int NOT NULL,
                                   "name" varchar(20),
                                   "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_age" (
                                       "lower_age" int DEFAULT 18,
                                       "higher_age" int DEFAULT 65,
                                       "user_id" int NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_community" (
                                             "id" SERIAL PRIMARY KEY,
                                             "user_id" int NOT NULL,
                                             "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_country" (
                                           "id" SERIAL PRIMARY KEY,
                                           "user_id" int NOT NULL,
                                           "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_current_address" (
                                                   "id" SERIAL PRIMARY KEY,
                                                   "user_id" int NOT NULL,
                                                   "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_district" (
                                            "id" SERIAL PRIMARY KEY,
                                            "user_id" int NOT NULL,
                                            "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_education" (
                                             "id" SERIAL PRIMARY KEY,
                                             "user_id" int NOT NULL,
                                             "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_gender" (
                                          "id" SERIAL PRIMARY KEY,
                                          "user_id" int NOT NULL,
                                          "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_marital_status" (
                                                  "id" SERIAL PRIMARY KEY,
                                                  "user_id" int NOT NULL,
                                                  "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_profession" (
                                              "id" SERIAL PRIMARY KEY,
                                              "user_id" int NOT NULL,
                                              "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_religion" (
                                            "id" SERIAL PRIMARY KEY,
                                            "user_id" int NOT NULL,
                                            "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_resident_status" (
                                                   "id" SERIAL PRIMARY KEY,
                                                   "user_id" int NOT NULL,
                                                   "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_siblings" (
                                            "id" SERIAL PRIMARY KEY,
                                            "user_id" int NOT NULL,
                                            "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "opp_preferences_zodiac" (
                                          "id" SERIAL PRIMARY KEY,
                                          "user_id" int NOT NULL,
                                          "value" varchar(20)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "payment" (
                           "id" SERIAL PRIMARY KEY,
                           "method" varchar(255) NOT NULL,
                           "amount" varchar(255) NOT NULL,
                           "transaction_id" varchar(255) NOT NULL,
                           "plan_id" int NOT NULL,
                           "user_id" int NOT NULL,
                           "pay_at" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "tbl_notification" (
                                    "id" SERIAL PRIMARY KEY,
                                    "user_id" int NOT NULL,
                                    "token_title" varchar(111) NOT NULL,
                                    "token_body" varchar(111) NOT NULL,
                                    "type" varchar(255) NOT NULL,
                                    "notification_key" varchar(255) NOT NULL,
                                    "value" varchar(255) NOT NULL,
                                    "secondary_user" int NOT NULL,
                                    "time" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                                    "secondary_username" varchar(111) NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "terms_condition" (
                                   "id" SERIAL PRIMARY KEY,
                                   "title" text,
                                   "description" text,
                                   "parents_description" text NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "test" (
                        "id" SERIAL PRIMARY KEY,
                        "height" float DEFAULT 0,
                        "dob" timestamp DEFAULT '2020-10-20 00:00:00'
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "user_image" (
                              "id" SERIAL PRIMARY KEY,
                              "path1" varchar(255) NOT NULL,
                              "user_id" int NOT NULL,
                              "path2" varchar(255),
                              "path3" varchar(255)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "viewed_profiles" (
                                   "id" SERIAL PRIMARY KEY,
                                   "user_id" int NOT NULL,
                                   "viewed_id" int NOT NULL,
                                   "viewed_at" timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "who_can_view_profile" (
                                        "id" SERIAL PRIMARY KEY,
                                        "community" json,
                                        "marital_status" json,
                                        "current_address" json,
                                        "country" json,
                                        "district" json,
                                        "education" json,
                                        "user_id" int NOT NULL,
                                        "siblings" json,
                                        "religion" json,
                                        "height" json,
                                        "higher_age" int,
                                        "lower_age" int,
                                        "profession" json,
                                        "gender" json,
                                        "resident_status" json
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE "who_view_profile" (
                                    "id" SERIAL PRIMARY KEY,
                                    "who_view_id" int NOT NULL,
                                    "whom_view_id" int NOT NULL,
                                    "view_at" date NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE INDEX "user_id" ON "fc_tokens" ("user_id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_children" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "tbl_token" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "tbl_user" ADD FOREIGN KEY ("plan_id") REFERENCES "tbl_plan" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "blocked_profile" ADD FOREIGN KEY ("by_user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "blocked_profile" ADD FOREIGN KEY ("to_user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "detail_profile" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "detail_profile" ADD FOREIGN KEY ("plan_id") REFERENCES "tbl_plan" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "fav_profile" ADD FOREIGN KEY ("fav_by") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "fav_profile" ADD FOREIGN KEY ("fav_to") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "fc_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "friend_profile" ADD FOREIGN KEY ("sender_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "friend_profile" ADD FOREIGN KEY ("receiver_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "messages" ADD FOREIGN KEY ("sender_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "messages" ADD FOREIGN KEY ("recipient_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_age" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_community" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_country" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_current_address" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_district" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_education" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_gender" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_marital_status" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_profession" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_religion" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_resident_status" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_siblings" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "opp_preferences_zodiac" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "payment" ADD FOREIGN KEY ("plan_id") REFERENCES "tbl_plan" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "payment" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "tbl_notification" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "tbl_notification" ADD FOREIGN KEY ("secondary_user") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "user_image" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "viewed_profiles" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "viewed_profiles" ADD FOREIGN KEY ("viewed_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "who_can_view_profile" ADD FOREIGN KEY ("user_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "who_view_profile" ADD FOREIGN KEY ("who_view_id") REFERENCES "tbl_user" ("id");
-- +goose StatementEnd

-- +goose StatementBegin
ALTER TABLE "who_view_profile" ADD FOREIGN KEY ("whom_view_id") REFERENCES "tbl_user" ("id");

-- +goose StatementEnd

-- +goose Down

-- +goose StatementBegin
DROP TABLE "be_safe_online";
-- +goose StatementEnd

