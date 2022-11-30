require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationship' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  describe "instance methods" do 
    describe "#host" do 
      it "returns the name of the user hosting that viewing party" do 
        user_1 = User.create!(name: "Amanda", email: "amanda@turing.edu")
        user_2 = User.create!(name: "James", email: "james@turing.edu")
        user_3 = User.create!(name: "Annie", email: "annie@turing.edu")
        party = ViewingParty.create!(movie_id: 1, movie_title: "The Princess Bride", duration: 180, date: '2022-12-12', start_time: '17:00')
        UserViewingParty.create!(user: user_1, viewing_party: party, status: "Hosting")
        UserViewingParty.create!(user: user_2, viewing_party: party, status: "Invited")

        expect(party.host).to eq("Amanda")
      end
    end

    describe "#invitees" do 
      it "returns a collection of names of all the users invited to that party" do 
        user_1 = User.create!(name: "Amanda", email: "amanda@turing.edu")
        user_2 = User.create!(name: "James", email: "james@turing.edu")
        user_3 = User.create!(name: "Annie", email: "annie@turing.edu")
        user_4 = User.create!(name: "Naomi", email: "naomi@turing.edu")
        party = ViewingParty.create!(movie_id: 1, movie_title: "The Princess Bride", duration: 180, date: '2022-12-12', start_time: '17:00')
        UserViewingParty.create!(user: user_1, viewing_party: party, status: "Hosting")
        UserViewingParty.create!(user: user_2, viewing_party: party, status: "Invited")
        UserViewingParty.create!(user: user_3, viewing_party: party, status: "Invited")

        expect(party.invitees).to eq(["James", "Annie"])
      end
    end

    # describe "#image" do 
    #   xit "returns the source path for the image related to the movie party" do 
    #     party = ViewingParty.create!(movie_id: 1, movie_title: "The Princess Bride", duration: 180, date: '2022-12-12', start_time: '17:00')
    #     expect(party.image).to eq("something")
    #   end
    # end
  end
end
