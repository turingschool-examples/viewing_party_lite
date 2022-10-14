require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'relationships' do
        it { should have_many :hosted_viewing_parties }
        it { should have_many :viewing_party_invitees }
        it { should have_many(:viewing_parties).through(:viewing_party_invitees) }

        it 'has multiple relationships with viewing party via host and invitees', :vcr do
            user_1 = User.create!(name: "Tom", email: "tmusselman@gmail.com")
            user_2 = User.create(name: "Bob", email: "bob@gmail.com")
            user_3 = User.create(name: "Marge", email: "marge@hotmail.com")

            viewing_party_1 = ViewingParty.create!(movie_id: 238, duration: 600, date: "2022-10-10", start_time: "16:00:00", host_id: user_1.id)
            viewing_party_2 = ViewingParty.create!(movie_id: 238, duration: 600, date: "2022-10-10", start_time: "16:00:00", host_id: user_2.id)
        
            viewing_party_1.users << [user_2, user_3]
            viewing_party_2.users << [user_1, user_3]

            expect(user_1.hosted_viewing_parties).to eq([viewing_party_1])
            expect(user_1.viewing_parties).to eq([viewing_party_2])
        end
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
    end
end