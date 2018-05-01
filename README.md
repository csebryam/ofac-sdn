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

## Sample Conversion
### Input: sdn.xml

```
<sdnList xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://tempuri.org/sdnList.xsd">
  <publshInformation>
    <Publish_Date>04/30/2018</Publish_Date>
    <Record_Count>6305</Record_Count>
  </publshInformation>
  <sdnEntry>
    <uid>36</uid>
    <lastName>AEROCARIBBEAN AIRLINES</lastName>
    <sdnType>Entity</sdnType>
    <programList>
      <program>CUBA</program>
    </programList>
    <akaList>
      <aka>
        <uid>12</uid>
        <type>a.k.a.</type>
        <category>strong</category>
        <lastName>AERO-CARIBBEAN</lastName>
      </aka>
    </akaList>
    <addressList>
      <address>
        <uid>25</uid>
        <city>Havana</city>
        <country>Cuba</country>
      </address>
    </addressList>
  </sdnEntry>
</sdnList>
```

### Output: sdn_hash

<pre>
{
  sdnEntry: [
    {<b>id: 36</b>, lastName: "AEROCARIBBEAN AIRLINES", sdnType: "Entity"}
  ],
  programList: [
    {program: "CUBA", <b>sdn_id: 36</b>}
  ],
  akaList: [
    {id: 12, <b>sdn_id: 36</b>, type: "a.k.a.", category: "strong", lastName: "AERO-CARIBBEAN"}
  ],
  addressList: [
    {id: 25, <b>sdn_id: 36</b>, city: "Havana", country: "Cuba"}
  ]
}
</pre>

*Note: Associations for the `sdn_entry` are done for you. `id: 36` shows up as `sdn_id: 36` on all related lists.*

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/csebryam/ofac_sdn.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
