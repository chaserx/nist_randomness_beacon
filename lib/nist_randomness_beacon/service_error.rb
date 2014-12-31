module NISTRandomnessBeacon
  # For exceptions encountered with the service
  class ServiceError < StandardError
    attr_reader :body

    def initialize body
      @body = body
    end
  end
end
