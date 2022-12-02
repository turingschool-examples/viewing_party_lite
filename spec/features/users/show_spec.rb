require 'rails_helper'

RSpec.describe 'users dashboard page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
    @party_1 = Party.create!(duration: 176, day: Date.today, start_time: Time.now, movie_title: "The Godfather")
    @party_2 = Party.create!(duration: 125, day: Date.today, start_time: Time.now, movie_title: "Grinch")
    @user_party_1 = UserParty.create!(user_id: @user_1.id, party_id: @party_1.id, host: true)
    @user_party_2 = UserParty.create!(user_id: @user_1.id, party_id: @party_2.id, host: false)
  end
  
  it 'show the name of the user' do
    visit user_path(@user_1)

    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    visit user_path(@user_1)

    expect(page).to have_button("Discover Movies")
    
    click_on "Discover Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it 'has a section that lists the viewing parties' do
    visit user_path(@user_1)

    expect(page).to have_content("Viewing Parties")
    within("#party-#{@party_1.id}") do
      expect(page).to have_content(@party_1.day)
      expect(page).to have_content(@party_1.start_time)
      expect(page).to have_content(@party_1.movie_title)
      expect(page).to have_content("Hosting")
    end 
  end

  it 'has a section that lists the viewing parties' do
    visit user_path(@user_1)

    expect(page).to have_content("Viewing Parties")
    within("#party-#{@party_2.id}") do
      expect(page).to have_content(@party_2.day)
      expect(page).to have_content(@party_2.start_time)
      expect(page).to have_content(@party_2.movie_title)
      expect(page).to have_content("Invited")
    end
  end
end
# page.should have_css('img', text: "image1.jpg")