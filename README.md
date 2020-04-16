# README

### Project's setup

Before anything, make sure you have `rails 6`, `ruby 2.6.2` and sqlite3 installed.

To setup just run the following in the terminal:

```
bundle install
```

This will install all the dependencies. Then we need to setup the development DB, run this in the terminal:

```
rails db:setup
```

We're using `rspec` to test this application, to run the tests use:

```
rspec
```

On the first run, it will create your test DB.


### DB structure

This project's db has one table only called `vulnerable_zones`. This table is where we store data related to vulnerable zones (floods and other natural disasters).

The idea here is that we only store information about the vulnerable places in a way that we can retrieve it with ease. This is our schema

![Alt text](/docs/images/db-schema.png?raw=true "Title")
