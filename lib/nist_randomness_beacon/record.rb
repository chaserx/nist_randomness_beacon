module NISTRandomnessBeacon
  class Record
    attr_reader :version, :frequency, :time_stamp, :seed_value,
                :previous_output_value, :signature_value, :output_value,
                :status_code

    def initialize args={}
      args.each do |k, v|
        instance_variable_set("@#{k}".underscore, v) unless v.nil?
      end
    end
  end
end
