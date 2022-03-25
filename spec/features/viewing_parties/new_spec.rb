require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  it "exists and has a movie title" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    movie_detail = MovieDetail.new(id: 1, title: 'title', vote_average: 3.5, runtime: 61, genre: [{key: "value"}] , summary: "summary")
    visit "/users/#{user.id}/movies/#{movie_detail.id}/viewing_party/new"

    expect(current_path).to eq("/users/#{user.id}/movies/#{movie_detail.id}/viewing_party/new")
    within '#title' do
      expect(page).to have_content("#{movie_detail.title}")
    end
  end

  it "has a form a user can fill out to make a viewing party" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    movie_detail = MovieDetail.new(id: 1, title: 'title', vote_average: 3.5, runtime: 61, genre: [{key: "value"}] , summary: "summary")
    visit "/users/#{user1.id}/movies/#{movie_detail.id}/viewing_party/new"

    within '#form' do
      fill_in 'Duration', with: '61'
      check "#{user1.name}"
      click_button('Create')
    end
  end

  it 'does not register a blank duration' do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    movie_detail = MovieDetail.new(id: 1, title: 'title', vote_average: 3.5, runtime: 61, genre: [{key: "value"}] , summary: "summary")
    visit "/users/#{user1.id}/movies/#{movie_detail.id}/viewing_party/new"

    within '#form' do
      fill_in 'Duration', with: ''
      check "#{user1.name}"
      click_button('Create')
    end

    within '#error_messages' do
      expect(page).to have_content("Duration can't be blank")
    end
  end

  it 'does not register a duration shorter than the movie run time' do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    movie_detail = MovieDetail.new(id: 1, title: 'title', vote_average: 3.5, runtime: 61, genre: [{key: "value"}] , summary: "summary")
    visit "/users/#{user1.id}/movies/#{movie_detail.id}/viewing_party/new"

    within '#form' do
      fill_in 'Duration', with: '60'
      check "#{user1.name}"
      click_button('Create')
    end

    within '#error_messages' do
      expect(page).to have_content("Duration can't be shorter than movie run time")
    end
  end

  xit "confirms a user's dashboard displays a viewing party" do

  end
end
