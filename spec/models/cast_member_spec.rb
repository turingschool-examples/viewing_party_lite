require 'rails_helper'

describe CastMember, type: :model do
  describe 'relationships' do
    it { should have_many :movie_casts }
    it { should have_many(:movies).through(:movie_casts) }
  end
end
