# musifly_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop



Database Migrations:

1. Update model

2. Re-generate model in src/generated/ folder: 
```serverpod generate```

3. Create migration note in /migrations: 
```serverpod create-migration```

4. Apply Database Migration: 
```dart run bin/main.dart --role maintenance --apply-migrations```