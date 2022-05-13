require 'rails_helper'

 RSpec.describe User, type: :model do
   describe 'relationships' do
     it { should have_many(:party_users) }
     it { should have_many(:parties).through(:party_users) }
   end

   describe 'validations' do
     it { should validate_presence_of :name }
     it { should validate_presence_of :email }
   end

   describe "instance methods" do
     before :each do
       @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
       @user_2 = User.create!(name: "Fake Fanny", email: "nonsense@fake.com")

       @party_invited_to = Party.create!(date: "2022/07/01", start_time: "09:00 PM", duration: 300, host_id: @user_2.id, movie_id: 278)

       @party_hosting = Party.create!(date: "2022/07/02", start_time: "10:00 PM", duration: 250, host_id: @user_1.id, movie_id: 279)

       @party_user_1 = PartyUser.create!(party_id: @party_invited_to.id, user_id: @user_1.id)

       @party_user_2 = PartyUser.create!(party_id: @party_hosting.id, user_id: @user_2.id)
     end

     it "finds all parties a user has been invited to" do
       expect(@user_1.parties_invited_to).to eq([@party_invited_to])
       expect(@user_2.parties_hosting).to eq([@party_invited_to])
     end

     it "finds all parties a user is hosting" do
       expect(@user_1.parties_hosting).to eq([@party_hosting])
       expect(@user_2.parties_invited_to).to eq([@party_hosting])
     end

     it "finds movie details for parties hositng and invited to" do
       expect(@user_1.hosting_movies.first.title).to eq("Amadeus")
     end
   end
 end
