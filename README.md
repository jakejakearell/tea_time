# Tea Time

## About

*An API for a tea subscription service.

## Local Setup
**Version Requirements**
* ruby 2.5.3
* rails 5.2

1. `git clone git@github.com:jakejakearell/tea_time.git`
2. `cd tea_time`
3. `bundle install`
4. `rails db:{create,migrate}`
5. run `rails s` and explore the endpoints below!
6. run the test suite: `bundle exec rspec`

## Endpoints

### Subscribe: subscribes a customer to a tea subscription 
Returns customer info and subscription information.

Request: `POST localhost:3000/api/v1/subscribe`  

#### Example:
Request: `POST localhost:3000/api/v1/subscribe`  
Request body:
```
{
    "user_id":6,
    "subcription_service": 1
}
```
Response body:
```
{
    "data": {
        "id": null,
        "type": "user_subscription",
        "attributes": {
            "user": {
                "id": 1
                }
            }
            "subscription": {
                "subscription_plan_id": 1,
                "active": true,
                "created_at": "2021-06-01T01:49:46.000Z",
                "updated_at": "2021-06-01T01:49:46.000Z"
            }
          }  
        }
    }
}
```

### Unsubscribe: retrieves background image for a city's forecast show page
Returns location parameter, image url, and image credit info.

Request: `PATCH localhost:3000/api/v1/unsubscribe`  
Returns customer info and subscription information.


#### Example:
Request: `PATCH localhost:3000/api/v1/unsubscribe`  
Request body:
```
{
    "user_id":6,
    "subcription_service": 1
}
```
Response body:
```
{
    "data": {
        "id": null,
        "type": "user_subscription",
        "attributes": {
            "user": {
                "id": 1
                }
            }
            "subscription": {
                "subscription_plan_id": 1,
                "active": true,
                "created_at": "2021-06-01T01:49:46.000Z",
                "updated_at": "2021-06-01T01:49:46.000Z"
            }
          }  
        }
    }
}
```


### User Teas
Returns new user's id, email, and api key.

Request: `GET localhost:3000/api/v1/users/:id/teas` 


#### Example:
Request: `GET localhost:3000/api/v1/users/1/teas` 

Response body:
```
{
  "data": [
    {
      "id": "1",
        "type": "tea",
        "attributes": {
          "type": "Monthly",
          "price": 10.99,
          "active" true
        }
    },
    {
      "id": "2",
      "type": "tea",
      "attributes": {
        "type": "Weekly",
        "price": 190.99,
        "active" true
      }
    },
    {
      "id": "3",
      "type": "tea",
      "attributes"tea: {
        "type": "Annual",
        "price": 100.99,
        "active" false
      }
    }
  ]
}
```
## Tools
Tea Time is written in Ruby with Ruby on Rails and uses a postgresql database.

**Language and Framework Versions**
* ruby 2.5.3
* rails 5.2

**Gems**
* Faraday
* Figaro
* BCrypt
* FastJSON

**Testing**
* SimpleCov 
* RSpec
* WebMock
* VCR
* ShouldaMatchers
* FactoryBot

**Third Party APIs
* Tea API
   * [Teas API - GET route](https://tea-api-vic-lo.herokuapp.com/)
