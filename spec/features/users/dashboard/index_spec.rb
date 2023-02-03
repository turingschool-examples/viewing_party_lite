require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  before :each do
    @user = User.create!(name: "John Cena", email: "John@email.com")
    @user2 = User.create!(name: "Bob Cena", email: "behn@email.com")
    @viewing_party1 = ViewingParty.create!(when: "11/21/2030", duration: 90, start_time: "7:00", movie_id: 550)
    @viewing_party2 = ViewingParty.create!(when: "11/21/2030", duration: 120, start_time: "10:00", movie_id: 550)
    @movie = Movie.create!(api_id: 550, image_url: "https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", title: "Fight Club")
    Invitee.create!(user_id: @user.id, viewing_party_id: @viewing_party1.id, host: true)
    Invitee.create!(user_id: @user.id, viewing_party_id: @viewing_party2.id, host: false)
    Invitee.create!(user_id: @user2.id, viewing_party_id: @viewing_party1.id, host: false)
    Invitee.create!(user_id: @user2.id, viewing_party_id: @viewing_party2.id, host: true)
    visit user_dashboard_index_path(@user)
  end

  it 'contains a header' do
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button("Discover Movies")
  end

  it 'has a section that list the users viewing parties and the viewing parties the user was invited to' do
    within "div#viewing_party_#{@viewing_party1.id}" do
      expect(page).to have_content("Viewing Party #{@viewing_party1.id}")
      expect(page).to have_content("Users I Invited:")
      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("Date: 11/21/2030")
      expect(page).to have_content("Time: 7:00")
    end

    within "div#viewing_party_#{@viewing_party2.id}" do
      expect(page).to have_content("Viewing Party #{@viewing_party2.id}")
      expect(page).to have_content("Users in Viewing Party")
      expect(page).to have_content("John@email.com")
      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("Host: behn@email.com")
      expect(page).to have_content("Date: 11/21/2030")
      expect(page).to have_content("Time: 10:00")
    end
  end
end
