require 'httparty'
require 'json'

module NISTRandomnessBeacon
  # Client to the NIST Randomness Beacon API
  # Certificate
  #   https://beacon.nist.gov/beacon/2.0/certificate/<certificateIdentifier>
  #
  class Client
    DEFAULT_URI = 'https://beacon.nist.gov/beacon/2.0'.freeze

    include HTTParty
    attr_reader :timestamp, :uri

    def initialize(time=nil, uri=DEFAULT_URI)
      @timestamp = (time || Time.now).to_i
      @uri = uri
    end

    # Returns the Current Record (or next closest AFTER the timestamp)
    # https://<default uri>/pulse/time/<timestamp>
    #
    def current
      response = self.class.get("#@uri/pulse/time/#@timestamp")
      create_new_record(response)
    end

    # Returns the Previous Record
    # https://<default uri>/pulse/time/previous/<timestamp>
    #
    def previous
      response = self.class.get("#@uri/pulse/time/previous/#@timestamp")
      create_new_record(response)
    end

    # Returns the Next Record
    #  https://<default uri>/pulse/time/next/<timestamp>
    #
    def next
      response = self.class.get("#@uri/pulse/time/next/#@timestamp")
      create_new_record(response)
    end

    # Returns the Last Record
    # https://<default uri>/pulse/last
    # https://<default uri>/beacon/2.0/chain/last/pulse/last
    #
    def last
      response = self.class.get("#@uri/pulse/last")
      create_new_record(response)
    end

    # Returns the Start Chain Record
    # https://beacon.nist.gov/beacon/2.0/chain/1/pulse/1
    #
    def start_chain()
      response = self.class.get("#@uri/chain/1/pulse/1")
      create_new_record(response)
    end

    # Returns a Specific Pulse in a Specific Chain
    # required arguments: a chain_index and a pulse_index both integers
    #
    def pulse_in_chain(chain_index:1, pulse_index:1)
      response = self.class.get("#@uri/chain/#{chain_index}/pulse/#{pulse_index}")
      create_new_record(response)
    end

    private

    def create_new_record(response, response_code=200)
      raise ServiceError, response.body unless response.code.eql? response_code
      NISTRandomnessBeacon::Record.new(response.parsed_response['pulse'])
    end
  end
end
