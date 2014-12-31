require 'httparty'
require 'json'

module NISTRandomnessBeacon
  # Client to the Randomness Beacon API
  class Client
    include HTTParty

    attr_accessor :timestamp

    URI = 'https://beacon.nist.gov/rest/record'.freeze

    def initialize timestamp=Time.now.to_i
      @timestamp = timestamp
    end

    # Returns the Current Record (or next closest)
    # https://beacon.nist.gov/rest/record/<timestamp>
    #
    def current
      response = self.class.get("#{URI}/#{@timestamp}")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Previous Record
    # https://beacon.nist.gov/rest/record/previous/<timestamp>
    #
    def previous
      response = self.class.get("#{URI}/previous/#{@timestamp}")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Next Record
    # https://beacon.nist.gov/rest/record/next/<timestamp>
    #
    def next
      response = self.class.get("#{URI}/next/#{@timestamp}")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Last Record
    # https://beacon.nist.gov/rest/record/last
    #
    def last
      response = self.class.get("#{URI}/last")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end

    # Returns the Start Chain Record
    # https://beacon.nist.gov/rest/record/start-chain/<timestamp>
    #
    def start_chain
      response = self.class.get("#{URI}/start-chain/#{@timestamp}")
      raise ServiceError, response.body unless response.code.eql? 200
      NISTRandomnessBeacon::Record.new(response.parsed_response['record'])
    end
  end
end
