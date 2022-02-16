require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:host_id) }
  end
end
