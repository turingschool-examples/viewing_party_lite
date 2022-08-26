require 'rails_helper'

RSpec.describe 'viewing party new page' do
  before(:each) do
    @user1 = User.create!(name: 'Cory', email: 'cory@gmail.com')
    @user2 = User.create!(name: 'John', email: 'john@gmail.com')
    @user3 = User.create!(name: 'Kris', email: 'kris@gmail.com')

    party1 = Party.create!(date: Date.today, start_time: '20:00:00', movie_id: 278)

    @user1.user_parties.create!(party_id: party1.id, host: false)
  end

  it "gives details about the viewing party", :vcr do
    visit "/users/#{@user1.id}/movies/278/viewing-party/new"

    expect(page).to have_field('Duration of Party (in minutes)', with: '142')
    expect(page).to have_field('When:')
    expect(page).to have_field('Start Time:')
    expect(page).to have_button("Create Party")
  end

  it "lets you create a party", :vcr do
    visit "/users/#{@user1.id}/movies/278/viewing-party/new"
    fill_in 'When:', with: '09/08/2022'
    fill_in 'Start Time:', with: '20:00:00'

    check('John')

    click_button('Create Party')
    expect(current_path).to eq("/users/#{@user1.id}")


    hosted = @user1.is_host
    invited = @user1.is_invited
    expect(page).to have_content("You are hosting these parties:")
    expect(page).to have_content(hosted.first.id)
    expect(page).to have_content("You have been invited to these parties:")
    expect(page).to have_content(invited.first.id)

  end
end
