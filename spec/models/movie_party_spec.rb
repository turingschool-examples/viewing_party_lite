require 'rails_helper'

RSpec.describe MovieParty do
    describe 'validations' do
        it { should validate_presence_of(:movie_title) }
        it { should validate_presence_of(:duration) }
        it { should validate_presence_of(:start_time) }
        it { should validate_presence_of(:movie_id) }
     end

     describe 'relationships' do
        it { should have_many(:user_movie_parties) }
        it { should have_many(:users).through(:user_movie_parties) }
     end
end