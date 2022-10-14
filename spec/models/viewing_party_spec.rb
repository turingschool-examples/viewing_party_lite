require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
    describe 'relationships' do
        it { should belong_to :host }
        it { should have_many :viewing_party_invitees }
        it { should have_many(:users).through(:viewing_party_invitees) }

        it 'has multiple relationships with user, for host and invitees', :vcr do
            host = User.create!(name: "Tom", email: "tmusselman@gmail.com")
            viewing_party = ViewingParty.create!(movie_id: 238, duration: 600, date: "2022-10-10", start_time: "16:00:00", host_id: host.id)
            
            invitee_1 = User.create(name: "Bob", email: "bob@gmail.com")
            invitee_2 = User.create(name: "Marge", email: "marge@hotmail.com")
            invitee_3 = User.create(name: "Beatrice", email: "beatrice@yahoo.com")
            invitee_4 = User.create(name: "Ginger", email: "ginger_spice@hotmail.com")

            viewing_party.users << [invitee_1, invitee_2, invitee_3, invitee_4]

            expect(viewing_party.host).to eq(host)
            expect(viewing_party.users).to eq([invitee_1, invitee_2, invitee_3, invitee_4])
        end

        it 'has a factory that works', :vcr do
            vp_1 = create(:viewing_party)
            expect(vp_1.host).to be_instance_of(User)
        end
    end
end