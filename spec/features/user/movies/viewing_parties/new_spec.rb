require 'rails_helper'

RSpec.describe "New Viewing Party page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com', password: 'haisall123')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com', password: 'parkersbeard')
    @user3 = User.create!(name: 'Deannah', email: 'FrogStomper9000@Muahaha.com', password: 'sparkles')
    @user4 = User.create!(name: 'Casey', email: 'EternalPancakes@Geemail.com', password: 'taikawaititi')


    @spirit = @user1.viewing_parties.create!(duration: 180, date: Date.today, time: Time.now, movie_id: 129)
    PartyUser.create!(user_id: @user2.id, viewing_party_id: @spirit.id)

    @rocky = @user3.viewing_parties.create!(duration: 180, date: Date.tomorrow, time: Time.now, movie_id: 36685)
    PartyUser.create!(user_id: @user2.id, viewing_party_id: @rocky.id)
    PartyUser.create!(user_id: @user1.id, viewing_party_id: @rocky.id)
  end

  it 'displays movie title', :vcr do
    visit "/users/#{@user1.id}/movies/238/viewing-party/new"

    expect(page).to have_content("The Godfather")
  end

  it 'autopopulations duration of movie runtime', :vcr do
    visit "/users/#{@user1.id}/movies/238/viewing-party/new"

    expect(page).to have_field(:duration, with: 175)
  end

  it 'has form to create a viewing party', :vcr do
    visit "/users/#{@user1.id}/movies/238/viewing-party/new"

    fill_in('Duration', with: 180)
    fill_in('Date', with: "08/23/22")
    fill_in(:start_time, with: "6:00 PM")
    # page.check("#{@user2.name}")
    click_button("Create Party")
  end
end
