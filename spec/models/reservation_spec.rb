require 'spec_helper'
describe Reservation do
  it 'has a valid reservation' do
    expect(create(:reservation)).to be_valid
  end
  it 'returns all of current chefs reservations by most recent' do
    chef = create(:chef)
    reservations = []
    (1..5).each do |i|
      reservations << create(:reservation, id:i, date: i.days.from_now, chef_id: chef.id)
    end
    result = Reservation.chef(chef.id)
    expect(result).to eq(reservations)
  end
end