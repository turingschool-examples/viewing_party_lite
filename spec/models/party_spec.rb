require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:host_id) }
  end

  describe 'methods' do
    before :each do
      @mostafa = User.create!(name: 'Mostafa', email: 'sasa2020@hotmail.com')
      @yuji = User.create!(name: 'Yuji', email: 'yuyuhakusho2020@hotmail.com')
      @bryan = User.create!(name: 'Bryan', email: 'breakingbad2020@hotmail.com')

      @party_1 = @mostafa.parties.create!(movie_title: 'The Godfather', duration: 175, date: '12/1/2022',
                                          time: '19:00', host_id: @mostafa.id)
      @party_2 = @mostafa.parties.create!(movie_title: 'Young Adam', duration: 93, date: '12/4/2022', time: '18:00',
                                          host_id: @mostafa.id)
      @party_3 = @mostafa.parties.create!(movie_title: 'Natural Born Killers', duration: 118, date: '12/7/2022',
                                          time: '20:00', host_id: @mostafa.id)
      @party_4 = @yuji.parties.create!(movie_title: 'Pulp Fiction', duration: 154, date: '12/8/2022', time: '19:30',
                                       host_id: @yuji.id)
      @party_5 = @bryan.parties.create!(movie_title: 'Up', duration: 96, date: '12/8/2022', time: '17:00',
                                        host_id: @bryan.id)

      @yuji_party_1 = UserParty.create(user_id: @yuji.id, party_id: @party_1.id)
      @yuji_party_2 = UserParty.create(user_id: @yuji.id, party_id: @party_2.id)
      @bryan_party_1 = UserParty.create(user_id: @bryan.id, party_id: @party_1.id)
      @bryan_party_3 = UserParty.create(user_id: @bryan.id, party_id: @party_3.id)
      @mostafa_party_5 = UserParty.create(user_id: @mostafa.id, party_id: @party_5.id)
    end

    it 'has a method to find the party host name' do
      expect(@party_4.find_host_name).to eq('Yuji')
      expect(@party_1.find_host_name).to eq('Mostafa')
      expect(@party_5.find_host_name).to eq('Bryan')
    end
  end
end
