require 'rails_helper'

RSpec.describe UserParty, type: :model do
  it 'exists' do
    user = User.create!(name: 'John', email: 'x@user.com')
    party_1 = Party.create!(duration: 95, date: '12-31-22', start_time: '7:35p', movie_id: 1)
    user_party_1 = UserParty.create!(user: user, party: party_1, host_status: true)
    expect(user_party_1).to be_instance_of(UserParty)
  end

  describe 'validations' do
   # http://www.chrisrolle.com/en/blog/boolean-attribute-validation
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
end
