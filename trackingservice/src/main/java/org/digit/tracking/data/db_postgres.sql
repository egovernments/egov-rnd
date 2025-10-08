CREATE TABLE "poi" (
  "id" varchar(100) NOT NULL,
  "location_name" varchar(100) NOT NULL,
  "status" varchar(100) DEFAULT NULL,
  "type" varchar(100) DEFAULT NULL,
  "created_date" varchar(100) DEFAULT NULL,
  "created_by" varchar(100) DEFAULT NULL,
  "updated_date" varchar(100) DEFAULT NULL,
  "updated_by" varchar(100) DEFAULT NULL,
  "user_id" varchar(100) DEFAULT NULL,
  "position" geometry NOT NULL,
  "tenant_id" varchar(100) DEFAULT NULL,
  "alert" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "POI_locationName_IDX" UNIQUE ("location_name"),
  CONSTRAINT "POI_userId_IDX" UNIQUE ("user_id")
);
CREATE INDEX poi_position_idx ON public."poi" ("position");

CREATE TABLE "route" (
  "id" varchar(100) NOT NULL,
  "start_poi" varchar(100) DEFAULT NULL,
  "end_poi" varchar(100) DEFAULT NULL,
  "name" varchar(100) DEFAULT NULL,
  "status" varchar(100) DEFAULT NULL,
  "intermediate_pois" jsonb DEFAULT NULL,
  "created_date" varchar(100) DEFAULT NULL,
  "created_by" varchar(100) DEFAULT NULL,
  "updated_date" varchar(100) DEFAULT NULL,
  "updated_by" varchar(100) DEFAULT NULL,
  "user_id" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "Route_name_IDX" UNIQUE ("name"),
  CONSTRAINT "Route_userId_IDX" UNIQUE ("user_id")
);

CREATE TABLE "trip" (
  "id" varchar(100) NOT NULL,
  "operator" jsonb DEFAULT NULL,
  "service_code" varchar(100) DEFAULT NULL,
  "status" varchar(100) DEFAULT NULL,
  "route_id" varchar(100) DEFAULT NULL,
  "planned_start_time" varchar(100) DEFAULT NULL,
  "planned_end_time" varchar(100) DEFAULT NULL,
  "actual_start_time" varchar(100) DEFAULT NULL,
  "actual_end_time" varchar(100) DEFAULT NULL,
  "user_id" varchar(100) DEFAULT NULL,
  "created_date" varchar(100) DEFAULT NULL,
  "created_by" varchar(100) DEFAULT NULL,
  "updated_date" varchar(100) DEFAULT NULL,
  "updated_by" varchar(100) DEFAULT NULL,
  "tenant_id" varchar(100) DEFAULT NULL,
  "trip_end_type" varchar(100) DEFAULT NULL,
  "reference_no" varchar(100) DEFAULT NULL,
  "alerts" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "trip_progress" (
  "id" varchar(100) NOT NULL,
  "trip_id" varchar(100) DEFAULT NULL,
  "progress_reported_time" varchar(100) DEFAULT NULL,
  "user_id" varchar(100) DEFAULT NULL,
  "position_point" geometry DEFAULT NULL,
  "progress_time" varchar(100) DEFAULT NULL,
  "matched_poi_id" varchar(100) DEFAULT NULL,
  "created_by" varchar(100) DEFAULT NULL,
  "created_date" varchar(100) DEFAULT NULL,
  "updated_date" varchar(100) DEFAULT NULL,
  "updated_by" varchar(100) DEFAULT NULL,
  "location_alert_code" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "service_type" (
  "code" varchar(100) NOT NULL,
  "name" varchar(100) NOT NULL,
  "tenant_id" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("code")
);

CREATE TABLE "location_alert" (
  "code" varchar(100) NOT NULL,
  "title" varchar(100) NOT NULL,
  PRIMARY KEY ("code")
);

CREATE TABLE "trip_alert" (
  "id" varchar(100) NOT NULL,
  "trip_id" varchar(100) DEFAULT NULL,
  "trip_progress_id" varchar(100) DEFAULT NULL,
  "alert" varchar(100) DEFAULT NULL,
  "alert_date_time" varchar(100) DEFAULT NULL,
  "tenant_id" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "TripAlert_tripId_IDX" FOREIGN KEY ("trip_id") REFERENCES "trip"("id")
);
