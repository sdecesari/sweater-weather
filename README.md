<h1 align="center">Sweater Weather</h1>

<!-- TABLE OF CONTENTS -->
  <details>
  <summary>Table of Contents</summary>
  <ol>
    </li>
    <li><a href="#project-overview">Project Overview</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#api-endpoints">API Endpoints</a></li>
  </ol>
</details>

<!-- PROJECT OVERVIEW -->
## Project Overview
Ever taken a road trip and wondered what kind of clothes to pack? Look no further, Sweater Weather will solve that issue. This API will let you know the weather for your destination when you reach your destination.

<!-- Built With -->
## Built With
[<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>](https://www.ruby-lang.org/en/) **Version 2.7.4**<br>
[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/) **Version 5.2.8**<br>

<!-- Setup -->
## Setup
To set up the project on your local machine, complete the following steps:
1. Ensure you have the correct versions of both Ruby(2.7.4 or later) and Rails(5.2.8 or later) by running `ruby -v` and `rails -v` from your command line.<br>
2. Register for free API key [here](https://developer.mapquest.com/documentation/geocoding-api/) and [here](https://openweathermap.org/api/one-call-api).
3. Clone the repo:
```git clone ``` &mdash; for SSH
4. Install gems using `bundle install`:
```ruby
#global
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'faraday'

#section
group :development, :test
  gem 'rspec-rails'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'simplecov'

#section
group :test
  gem 'webmock'
  gem 'vcr'
```
5. Configure API key by first running `bundle exec figaro install` in your command line and then configuring your API key in your `application.yml` file:
```ruby
mapquest_api_key: your_key_here
openweather_api_key: your_key_here
```

<!-- API Endpoints -->
## API Endpoints
GET /api/v1/forecast?location={insert location here i.e Denver,CO}
This endpoint returns the current weather, hourly weather (for the next 8 hours), and daily weather (for the next 5 days)

*for these next endpoints, it is recommended to use Postman [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://www.postman.com/product/what-is-postman/)<br>

To call these endpoints, in Postman, under the address bar, click on “Body”, select “raw”, which will show a dropdown that says “Text” in it, choose “JSON” from the list and enter the parameters as shown:

<p> POST /api/v1/users </p>
<img width="844" alt="Screen Shot 2022-08-10 at 2 03 11 AM" src="https://user-images.githubusercontent.com/95315216/183861380-48430f6f-e268-4db0-b3bc-959b19fd39db.png">

<p> POST /api/v1/sessions </p>
<img width="847" alt="Screen Shot 2022-08-10 at 2 05 27 AM" src="https://user-images.githubusercontent.com/95315216/183861862-e7cf2608-a62b-4b39-bbd6-3a5c50e8f01e.png">

<p> POST /api/v1/roadtrip *in order to use this endpoint, a POST request must be sent to users in order to obtain an api_key first </p>
<img width="847" alt="Screen Shot 2022-08-10 at 2 06 32 AM" src="https://user-images.githubusercontent.com/95315216/183862036-a4bd381c-8a05-4909-8e4a-c19acfdf6b1c.png">
