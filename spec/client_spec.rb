require_relative '../lib/nist_randomness_beacon.rb'
require 'spec_helper'

describe NISTRandomnessBeacon::Client do
  before do
    Timecop.freeze(Time.utc(2014))
  end

  after do
    Timecop.return
  end

  describe 'current' do
    context 'successful response' do
      subject {
        VCR.use_cassette('current') do
          NISTRandomnessBeacon::Client.new.current
        end
      }

      it 'returns a record object' do
        expect(subject).to be_an_instance_of(NISTRandomnessBeacon::Record)
      end
    end

    context 'problematic response' do
      subject {
        NISTRandomnessBeacon::Client.new.current
      }

      it 'raises service error' do
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500)
        expect{subject}.to raise_error
      end
    end
  end

  describe 'previous' do
    context 'successful response' do
      subject {
        VCR.use_cassette('previous') do
          NISTRandomnessBeacon::Client.new.previous
        end
      }

      it 'returns a record object' do
        expect(subject).to be_an_instance_of(NISTRandomnessBeacon::Record)
      end
    end

    context 'problematic response' do
      subject {
        NISTRandomnessBeacon::Client.new.previous
      }

      it 'raises service error' do
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500)
        expect{subject}.to raise_error
      end
    end
  end

  describe 'next' do
    context 'successful response' do
      subject {
        VCR.use_cassette('next') do
          NISTRandomnessBeacon::Client.new.next
        end
      }

      it 'returns a record object' do
        expect(subject).to be_an_instance_of(NISTRandomnessBeacon::Record)
      end
    end

    context 'problematic response' do
      subject {
        NISTRandomnessBeacon::Client.new.next
      }

      it 'raises service error' do
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500)
        expect{subject}.to raise_error
      end
    end
  end

  describe 'last' do
    context 'successful response' do
      subject {
        VCR.use_cassette('last') do
          NISTRandomnessBeacon::Client.new.last
        end
      }

      it 'returns a record object' do
        expect(subject).to be_an_instance_of(NISTRandomnessBeacon::Record)
      end
    end

    context 'problematic response' do
      subject {
        NISTRandomnessBeacon::Client.new.current
      }

      it 'raises service error' do
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500)
        expect{subject}.to raise_error
      end
    end
  end

  describe 'start chain' do
    context 'successful response' do
      subject {
        VCR.use_cassette('start_chain') do
          NISTRandomnessBeacon::Client.new.start_chain
        end
      }

      it 'returns a record object' do
        expect(subject).to be_an_instance_of(NISTRandomnessBeacon::Record)
      end
    end

    context 'problematic response' do
      subject {
        NISTRandomnessBeacon::Client.new.start_chain
      }

      it 'raises service error' do
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500)
        expect{subject}.to raise_error
      end
    end
  end
end
