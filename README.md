# ARENA API

## About

The Arena API allows you to provision a new contest with two pets from the battle-pets-api. Technically you could create a brawl with more than two pets. The end point for the arena api are as follows.

Create a new contest:
`POST /api/v1/contests`

Get a contest:
`GET /api/v1/contests/[:id]`

Get all contest:
`GET /api/v1/contests`

Get all loaded contest types:
`GET /api/v1/contest_types`

The API is a Rails application that loads two local gems, `arena` and `battle_pets`. The `arena` gem is responsible for loading the contest types and determining a winner based on the strategy defined in the contest type and the pets attributes. The `battle_pets` gem is a simple API wrapper for the `battle-pets-api`. The `battle_pets` gem makes it easy to create new pets and load pets into the `arena`. The `arena` comes with two contest types to get you started. `speed_eating` and `napping`. These contest types are configured in a Rails initializer found here `app/config/initializers/arena.rb`. The `battle_pets` gem requires two env variables to be set. `BATTLE_PETS_API_KEY` and `BATTLE_PETS_API_URL`. These are loaded from your `.env` file by an initializer located in `app/config/initializers/battle_pets.rb`. See more about setting up your `.env` file below in the Getting started section.

## Getting started

`bundle`

`rake db:migrate`

`cp sample.env .env`

Enter the Battle Pets Mgmt API key and URL in your `.env` file.

`source ./.env`

Typically sourcing your `.env` like this will work. If not just relaunch your terminal and change into the rails root directory and things should export properly.

Start the Arena API

`rails s`

Launch the Battle CLI script

`chmod 700 lib/battle`

`bundle exec ./lib/battle start`


The `battle` script will walk you through getting those pets to battle!


## Running the Tests

`bundle exec rspec`

You might want to also run the specs for the `arena` gem.

`cd gems/arena && bundle && ../../`

`cd gems/arena && bundle exec rspec && ../../`

You probably should run the specs for the `battle_pets` gem as well.

`cd gems/battle_pets && bundle && ../../`

`cd gems/battle_pets && bundle exec rspec && ../../`

Or you can...

`chmod 700 all_tests`

`./all_tests`

:tada:
