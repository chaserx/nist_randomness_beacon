require 'httparty'
require 'json'

module NISTRandomnessBeacon
  # Client to the Randomness Beacon API
  class Client
    DEFAULT_URI = 'https://beacon.nist.gov/rest/record'.freeze

    include HTTParty
    attr_reader :timestamp, :uri

    def initialize time=nil, uri=DEFAULT_URI
      @timestamp = (time || Time.now).to_i
      @uri = uri
    end

    # Returns the Current Record (or next closest)
    # https://beacon.nist.gov/rest/record/<timestamp>
    #
    def current
      response = self.class.get("#@uri/#@timestamp")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Previous Record
    # https://beacon.nist.gov/rest/record/previous/<timestamp>
    #
    def previous
      response = self.class.get("#@uri/previous/#@timestamp")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Next Record
    # https://beacon.nist.gov/rest/record/next/<timestamp>
    #
    def next
      response = self.class.get("#@uri/next/#@timestamp")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Last Record
    # https://beacon.nist.gov/rest/record/last
    #
    def last
      response = self.class.get("#@uri/last")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Start Chain Record
    # https://beacon.nist.gov/rest/record/start-chain/<timestamp>
    #
    def start_chain
      response = self.class.get("#@uri/start-chain/#@timestamp")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end
  end
end
