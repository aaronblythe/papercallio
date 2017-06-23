# Papercallio

A clean Git-like command line interface ruby gem wrapper around the papercall.io API to create a csv

NOTE: This is currently only available for Pro Accounts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'papercallio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install papercallio

## Papercall API access required

papercallio requires API access to download data. API access is a paid feature, papercallio will not work with the free papercall plan.

To obtain your API token, go to the papercall website, click the events tab, choose your event, then choose the Organisers link on the right hand side. On the list of organisers for your event your API token will be listed under your name.

Once you have your API key export it in your shell

```
export PAPERCALL_API_TOKEN=abcdefghijklmnopqrstuvwxyz1234567890
```

## Usage

```
papercallio help
papercallio help submissions
papercallio submissions
```

Add flags to the command as defined in the help file.

### Development

```
bundle install
bundle exec bin/papercallio submissions
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/papercallio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

