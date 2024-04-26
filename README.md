# musifly

## Description

This is a music player app that allows users to search for tracks, create playlists, and listen to music. Users can also view the lyrics of the track they are listening to.

musifly_server is the backend server for the musifly app.
musifly_client is auto-generated logic
musifly_flutter is the frontend app. We work here mostly.

## Installation and Usage

https://docs.serverpod.dev/

## Install Docker Desktop Client for Windows

https://docs.docker.com/docker-for-windows/install/

## Run Musifly Server

```
cd musifly_server
serverpod generate
docker compose up --build --detach

if your passwords.yaml file in musifly_server/config/ is not generated, then re-generate it, or if it is still not generated, get it from this project.

dart bin/main.dart --apply-migrations
```

## Run Musifly Flutter

```
cd musifly_flutter
flutter run
```
