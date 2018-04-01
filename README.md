# Chef's Haven

Chef's Haven is an application that allows users to search for recipes based on what they are hungry for, whether it be a single ingredient or a type of meal. In addition, users can view past searches made by all users to get some ideas, while sorting these past searches by name, count, or most recent date searched.

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

To run the application locally, start a rails server:

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

