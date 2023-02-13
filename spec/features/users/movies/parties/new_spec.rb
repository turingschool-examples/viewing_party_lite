require 'rails_helper'

RSpec.describe 'Parties New Page', type: :feature do
  before :each do
    stub_request(:get, 'https://api.themoviedb.org/3/movie/51888?api_key')
      .to_return(status: 200, body: File.read('spec/fixtures/robot_chicken_response.json'), headers: {})
  end
  
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:movie1) { 51_888 }
  describe 'The basics of the page' do
    it 'has a title' do
      visit new_user_movie_party_path(user1, movie1)

      expect(page).to have_content('Robot Chicken: Star Wars Episode III')
    end
  end

  describe 'create viewing party form' do
    it 'can create viewing parties' do
      visit new_user_movie_party_path(user1, movie1)

      expect(page).to have_field(:duration)
      expect(page).to have_field(:date)
      expect(page).to have_field(:start_time)
      expect(page).to have_button('Create Party')

      fill_in 'Duration', with: 120
      fill_in 'Date', with: '2024-01-01'
      fill_in 'Start Time', with: '12:00'
      check user2.id.to_s

      click_button 'Create Party'

      expect(current_path).to eq(user_path(user1))
    end
  end

  describe 'sad path create viewing party form' do
    it 'can create viewing parties' do
      visit new_user_movie_party_path(user1, movie1)

      click_button 'Create Party'

      expect(page).to have_content('Please fill in all fields accurately')
      expect(page).to have_field(:duration)
      expect(page).to have_field(:date)
      expect(page).to have_field(:start_time)

      fill_in 'Duration', with: 120
      fill_in 'Date', with: '2024-01-01'
      fill_in 'Start Time', with: '12:00'
      check user2.id.to_s

      click_button 'Create Party'

      expect(current_path).to eq(user_path(user1))
    end
  end
end
