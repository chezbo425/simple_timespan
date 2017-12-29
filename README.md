# SimpleTimespan

A support class to simplify calculating interesting properties of timespans (such as seconds, hours, minutes, days, and years)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_timespan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_timespan

## Usage

```ruby
now = Time.new(2017, 12, 29, 13, 24, 22)
new_years = Time.new(2018, 1, 1, 0, 0, 0)
ts = SimpleTimespan.new(new_years - now)
ts.to_s # 2 days 10 hours 35 minutes 38 seconds
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chezbo425/simple_timespan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleTimespan project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/simple_timespan/blob/master/CODE_OF_CONDUCT.md).
