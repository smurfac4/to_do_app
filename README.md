# To-Do App

A Rails 8 app for managing tasks and comments.

## Stack

- Ruby 3.3 / Rails 8.1
- SQLite3 (development), PostgreSQL (production)
- Hotwire (Turbo + Stimulus)
- Docker

## Setup

```bash
bundle install
rails db:create db:migrate
./bin/dev
```

Open `http://localhost:3000`

## Docker

```bash
docker build -t to_do_app .
docker run -p 3000:3000 to_do_app
```

## Features

- Create and delete tasks with description, priority, and deadline
- Add and delete comments on tasks
- Overdue tasks highlighted in red