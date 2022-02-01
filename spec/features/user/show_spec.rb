require 'rails_helper'

RSpec.describe 'User show page' do

  it "checks that the users name is on the page " do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit user_path(user_1)
    expect(page).to have_content("#{user_1.name}'s Dashboard")
  end

  it "checks for a button to discover movies " do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit user_path(user_1)

    click_button "Discover Movies"
  end

  it 'has a section to show information for users viewing parties' do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    movie_1 = Movie.create!(title: 'Movie 1', vote_average: 7.0, runtime: 120, genre: 'genre 1', summary: 'summary 1', cast_members: 'cast members 1', total_review_count: 1, review_information: 'review information 1')
    party_1 = Party.create!(duration: 120, date: '2022-10-1', start_time: '19:00:00', movie_id: movie_1.id)

    user_party_11 = UserParty.create!(user_id: user_1.id, party_id: party_1.id, host: true)

    visit user_path(user_1)

    expect(page).to have_content('Viewing parties:')

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(party_1.date)
    expect(page).to have_content(party_1.start_time)
  end

  xit 'has a section to show if user is hosting or attending' do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    movie_1 = Movie.create!(title: 'Movie 1', vote_average: 7.0, runtime: 120, genre: 'genre 1', summary: 'summary 1', cast_members: 'cast members 1', total_review_count: 1, review_information: 'review information 1')
    party_1 = Party.create!(duration: 120, date: '2022-10-1', start_time: '19:00:00', movie_id: movie_1.id)

    user_party_11 = UserParty.create!(user_id: user_1.id, party_id: party_1.id, host: true)

    visit user_path(user_1)

    expect(page).to have_content("Hosting")
  end
end
