require 'rails_helper'

RSpec.describe ViewingParty do 
    describe 'associations' do 
        it { should have_many(:user_viewing_parties) }
        it { should have_many(:users).through(:user_viewing_parties) }
    end
    it 'should assign the duration of a movie after validations', :vcr do 
        user = User.create(name: 'test name', email: 'test@yahoo.com')
        vp = ViewingParty.create!(user: user, date_time: "2022-03-21 22:02:34", movie_id: 143)
        expect(vp.duration).to eq(133)
    end
end