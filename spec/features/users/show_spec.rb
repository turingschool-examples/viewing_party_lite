require 'rails_helper'
require 'faker'

RSpec.describe 'Users' do
  before(:all) do
    up_search_json = File.read('spec/fixtures/search_up_movies.json')
    alien_search_json = File.read('spec/fixtures/search_alien_movies.json')
    whiplash_search_json = File.read('spec/fixtures/search_whiplash_movies.json')
    toy_story_search_json = File.read('spec/fixtures/search_toy_story_movies.json')
    brave_search_json = File.read('spec/fixtures/search_brave_movies.json')

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en-US&page=1&include_adult=false&query=Up").to_return(status: 200, body: up_search_json)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en-US&page=1&include_adult=false&query=Alien").to_return(status: 200, body: alien_search_json)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en-US&page=1&include_adult=false&query=Whiplash").to_return(status: 200, body: whiplash_search_json)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en-US&page=1&include_adult=false&query=Toy Story").to_return(status: 200, body: toy_story_search_json)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['tmdb_api_key']}&language=en-US&page=1&include_adult=false&query=Brave").to_return(status: 200, body: brave_search_json)

    @user1 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
    @user2 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
    @user3 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)
    @user4 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.free_email)

    @party1 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Up", duration: (240 + rand(30)))
    @party2 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Alien", duration: (240 + rand(30)))
    @party3 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Whiplash", duration: (240 + rand(30)))
    @party4 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Toy Story", duration: (240 + rand(30)))
    @party5 = Party.create!(date: (DateTime.now + rand(90).days), start_time: "#{rand(1..24)}:00", movie_title: "Brave", duration: (240 + rand(30)))
    
    @party_user1 = PartyUser.create!(user_id: @user1.id, party_id: @party1.id, host: true)
    @party_user2 = PartyUser.create!(user_id: @user1.id, party_id: @party2.id, host: true)
    @party_user3 = PartyUser.create!(user_id: @user1.id, party_id: @party3.id, host: false)
    @party_user4 = PartyUser.create!(user_id: @user1.id, party_id: @party4.id, host: false)

    @party_user5 = PartyUser.create!(user_id: @user2.id, party_id: @party3.id, host: true)
    @party_user6 = PartyUser.create!(user_id: @user3.id, party_id: @party4.id, host: true)

    @party_user7 = PartyUser.create!(user_id: @user2.id, party_id: @party1.id, host: false)
    @party_user8 = PartyUser.create!(user_id: @user2.id, party_id: @party2.id, host: false)
    @party_user9 = PartyUser.create!(user_id: @user3.id, party_id: @party1.id, host: false)
    @party_user10 = PartyUser.create!(user_id: @user3.id, party_id: @party3.id, host: false)

    @party_user11 = PartyUser.create!(user_id: @user4.id, party_id: @party5.id, host: true)
    @party_user12 = PartyUser.create!(user_id: @user3.id, party_id: @party5.id, host: false)

    visit "/users/#{@user1.id}"
  end

  describe 'show' do
    it 'has user name dashboard at the top' do
      expect(page).to have_content("#{@user1.name} Dashboard")
    end

    it 'has a link styled as a button to discover movies' do
      expect(page).to have_link('Discover Movies')
    end

    it 'links to the discover page for the user' do
      click_link('Discover Movies')
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end


    it 'has section to display parties' do
      within('#parties') do
        expect(page).to have_content('Viewing Parties')
      end
    end
    describe 'parties section' do
      context 'user is not host' do
        it 'has each party that the user is invited to' do
          within('#invited_to') do
            expect(page).to have_content('Whiplash')
            expect(page).to have_content('Toy Story')
          end
        end
        it 'has a list of each user invited to the party including my user' do
          within("#invited_to_#{@party3}") do
            expect(page).to have_content(@user1.name)
            expect(page).to have_content(@user3.name)
            expect(page).not_to have_content(@user2.name)
          end
        end
        it 'has the name of my user in bold in the list' do
          within("#invited_to_#{@party3}") do
            expect(page).to have_css('b', text: @user1.name)
          end
        end
      end
      context 'user is host' do
        it 'has each party that the user is host of' do
          within('#hosting') do
            expect(page).to have_content('Up')
            expect(page).to have_content('Alien')
          end
        end
        it 'has a list of users invited to the party' do
          within("#invited_to_#{@party1}") do
            expect(page).not_to have_content(@user1.name)
            expect(page).to have_content(@user2.name)
            expect(page).to have_content(@user3.name)
          end
        end
      end
      it 'has the movie title of each party that the user is involved in' do
        within('#hosting') do
          expect(page).to have_content('Up')
          expect(page).to have_content('Alien')
        end
        within('#invited_to') do
          expect(page).to have_content('Whiplash')
          expect(page).to have_content('Toy Story')
        end
        expect(page).not_to have_content('Brave')
      end
      it 'redirects to the movie show page when the movie title is clicked' do
        click_link 'Up'
        expect(page).to have_current_path("/users/#{@user1.id}/movies/14160")
      end
      it 'has the image of each movie' do
        expect(page).to have_css('img', text: 'https://api.themoviedb.org/vpbaStTMt8qqXaEgnOR2EE4DNJk.jpg')
        expect(page).to have_css('img', text: 'https://api.themoviedb.org/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg')
      end
      it 'has the date and time of the event' do
        within "#party_#{@party1.id}" do
          expect(page).to have_content(@party1.date)
          expect(page).to have_content(@party1.start_time)
        end
      end
      it 'has the name of the party host' do
        within "#party_#{@party1.id}" do
          expect(page).to have_content("Host: #{@user1.name}")
        end
        within "#party_#{@party3.id}" do
          expect(page).to have_content("Host: #{@user2.name}")
        end
      end
    end
  end
end
