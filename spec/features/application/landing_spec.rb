require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do 
    @vp1 = ViewingParty.create!(movie_id: 111, duration: 151, date: Time.new(2022, 04, 12, 21, 00), start_time: Time.new(2022, 04, 12, 21, 00))
    @vp2 = ViewingParty.create!(movie_id: 112, duration: 152, date: Time.new(2022, 04, 11, 20, 30), start_time: Time.new(2022, 04, 11, 20, 30))
    @user1 = User.create!(name: "Becky", email: "becky@example.com")
    @user2 = User.create!(name: "Steven", email: "steven@example.com")
    @user5 = User.create!(name: "Bruce", email: "Bruce@example.com")
    @user6 = User.create!(name: "Tony", email: "Tony@example.com")
    @up1 = UserParty.create!(viewing_party: @vp1, user: @user1, host: true)
    @up2 = UserParty.create!(viewing_party: @vp1, user: @user2, host: false)
    @up5 = UserParty.create!(viewing_party: @vp2, user: @user5, host: true)
    @up6 = UserParty.create!(viewing_party: @vp2, user: @user6, host: false)

    visit "/"
  end

  it 'has the title of the application' do 
    expect(page).to have_content("Viewing Party Light")
  end

  it 'has a button to create a new user' do 
    expect(page).to have_button("Create a New User")
    click_button("Create a New User")
    expect(current_path).to eq(new_user_path)
  end
  
  it 'has a link to the landing page' do 
    visit user_path(@user1)

    expect(page).to have_link("Home")
    click_link("Home")
    expect(current_path).to eq("/")
  end

  it 'has a list of existing users' do 
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
    expect(page).to have_content(@user5.email)
    expect(page).to have_content(@user6.email)
    expect(page).to_not have_content(@vp1.movie_id)
  end

  xit 'existing users link to user dashboard' do 

  end
end 
