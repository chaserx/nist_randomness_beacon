# NIST Randomness Beacon

A wrapper for the NIST Randomness Beacon 'cause sometimes you need to get
a 512-bit full-entropy bit-string programmaticlly. You never know.

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
record = NISTRandomnessBeacon::Client.new.last
# => NISTRandomnessBeacon::Record
record.output_value
# => "4838827EDEE67CD5F58139933709764D1C51B4FC362DCAAB06B1572AC533F15F648F5EA98C5276187EBB87148852AEE291DB735F821CDC04E53DD7331AB1D3B6"
```

WARNING: DO NOT USE BEACON GENERATED VALUES AS SECRET CRYPTOGRAPHIC KEYS.

## Contributing

Pull requests welcome! Please see the [contribution guide](CONTRIBUTING.md).
