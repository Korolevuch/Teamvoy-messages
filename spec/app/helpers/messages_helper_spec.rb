require 'spec_helper'

describe 'MessagesHelper' do
  describe '#id_is_numeric?' do
    let(:test_helper) { Class.new { extend Messages::App::MessagesHelper } }

    it 'return true if arg number' do
      expect(test_helper.id_is_numeric?(5)).to be true
    end

    it 'return false if arg is not number' do
      expect(test_helper.id_is_numeric?('dnvjdnvjndvj')).to be false
    end
  end
end
