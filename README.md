# Eleyo Gem

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eleyo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eleyo

## Usage

Here is an example of how to get bank information for ACH purposes:
```ruby
bi = Eleyo::API::BankInfo.new
bi.get("091000019")
=> {"city"=>"MINNEAPOLIS", "addr1"=>"255 2ND AVE SOUTH", "name"=>"WELLS FARGO BANK NA  (MINNESOTA)", "zip"=>"55479", "routing_number"=>"091000019", "id"=>"1cb7cd2e-c1c6-11e2-8fb0-12313d062143", "zip_ext"=>"0000", "office_type"=>"Main", "last_updated"=>"2004-02-20T00:00:00+00:00", "phone"=>"(800) 745-2426", "state"=>"MN"}
```

Here is an example of setting up an oauth2 flow:
```ruby
class LoginController < ActionController::Base
  API_CONFIG = {client_id: "EXAMPLE-CLIENT-ID", client_secret: "EXAMPLE-CLIENT-SECRET", district_subdomain: "test", redirect_uri: "https://example.org/login"}

  def login
    code = params[:code]
  
    if code.blank?
      redirect_to Eleyo::API::Auth.new(API_CONFIG).authorization_url and return
    else
      auth = Eleyo::API::Auth.new(API_CONFIG)
      access_token = auth.access_token(code)

      user_data = access_token.user_data
      # log the user in based on the user_data json
    end
  end
end
```