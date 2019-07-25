# pocket_ramiro_rails

## Description
Pocket Ramiro Rails is a backend service built in Rails that collaborates with two other services, Pocket Ramiro React[https://github.com/pocketramiro/pocket_ramiro_react] and Pocket Ramiro Documentation[https://master.d3bx8qvhmbmxu.amplifyapp.com/]. Together, these three micro-services collaborate in order to provide facilities management for various small to medium sized businesses.

We modeled our apps with the help of Great Divide Brewery[https://greatdivide.com/]; after touring their facilities and discussing some of the dilemmas they face on a daily basis, we designed solutions to as many as possible.

Problem and Solution One -
Currently, Great Divide has an unused system and we sought to understand why and how we could design something that would be more likely to be utilized.

Our primary focus for this issue is to make our app mobile friendly since we learned that Great Divide is a place with more people on their feet than there are computer stations and they are very busy doing hands-on work all day long.

Problem and Solution Two -
There are a great many machines and resources at Great Divide that are either unique, extremely mature or both and they require a great deal of maintenance and working knowledge that can sometimes be lost when someone leaves or absent when someone is on vacation.

This problem has a two pronged solution. We created a ticketing system and a notes system both able to tie back to a specific resource or part or both. We have a ticket portal that will be able to display tickets in various ways.

Future functionality aims to predict when maintenance will be needed, ideally creating a ticket automatically

## Contibutors
[Carrie Walsh](https://github.com/carriewalsh)

[Jennica Stiehl](https://github.com/stiehlrod)

[Michael King-Stockton](https://github.com/KStockton)

[Ryan D Barnett](https://github.com/RyanDBarnett)

## Schema
![Pocket Ramiro Rails Schema](/pr_schema.png?raw=true "Pocket Ramiro Rails Schema")

## Configuration
```
bundle install
 ```
### If you need to change your versions

Open your Gemfile
```
Ruby '2.6.3'
rbenv versions '2.6.3'
```
Install versions
```
rbenv install 2.6.3
rebenv local 2.6.3
gem install bundler -v 1.17.3
bundle _1.17.3_ install
```

### Database initialization
```
rake db:{create,migrate,seed}
```
### Getting Started/Requirements/Prerequisites/Dependencies

Ruby version: ruby 2.6.3

## Locations/Where to Find the applications
### Pocket Ramiro Rails

development: localhost:3000/api/v1/resources

production:
  gcp: https://pocket-ramiro-247718.appspot.com/api/v1/resources

  aws: http://pocketramirorails2-env.ejk9ccddbs.us-west-1.elasticbeanstalk.com/api/v1/resources (now unused)

### Pocket Ramiro React

development: localhost:3000

production:
  aws amplify: https://master.d2ybnzra4ei56p.amplifyapp.com
  gcp: https://pocket-ramiro-react.appspot.com
  heroku: https://pocket-ramiro-react.herokuapp.com (now unused)

### Pocket Ramiro Documentation

development: localhost:3000

production: https://master.d3bx8qvhmbmxu.amplifyapp.com/

## Endpoint Versioning

v1  7/25/2019

## Testing
```
rails generate rspec:install
bundle exec rspec
```
## Tech Stack

- ActiveRecord  
- AWS: Elastic Beanstalk, RDS, Amplify
- GCP: App Engine, Cloud SQL
- CircleCI
- Javascript
- Jest
- Postgres
- React
- Redux
- Router
- RSpec
- Ruby on Rails


## Endpoints
[Endpoint Documentation:](https://master.d3bx8qvhmbmxu.amplifyapp.com/)
