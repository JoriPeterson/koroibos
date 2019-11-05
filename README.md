# README

### Description

This is a 48 hour code challenge to build an Olympics Analytics tracker. It includes historical data from the 2016 Summer Games. Currently, five main endpoints are built out for all olympians, youngest_olympian, oldest_olympians, olympian_stats and all events. Additionally, find and find_all endpoints have been added to find Olympians by their attributes.

This application is built in Ruby on Rails and deployed to Heroku [here](https://intense-lake-33626.herokuapp.com/api/v1/olympians)

### Setup
To setup locally, run the following commands:
 - `git clone git@github.com:JoriPeterson/koroibos.git`
 - `cd koroibos`
 - `bundle install`
 - `rails db:{create,migrate}`
 - `bundle exec rake import`

 ### User Requests

**All Olympians**

Request URI:
`GET '/api/v1/olympians'`

Example Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "athlete",
      "attributes": {
        "name": "Andreea Aanei",
        "team": "Romania",
        "age": 22,
        "sport": "Weightlifting",
        "total_medals_won": 0
      }
    },
    {
      "id": "2",
      "type": "athlete",
      "attributes": {
        "name": "Nstor Abad Sanjun",
        "team": "Spain",
        "age": 23,
        "sport": "Gymnastics",
        "total_medals_won": 0
      }
    },
  {...}
  ]
}
```

**Youngest Olympian**

Request URI:
`GET '/api/v1/olympians?age=youngest'`

Example Response:
```
{
  "data": {
    "id": "2190",
    "type": "athlete",
    "attributes": {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming",
      "total_medals_won": 0
    }
  }
}
```
**Oldest Olympian**

Request URI:
`GET '/api/v1/olympians?age=oldest'`

Example Response:
```
{
  "data": {
    "id": "1321",
    "type": "athlete",
    "attributes": {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism",
      "total_medals_won": 0
    }
  }
}
```

**Olympian Stats**
Request URI:
`GET '/api/v1/olympian_stats'`

Example Response:
```
{
  "data": {
    "attributes": {
      "olympian_stats": {
        "total_competing_olympians": 2850,
        "average_weight:": {
            "unit": "kg",
            "male_olympians": 77.9,
            "female_olympians": 61.4
        },
        "average_age:": 26.4
      }
    }
  }
}
```

**All Events by Sport**

Request URI:
`GET '/api/v1/events'`

Example Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "event",
      "attributes": {
        "sport": "Weightlifting",
        "events": [
          "Weightlifting Women's Super-Heavyweight",
          "Weightlifting Men's Heavyweight",
          "Weightlifting Men's Middleweight",
          "Weightlifting Men's Middle-Heavyweight",
          "Weightlifting Men's Featherweight",
          "Weightlifting Women's Flyweight",
          "Weightlifting Women's Middleweight",
          "Weightlifting Women's Lightweight",
          "Weightlifting Men's Lightweight",
          "Weightlifting Men's Super-Heavyweight",
          "Weightlifting Men's Light-Heavyweight",
          "Weightlifting Women's Heavyweight",
          "Weightlifting Women's Light-Heavyweight",
          "Weightlifting Men's Bantamweight",
          "Weightlifting Women's Featherweight"
      ]
  }
},
{
  "id": "2",
  "type": "event",
  "attributes": {
      "sport": "Gymnastics",
      "events": [
          "Gymnastics Men's Individual All-Around",
          "Gymnastics Men's Floor Exercise",
          "Gymnastics Men's Parallel Bars",
          "Gymnastics Men's Horizontal Bar",
          "Gymnastics Men's Rings",
          "Gymnastics Men's Pommelled Horse",
          "Gymnastics Men's Team All-Around",
          "Gymnastics Men's Horse Vault",
          "Gymnastics Women's Team All-Around",
          "Gymnastics Women's Uneven Bars",
          "Gymnastics Women's Balance Beam",
          "Gymnastics Women's Individual All-Around",
          "Gymnastics Women's Floor Exercise",
          "Gymnastics Women's Horse Vault"
        ]
      }
    },
    {...}
  ]
}
```

### Additional Requests

**Find Olympian by Attribute**

Example Request:
`GET '/api/v1/olympians/find=?name=Andreea Aanei'`

Example Response:
```
{
  "data": {
    "id": "1",
    "type": "find",
    "attributes": {
      "name": "Andreea Aanei",
      "team": "Romania",
      "age": 22,
      "sport": "Weightlifting",
      "total_medals_won": 0,
      "weight": 125,
      "sex": "F",
      "medal": "NA"
    }
  }
}
```


**Find All Olympians by Attributes**

Example Request:
`GET '/api/v1/olympians/find_all?team=United States'`

Example Response:
```
{
  "data": [
    {
      "id": "12",
      "type": "find",
      "attributes": {
        "name": "Mara Katherine Abbott",
        "team": "United States",
        "age": 30,
        "sport": "Cycling",
        "total_medals_won": 0,
        "weight": 52,
        "sex": "F",
        "medal": "NA"
    }
},
{
    "id": "92",
    "type": "find",
    "attributes": {
        "name": "Natalie Cammile Adams (-Brannan)",
        "team": "United States",
        "age": 24,
        "sport": "Swimming",
        "total_medals_won": 0,
        "weight": 65,
        "sex": "F",
        "medal": "NA"
        }
      },
      {...}
    ]
  }

```

### Next Challenge:

Request URI:
`GET '/api/v1/events/:id/medalists'`

Example Response:
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```

### Schema Diagram

![Koroibos Schema](/schema_diagram.png?raw=true "Koroibos Schema")

### Testing

Testing for this application was done in RSpec.
Simply run `rspec` in the terminal to run the test suite.


### Tech Stack

* Rails 5.2.3
* Ruby 2.4.9
* FastJSON
* PostgreSQL database
* RSpec

### Project Board

[Click here to see the Koroibos Project Board](https://github.com/JoriPeterson/koroibos/projects/1)
