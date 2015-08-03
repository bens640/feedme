require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid reservation' do
    expect(create(:message)).to be_valid
  end
  it 'is invalid without a time' do
    expect(build(:reservation, time: nil)).not_to be_valid
  end
end
