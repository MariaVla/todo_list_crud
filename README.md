# rails-interview / TodoApi

[![Open in Coder](https://dev.crunchloop.io/open-in-coder.svg)](https://dev.crunchloop.io/templates/fly-containers/workspace?param.Git%20Repository=git@github.com:crunchloop/rails-interview.git)

This is a simple Todo List API built in Ruby on Rails 7. This project is currently being used for Ruby full-stack candidates.

## Build

To build the application:

`bin/setup`

## Run the API

To run the TodoApi in your local environment:

`bin/puma`

## Test

To run tests:

`bin/rspec`

## Contact

- Santiago Doldán (sdoldan@crunchloop.io)

## About Crunchloop

![crunchloop](https://crunchloop.io/logo-blue.png)

We strongly believe in giving back :rocket:. Let's work together [`Get in touch`](https://crunchloop.io/contact).

--

# How to test the API

Show todolists and individual todolist:

- GET `/api/todolists`
- GET `/api/todolists/:id`

Create todolist with the todolistsitems:

- POST `/api/todolists`

Example body in postman:

```json
{
  "name": "my todo list",
  "todo_lists_item": {
    "descriptions": ["todo 1", "todo 2"]
  }
}
```

Update todo list name:

- PUT `/api/todolists/:id`

Example:

```json
{
  "name": "new todo list name"
}
```

Destroy todo list:

- DELETE `/api/todolists/:id`

Update todolistsitems completed to true:

- PUT `/api/todolistsitems/:id`

Example:

```json
{
  "completed": true
}
```

## TODO

- [ ] Error handling.
- [ ] More and better test.
