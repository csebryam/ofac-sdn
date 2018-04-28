# OfacSdn
This gem provides the OFAC `sdn.xml` as an easy to use Ruby hash. This allows you to conduct your own search criteria on your own system.

You can find the OFAC downloads here: 
[OFAC Downloads](https://www.treasury.gov/ofac/downloads)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ofac_sdn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ofac_sdn

## Usage
You should run this in a worker since parsing an XML and converting it to a pretty Hash does take relatively long.

```
require 'ofac_sdn'

sdn_hash = OfacSdn::Read.call
```

Check to see if there are any new updates in the date or record count from your last database insertion to avoid pulling the data again:

```
date  = OfacSdn::Read.publish_date 
count = OfacSdn::Read.record_count
```

* How often is the Specially Designated Nationals (SDN) List updated? [OFAC FAQ](https://www.treasury.gov/resource-center/faqs/Sanctions/Pages/faq_lists.aspx)

	* The SDN list is frequently updated. There is no predetermined timetable, but rather names are added or removed as necessary and appropriate.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/csebryam/ofac_sdn.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
