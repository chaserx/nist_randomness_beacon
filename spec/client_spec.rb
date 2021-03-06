require_relative '../lib/nist_randomness_beacon.rb'
require 'spec_helper'

describe NISTRandomnessBeacon::Client do
  before do
    Timecop.freeze(Time.utc(2018))
  end

  after do
    Timecop.return
  end

  describe 'current' do
    context 'successful response' do
      subject {
        VCR.use_cassette('current_v2') do
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
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500, body: 'stubbed response')
        expect{subject}.to raise_error(NISTRandomnessBeacon::ServiceError, 'stubbed response')
      end
    end
  end

  describe 'previous' do
    context 'successful response' do
      subject {
        VCR.use_cassette('previous_v2') do
          # NOTE(chaserx): using frozen time above results in 404; this magic number works though
          NISTRandomnessBeacon::Client.new(1517179800000).previous
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
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500, body: 'stubbed response')
        expect{subject}.to raise_error(NISTRandomnessBeacon::ServiceError, 'stubbed response')
      end
    end
  end

  describe 'next' do
    context 'successful response' do
      subject {
        VCR.use_cassette('next_v2') do
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
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500, body: 'stubbed response')
        expect{subject}.to raise_error(NISTRandomnessBeacon::ServiceError, 'stubbed response')
      end
    end
  end

  describe 'last' do
    context 'successful response' do
      subject {
        VCR.use_cassette('last_v2') do
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
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500, body: 'stubbed response')
        expect{subject}.to raise_error(NISTRandomnessBeacon::ServiceError, 'stubbed response')
      end
    end
  end

  describe 'start chain' do
    context 'successful response' do
      subject {
        VCR.use_cassette('start_chain_v2') do
          # NOTE(chaserx): using frozen time above results in 404; this magic number works though
          NISTRandomnessBeacon::Client.new(1517179800000).start_chain
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
        stub_request(:get, /.*beacon.nist.gov*./).to_return(status: 500, body: 'stubbed response')
        expect{subject}.to raise_error(NISTRandomnessBeacon::ServiceError, 'stubbed response')
      end
    end
  end
end
