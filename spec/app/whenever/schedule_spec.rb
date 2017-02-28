require 'spec_helper'

describe 'Schedule' do
  let(:whenever) { ::Whenever::JobList.new(file: Padrino.root("config", "schedule.rb").to_s)  }

  it 'deleting invalid messages every minute' do
    expect(whenever).to schedule_rake('delete').every(60.seconds)
  end

end
