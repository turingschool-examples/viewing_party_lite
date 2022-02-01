require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it { should validate_presence_of :title }
    it { should have_many :reviews }
    it { should have_many :movie_casts }
    it { should have_many(:cast_members).through(:movie_casts) }
    it { should have_many :view_parties }
  end
end
