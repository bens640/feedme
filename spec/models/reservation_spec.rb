require 'spec_helper'
describe Reservation do
  it 'has a valid reservation' do
    expect(create(:reservation)).to be_valid
  end
  it 'returns all of current chefs reservations by most recent' do
    chef = create(:chef)
    reservations = []
    (1..5).each do |i|
      reservations << create(:reservation, id:i,
                             date: Faker::Date.between(30.days.from_now, 35.days.from_now),
                             chef_id: chef.id)
      reservations.sort_by! &:date
      reservations.reverse!
    end
    result = Reservation.chef(chef.id)
    expect(result).to eq(reservations)
  end
  it 'returns all of the reservations that are available' do
    # chef = create(:chef)
    reservations = []
    (1..5).each do |i|
      reservations << FactoryGirl.create(:reservation, id:i,
                                         date: i.days.from_now,
                                         chef_id: nil)
    end
    result = Reservation.available
    expect(result).to eq(reservations)
  end
end