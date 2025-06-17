# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Docker Setup

Use `docker-compose up` to start the application in development. The `web`
service automatically runs any pending database migrations on boot.

## Joining a Game

Each game has a `uuid` that players use to connect over WebSockets.
Connect to `ws://localhost:3000/cable` with the following subscription
payload:

```json
{"command":"subscribe","identifier":"{\"channel\":\"GameChannel\",\"uuid\":\"GAME_UUID\"}"}
```

After subscribing the server responds with the list of scavenger items for
that game. Send a JSON message with `{ "action": "join", "name": "Player" }`
to register as a player. Submitting photos is done with:

```json
{"action":"submit","player_id":1,"item_id":2,"photo":"/path/to/image.jpg"}
```
