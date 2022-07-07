require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end
