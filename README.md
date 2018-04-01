# Chef's Haven

Chef's Haven is an application that allows users to search for recipes based on what they are hungry for, whether it be a single ingredient or a type of meal. In addition, users can view past searches made by all users to get some ideas and sort these past searches by name, count, or most recent date searched.

Chef's Haven uses the [Edamam Recipe Search API](https://www.edamam.com/) to discover recipes.

[Try it out on Heroku](https://chefshaven.herokuapp.com/)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](#)

## Setup & Installation

Clone the Chef's Haven Github repository into a directory of your choosing.

```
git clone https://github.com/tylermarshal/chefs_haven.git
```

Move into the Chef's Haven directory & install the required gems.

```
cd chefshaven
```
```
bundle install
```

From here you will need to create the PostgreSQL database and tables:

```
rails db:create db:migrate
```

To run the application locally, you will need to sign up for Edamam as a developer and get an application ID and key. To do so, go to the [Edamam Recipe Search API](https://www.edamam.com/) page.

Once you have your ID & Key, you will need to setup Figaro:

```
bundle exec figaro install
```

This will create an application.yml file in your config folder. In the application.yml file, add the following:

```
EDAMAM_APP_ID: <Your Edamam Application ID here>
EDAMAM_APP_KEY: <Your Edamam Application Key here>
```

Start a rails server and visit http://localhost:3000/:

```
rails s
```

After that you are all set to search for your next meal!


## Testing

To run the test suite, you can execute the following in your terminal:

```
bundle exec rspec
```

## Creator
[Tyler Madsen](https://github.com/tylermarshal)

