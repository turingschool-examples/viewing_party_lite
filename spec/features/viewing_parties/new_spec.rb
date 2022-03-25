require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  xit "exists and has a movie title" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')

    VCR.use_cassette('movie_title') do
      visit "/users/#{user1.id}/movies/24126/"
      within '#buttons' do
        click_button('Create Viewing Party for Warlock: The Armageddon')
      end
      expect(current_path).to eq("/users/#{user1.id}/movies/24126/viewing_party/new")
      within '#title' do
        expect(page).to have_content("Warlock: The Armageddon")
      end
    end
  end

  it "has a form a user can fill out to make a viewing party" do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    VCR.use_cassette('movie_title') do
      visit "/users/#{user1.id}/movies/24126/"
      within '#buttons' do
        click_button('Create Viewing Party for Warlock: The Armageddon')
      end
      within '#form' do
        fill_in 'Duration', with: '61'
        fill_in 'start_date', with: 'date'
        fill_in 'start_time', with: 'time'

        check "#{user1.name}"
        click_button('Create')
      end
    end
  end

  xit 'does not register a blank duration' do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    VCR.use_cassette('movie_title') do
      visit "/users/#{user1.id}/movies/24126/"

      within '#buttons' do
        click_button('Create Viewing Party for Warlock: The Armageddon')
      end

      within '#form' do
        fill_in 'Duration', with: ''
        check "#{user1.name}"
        click_button('Create')
      end

      within '#error_messages' do
        expect(page).to have_content("Duration can't be blank")
      end
    end
  end

  xit 'does not register a duration shorter than the movie run time' do
    User.destroy_all
    user1 = User.create!(name: 'user1', email: 'user1@email.com')
    user2 = User.create!(name: 'user2', email: 'user2@email.com')

    VCR.use_cassette('movie_title') do
      visit "/users/#{user1.id}/movies/24126/"
      within '#buttons' do
        click_button('Create Viewing Party for Warlock: The Armageddon')
      end
    end

    visit "/users/#{user1.id}/movies/24126/viewing_party/new"

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
