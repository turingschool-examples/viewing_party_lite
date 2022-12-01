require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it {should have_many :user_parties }
    it {should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it {should validate_presence_of(:movie_title)}
    it {should validate_presence_of(:duration)}
    it {should validate_numericality_of(:duration)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:time)}
    it {should validate_presence_of(:host_id)}
  end

  describe 'methods' do
    before :each do
      @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
      @yuji = User.create!(name: "Yuji", email: "yuyuhakusho2020@hotmail.com")
      @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")

      @party1 = Party.create!(movie_title: "The Godfather", duration: 175, date: "12/1/2022", time: "19:00", host_id: @mostafa.id)
      @party2 = Party.create!(movie_title: "Young Adam", duration: 93, date: "12/4/2022", time: "18:00", host_id: @mostafa.id)
      @party3 = Party.create!(movie_title: "Natural Born Killers", duration: 118, date: "12/7/2022", time: "20:00", host_id: @mostafa.id)
      @party4 = Party.create!(movie_title: "Pulp Fiction", duration: 154, date: "12/8/2022", time: "19:30", host_id: @yuji.id)
      @party5 = Party.create!(movie_title: "Up", duration: 96, date: "12/13/2022", time: "17:00", host_id: @bryan.id)
    end
  end
end
