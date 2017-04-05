## URLockBox - Kyle Heppenstall

### Description

[Production Site](https://guarded-beach-39889.herokuapp.com/)

[Github Repo](https://github.com/kheppenstall/final_assessment)

The URLockbox is a the final assessment for backend engineering module4 at TuringSchool of Software and Design.

Kyle's [Url Lockbox](https://gist.github.com/neight-allen/335dcfdc8fc258757357ce597eb9dbd1) assessment for Turing. The url lockbox provides a place for users to store links to review or visit them later. Users can create accounts, login, add links, and mark them as read or unread.

Tech stack: Ruby, Rails, PostgreSQL, RSpec, JQuery, Sass (scss), Heroku

### Dependencies 

This project uses Ruby version 2.3+ with a PostgreSQL database.

### Getting Started

Follow these steps in your terminal to clone the project on to your local machine and import the data.

  1. `cd` into the directory where you want the project in the terminal.
  1. Run `git clone https://github.com/kheppenstall/final_assessment.git`
  1. `cd temp_mid_mod` 
  1. `bundle` to install the gems you need
  1. `rake db:create` to create your PostgreSQL database

### Test suite

Follow these steps in your terminal to run our test suite and check out the coverage.

  1. `rspec` to run the test suite
  1. `open coverage/index.html` to view the test coverage in your browser

### Hosting the site locally

  1. From within the `temp_mid_mod` directory run `rails server` to start the server locally.
  1. In your browser visit `http://localhost:3000/`)
  1. Press `ctrl-c` to stop server.
