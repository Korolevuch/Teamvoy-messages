require 'spec_helper'

describe DeleteMessage do
  describe '#destroy_message' do
    context 'when count visit more than two and type deleting visit' do
      let(:service) { DeleteMessage.new(message_object: create(:message, :invalid)) }
      it 'destroy message' do
         expect { service.destroy_message }.to change(Message, :count).by(0)
      end
    end
    context 'when count visit <= 2 and type of deleting is visit' do
      let(:service) { DeleteMessage.new(message_object: create(:message, :valid)) }
      it "don't destroy mesage" do
        expect {service.destroy_message}.to change(Message, :count).by(1)
      end
    end
    context 'when type of deleting is hour' do
      let(:service) { DeleteMessage.new(message_object: create(:message, :valid_hour)) }
      it "don't destroy mesage" do
        expect {service.destroy_message}.to change(Message, :count).by(1)
      end
    end
  end
end

