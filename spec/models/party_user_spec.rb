require 'rails_helper'

RSpec.describe PartyUser do

  describe 'relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:party)}
  end

  it "defaults to 0" do
    party = PartyUser.new
    expect(party.set_default_status).to eq(:attending)
  end
  it "changes to 1 when hosting" do
    @Kevin = User.create!(name: 'Kevin', email: 'kevin@gmail.com')
    @suzie = User.create!(name: 'Suzie', email: 'suzieq@gmail.com')
    @party = Party.create(duration: 180, date: '2022-02-03', start_time: '21:47')
    @pu1 = PartyUser.create(user: @Kevin, party: @party, status: :hosting)

    expect(@pu1.status).to eq("hosting")
  end
end
