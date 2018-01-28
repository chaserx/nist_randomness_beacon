module NISTRandomnessBeacon
  class Record
    require_relative '../core_extensions/string/underscore'
    using Underscore
    attr_reader :version, :frequency, :time_stamp, :seed_value,
                :signature_value, :output_value, :status_code, :certificate_id,
                :list_values, :local_random_value, :external,
                :precommitment_value, :signature_value, :humanized_status_code

    def initialize(args={})
      args.each do |k, v|
        instance_variable_set("@#{k}".underscore, v) unless v.nil?
      end
    end

    def humanized_status_code
      return unless status_code
      codes = {
        0 => 'Chain intact, values all good',
        1 => 'Start of a new chain of values, previous hash value will be all zeroes',
        2 => 'Time between values is greater than the frequency, but the chain is still intact',
        3 => 'Time between values is greater than the frequency, the chain is intact, but the input of the prior precommitmentValue was lost'
      }
      codes[status_code]
    end
  end
end
