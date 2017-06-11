# Appoint A Doc


This app is an MVP for the needs of an office with several doctors scheduling appointments for patients.


## Setup instructions:

* [Download Postgresql](https://www.postgresql.org/download/)
* [Download the Bundler Gem](https://rubygems.org/gems/bundler/versions/1.11.2) `gem install bundler`
* Clone this repo and `cd` into it
* `bundle install` to download all the gems
* Set up the database
	* `be rake db:create`
	* `be rake db:migrate`
	* `be rake db:seed`
* Run the server, (`rails s`)
* Navigate to localhost:3000


