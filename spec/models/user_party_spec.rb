require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :party_id }
    # it { should validate_presence_of :user_id }
    it { should validate_presence_of :user_status }
    it { should define_enum_for(:user_status).with_values([:host, :invited, :accepted, :declined]) }
  end

  describe 'relationships' do
    it { should belong_to :user}
    it { should belong_to :party}
  end

end
