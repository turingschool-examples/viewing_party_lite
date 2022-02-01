require 'rails_helper'

describe MovieCast, type: :model do
  describe 'relationships' do
    it { should belong_to :cast_member }
    it { should belong_to :movie }
  end
end
