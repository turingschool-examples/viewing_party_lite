require 'rails_helper'

RSpec.describe User do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email)}
     end

     describe 'relationships' do
        it { should have_many(:user_movie_parties) }
        it { should have_many(:movie_parties).through(:user_movie_parties) }
     end
end