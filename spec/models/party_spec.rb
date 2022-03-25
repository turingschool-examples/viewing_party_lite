require 'rails_helper'

RSpec.describe Party, type: :model do

  describe "relationships" do
    it {have_many(:party_users)}
    it {have_many(:users).through(:party_users)}
  end

  describe ".instance methods" do
    before(:each) do
      @jax = User.create!(name: "Jackson", email: "j@jmail.com")
      @lady = User.create!(name: "LadyBug", email: "l@lmail.com")

      @movie_1 = Movie.create!(api_id: 550)
      @movie_2 = Movie.create!(api_id: 600)


      @party_1 = Party.create!(movie_id: @movie_1.id, duration: 126, date: Date.new(2022, 3, 21), start: '7:00 pm')
      @party_2 = Party.create!(movie_id: @movie_2.id, duration: 108, date: Date.new(2022, 3, 22), start: '8:00 pm')

      @party_user_1 = PartyUser.create!(is_host: true, party_id: @party_1.id, user_id: @jax.id)
      @party_user_2 = PartyUser.create!(is_host: false, party_id: @party_2.id, user_id: @jax.id)
      @party_user_2 = PartyUser.create!(is_host: true, party_id: @party_2.id, user_id: @lady.id)
    end

    describe '.find_host' do
      it 'returns user_id for host for that party' do
        expect(@party_1.find_host).to be(@jax.id)
        expect(@party_2.find_host).to_not be(@jax.id)
        expect(@party_2.find_host).to be(@lady.id)
      end
    end
  end
end
