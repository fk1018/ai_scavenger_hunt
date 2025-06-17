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
If Docker emits TLS errors while pulling images, ensure your internet connection
is available or try again using the default `ruby:3.3-slim` image.

## Joining a Game

Each game has a `uuid` that players use to connect over WebSockets.
A UUID is automatically generated whenever a new game is created.
Connect to `ws://localhost:3000/cable` with the following subscription
payload:

```json
{"command":"subscribe","identifier":"{\"channel\":\"GameChannel\",\"uuid\":\"GAME_UUID\"}"}
```

After subscribing the server responds with the list of scavenger items for
that game. A simple way to join over HTTP is by visiting
`http://localhost:3000/players/new?game_id=GAME_UUID` or sending a POST request
to `http://localhost:3000/players` with `player[game_id]` and
`player[name]` parameters. You can also join via WebSockets by sending
`{ "action": "join", "name": "Player" }`. Submitting photos is done with:

```json
{"action":"submit","player_id":1,"item_id":2,"photo":"/path/to/image.jpg"}
```
