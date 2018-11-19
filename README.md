# README

## Installation (via Docker)

The app follow the conventions of standard Rails 5 API application.

Env:

```bash
cp .env.example .env
```

Build:

```bash
docker-compose build --pull
```

Running the containers:

```bash
docker-compose up -d
```

Running tests:

```bash
docker-compose run --rm web rspec ./spec
```
