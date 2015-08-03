require 'spec_helper'
describe Reservation do
  it 'has a valid reservation' do
    expect(create(:reservation)).to be_valid
  end
  it 'is invalid without a time' do
    expect(build(:reservation, time: nil)).not_to be_valid
  end
  it 'is invalid without a address' do
    expect(build(:reservation, address: nil)).not_to be_valid
  end
  it 'is invalid without a city' do
    expect(build(:reservation, city: nil)).not_to be_valid
  end
  it 'is invalid without a state' do
    expect(build(:reservation, state: nil)).not_to be_valid
  end
  it 'is invalid without a zip' do
    expect(build(:reservation, zip: nil)).not_to be_valid
  end
  it 'is invalid without a zip' do
    expect(build(:reservation, phone: nil)).not_to be_valid
  end
  it 'returns all of current chefs reservations by most recent' do
    chef = create(:chef)
    other_chef = create(:chef, id:2)
    reservations = []
    other_reservations = []
    (10..1).each do |i|
      if (1..5) === i
        reservations << create(:reservation, id:i,
                               date: i.days.from_now,
                               chef_id: chef.id)
      else
        other_reservations << create(:reservation, id:i,
               date: i.days.from_now,
               chef_id: other_chef.id)
      end
      reservations.sort_by! &:date
      other_reservations.sort_by! &:date
    end
    result = Reservation.chef(chef.id)
    expect(reservations).to eq(result)
  end


  it 'returns all of the reservations that are available in order of most recent' do
    # chef = create(:chef)
    reservations = []
    (10..1).each do |i|
      if (1..5) === i
        reservations << create(:reservation, id:i,
                                           date: i.days.from_now,
                                           chef_id: nil)
      else
        create(:reservation, id:i,
               date: i.days.from_now,
               chef_id: i)
      end
      reservations.sort_by! &:date
    end
    result = Reservation.available
    expect(result).to eq(reservations)
  end
end
