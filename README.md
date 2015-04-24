# Realeyes

Unofficial Realeyes Data Api Client for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'realeyes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install realeyes

## Usage

Initialization

    conn = Realeyes::Connection.new(access_key: 'access', secret_key: 'secret')

    # or set custom base url, by default it's 'http://reportingapi.realeyesit.com/api/v1/'
    conn = Realeyes::Connection.new(access_key: 'access', secret_key: 'secret', base_url: 'http://...')

Get methods

    conn.get('GetStudies')       # => Net::HTTPOK Object
    conn.get('GetStudies').code  # => 200
    conn.get('GetStudies').body  # => '[{"Id": 1,"Name":"My Study"}, ...]'

    # add params hash as second parameter
    conn.get('GetMediaByYouTubeHash', {YouTubeUrlHash: 'nXRJqNSoL9'})

Post methods

    # post(method, body, params)
    conn.post('UpdateCollection', {Name: 'New Name'}, {UrlHash: 'nXRJqNSoL9'})

## Todo

1. Add services and response objects ( Media.find_by_hash('nXRJqNSoL9').update(name: 'New Name') )

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruby-realeyes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
