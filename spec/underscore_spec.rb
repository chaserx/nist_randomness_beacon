require_relative '../lib/core_extensions/string/underscore.rb'
require 'spec_helper'
using Underscore

describe Underscore do
  describe 'String#underscore' do
    context 'singleword' do
      it 'converts to underscore' do
        expect('foobar'.underscore).to eq('foobar')
      end
    end

    context 'camelCase' do
      it 'converts to underscore' do
        expect('fooBar'.underscore).to eq('foo_bar')
      end
    end

    context 'multiWordCamelCase' do
      it 'converts to underscore' do
        expect('fooBarBaz'.underscore).to eq('foo_bar_baz')
      end
    end

    context 'dashed-case' do
      it 'converts to underscore' do
        expect('foo-bar'.underscore).to eq('foo_bar')
      end
    end

    context 'Dashed-Case' do
      it 'converts to underscore' do
        expect('Foo-Bar'.underscore).to eq('foo_bar')
      end
    end

    context 'Nested::Module Case' do
      it 'converts to slashed separator' do
        expect('Foo::Bar'.underscore).to eq('foo/bar')
      end
    end
  end
end

