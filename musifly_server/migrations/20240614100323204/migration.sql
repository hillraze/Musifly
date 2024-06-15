BEGIN;


--
-- MIGRATION VERSION FOR musifly
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('musifly', '20240614100323204', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240614100323204', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
