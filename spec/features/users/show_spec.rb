require 'rails_helper'

RSpec.describe 'The User Dashboard (Show Page)', type: :feature do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/1/credits?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_credits_response.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/1?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})
 
    stub_request(:get, "https://api.themoviedb.org/3/movie/1/reviews?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/citizen_kane_reviews_response.json"), headers: {})
  end

  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }

  let!(:party1) { Party.create!(duration: 160, start_time: Time.now, movie_id: 1 ) }
  let!(:user_party1) { UserParty.create!(user: user1, party: party1, is_host: true) } 
  let!(:user_party2) { UserParty.create!(user: user2, party: party1, is_host: false) } 

  describe 'the basics' do
    it 'has the users name in the title' do
      visit user_path(user1)

      expect(page).to have_content("#{user1.name}'s Dashboard")      
      expect(page).to_not have_content("#{user2.name}'s Dashboard")      
    end
    
    it 'has a button to discover movies' do
      visit user_path(user1)

      expect(page).to have_button("Discover Movies")
    end
    
    it 'will take you to discover movies page on button click' do
      visit user_path(user1)

      click_button("Discover Movies")

      expect(current_path).to eq(user_discover_index_path(user1))

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end
  end

  describe 'the viewing parties section' do
    it 'lists the parties the user is invited to' do
      visit user_path(user1)

      within "#viewing-parties" do
        expect(page).to have_content(party1.start_time.strftime("%A, %B %d, %Y"))
        expect(page).to have_content(party1.start_time.strftime('%I:%M %P'))
        expect(page).to have_content(party1.duration)
        expect(page).to have_content(user1.name)
        expect(page).to have_content(user2.name)
      end
    end
  end
end