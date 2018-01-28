require_relative '../lib/nist_randomness_beacon/record.rb'
require 'spec_helper'

describe NISTRandomnessBeacon::Record do
  describe 'a new record object' do
    context 'initialized with camelCase args' do
      it 'respond_to with an underscored instance method' do
        record = NISTRandomnessBeacon::Record.new(statusCode: 'foo')
        expect(record).to respond_to(:status_code)
      end
    end
  end

  describe 'humanized_status_code' do
    context 'status code 0' do
      record = NISTRandomnessBeacon::Record.new(statusCode: 0)
      it 'returns all good' do
        expect(record.humanized_status_code).to eq('Chain intact, values all good')
      end
    end

    context 'status code 1' do
      record = NISTRandomnessBeacon::Record.new(statusCode: 1)
      it 'start of new chain' do
        expect(record.humanized_status_code).to eq('Start of a new chain of values, previous hash value will be all zeroes')
      end
    end

    context 'status code 2' do
      record = NISTRandomnessBeacon::Record.new(statusCode: 2)
      it 'time between greater than frequency with intact chain' do
        expect(record.humanized_status_code).to eq('Time between values is greater than the frequency, but the chain is still intact')
      end
    end

    context 'status code 3' do
      record = NISTRandomnessBeacon::Record.new(statusCode: 3)
      it 'time between greater than frequency with intact chain but precommitmentValue was lost' do
        expect(record.humanized_status_code).to eq('Time between values is greater than the frequency, the chain is intact, but the input of the prior precommitmentValue was lost')
      end
    end
  end
end
