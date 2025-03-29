# README for StringCalculators

This RoR App. calculates the sum of integers in a string while handling:

Custom delimiters of any length.

Multiple custom delimiters.

Newline (\n) as a valid delimiter.

Ignoring numbers greater than 1000.

Throwing an exception for negative numbers.
Technologies
Ruby version: 3.0.7
Rails Version: 6.1.7.10

Setup
$ https://github.com/definers/TDD_KATA_CALC.git

$ cd TDD_KATA_CALC

Chckout to Feature Branch from remote

$ git checkout feature/kata_calc_feat

Install Ruby using RVM

$ curl -sSL https://get.rvm.io | bash -s stable --ruby

$ source /home/username/.rvm/scripts/rvm

$ bundle install

Start the Rails Server:

$ rails s

Hit localhost:3000 in your web browser.

Tada! Your App is up and Running!


To Run Test Cases

$ rails generate rspec:install
$ rspec spec/controller/string_calculators_spec


* Database creation : N/A

* Database initialization: N/A

* How to run the test suite:  $ bundle exec rspec

To Calculate Sum of numbers from the input via API here is curl

$ curl -X POST "http://localhost:3000/calculate/sum" -d "numbers=//[***]\n1***2***3"


You Can Get the String integer sum via API as well as with the
DelimiterParser

To Run Specs of the DelimiterParser

$ rspec bundle exec rspec spec/services/delimiter_parser_spec.rb
