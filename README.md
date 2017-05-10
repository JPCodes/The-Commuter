# _The Commuter_

#### _Information-centered Rails Capstone Project. 06 March 2017_

#### By _**Jim Padilla**_

## Description

The Commuter is the app that I wish I had during my morning commute. It features news from the New York Times and the Guardian. There is also a section for viewing the latest major bills in Congress and their current status. If one wishes to discuss any of these things, there is also a discussion forum that is available to anyone that signs in using Google or Facebook. Lastly, there is a page that features a Yelp search and allows the user to see any search result through the Uber app.

## Heroku
[The Commuter](https://the-commuter.herokuapp.com/)

## Setup/Installation Requirements
Note to Cloud 9 users, in _config/database.yml_ you may need to specify the database template by uncommenting lines 9 and 14.

* _In the Terminal, run:_
```
git clone https://github.com/JPCodes/The-Commuter
cd The-Commuter
bundle install
rake db:create
rake db:migrate
rake db:seed
touch .env (API_VAR = "<your key>")
TO DO
rails server
```
* _Then, in any modern browser, navigate to:_
```
localhost:3000
```

* _Give a user admin powers:_
```
TO DO
```
## Support and contact details

* _Github: [JPCodes](https://github.com/JPCodes)_
* _LinkedIn: [Jim Padilla](https://www.linkedin.com/in/jpcodes)_

## Technologies Used

TO DO
* _Rails_
  * _Rspec_
  * _ActiveRecord_
  * _SimpleCov_
  * _FactoryGirl_
* _API_
  * _Github_
* _Ruby_
* _JavaScript_
* _Bootstrap_

### License

MIT

Copyright (c) 2017 **_Jim Padilla_**
