require 'spec_helper'
describe User do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end
  it 'is invalid without a first_name' do
    expect(build(:user, first_name: nil)).not_to be_valid
  end
  it 'is invalid without a last_name' do
  expect(build(:user, last_name: nil)).not_to be_valid
  end
  it 'is invalid without a email' do
  expect(build(:user, email: nil)).not_to be_valid
  end
  it 'is invalid without a password-digest'do
    expect(build(:user, password_digest: nil)).not_to be_valid
  end
  it 'does not allow user to be created with an existing email' do
    user1 = create(:user)
    expect(build(:user, email: user1.email)).not_to be_valid
  end
  it 'returns a contact"s full name as a string' do
    contact = create(:user, first_name: "John", last_name: "Doe")
    expect(contact.name).to eq('John Doe')
  end
end