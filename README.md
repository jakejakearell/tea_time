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

## Database Schema

![alt_text](https://user-images.githubusercontent.com/58375638/120696536-ebb43c80-c469-11eb-9fe4-59a6ede9725d.png)

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
        "id": "2",
        "type": "user_subscription",
        "attributes": {
            "user_id": 1,
            "subscription_id": 2,
            "active": true
        }
    }
}
```

### Unsubscribe: retrieves background image for a city's forecast show page
Returns location parameter, image url, and image credit info.

Request: `PUT localhost:3000/api/v1/subscribe`  
Returns customer info and subscription information.


#### Example:
Request: `PUT localhost:3000/api/v1/subscribe`  
Request body:
```
{
    "user_id":6,
    "subcription_service": 1, 
    "active": false
}
```
Response body:
```
{
    "data": {
        "id": "2",
        "type": "user_subscription",
        "attributes": {
            "user_id": 1,
            "subscription_id": 2,
            "active": false
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
            "type": "subscriptions",
            "attributes": {
                "title": "good tea",
                "price": 213.12,
                "frequency": "daily"
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
