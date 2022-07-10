require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  decribe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:user) }
  end

  describe 'validations'
    it {should validate_presence_of :party_id}
    it {should validate_presence_of :user_id}
    #shoulda documentation recommends not #validation testing booleans
    #http://www.chrisrolle.com/en/blog/boolean-attribute-validation
  end
end