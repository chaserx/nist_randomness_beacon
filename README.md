# NIST Randomness Beacon

[![Build Status](https://travis-ci.org/chaserx/nist_randomness_beacon.svg)](https://travis-ci.org/chaserx/nist_randomness_beacon)

A wrapper for the NIST Randomness Beacon 'cause sometimes you need to get
a 512-bit full-entropy bit-string programmatically. You never know.

Inspiration: http://hackaday.com/2014/12/19/nist-randomness-beacon/

NIST project description: http://www.nist.gov/itl/csd/ct/nist_beacon.cfm

API Description: https://beacon.nist.gov/home

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nist_randomness_beacon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nist_randomness_beacon

## Usage

```ruby
require 'nist_randomness_beacon'
client = NISTRandomnessBeacon::Client.new
record = client.last
# => NISTRandomnessBeacon::Record
record.output_value
# => "4838827EDEE67CD5F58139933709764D1C51B4FC362DCAAB06B1572AC533F15F648F5EA98C5276187EBB87148852AEE291DB735F821CDC04E53DD7331AB1D3B6"

# Pass an optional time to initialize:
three_days = 3 * 24 * 60 * 60
client = NISTRandomnessBeacon::Client.new(Time.now - three_days)
record = client.current
record.output_value
# => "1B080E1C3B8A8A0FFA51831B1F830D23CE66C2FF47BF35361CF05D8095CA0AFC69A78D6711774C2653108CA355C3EA4A63926655452048A4B211BC871FC812F8"
```

WARNING: DO NOT USE BEACON-GENERATED VALUES AS SECRET CRYPTOGRAPHIC KEYS. See
[this StackExchange thread](http://crypto.stackexchange.com/questions/15225/how-useful-is-nists-randomness-beacon-for-cryptographic-use).

## Contributing

Pull requests welcome! Please see the [contribution guide](CONTRIBUTING.md).
