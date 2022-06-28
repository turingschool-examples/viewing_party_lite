# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    @user2 = User.create!(name: 'Alex', email: 'alex@alex.com', password: 'test123')
    @user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

  end

  it 'contains all expected attributes of the selected user', :vcr do
    visit "/dashboard"
    # visit '/dashboard'
    within '#title' do
      expect(page).to have_content(@user1.name)
      expect(page).to_not have_content(@user1.email)
      expect(page).to_not have_content(@user2.name)
      expect(page).to_not have_content(@user2.email)
    end

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
    end

    within '#watch-parties' do
      expect(page).to have_content('Current Scheduled Parties!')
    end
  end
  describe 'If I have any parties I am invited to' do 

    it 'should have movie image, title (as link), date/time and who is hosting event, others invited', :vcr do
      date1 = 	"2023-02-08 09:30:00 UTC".to_datetime
      date2 = 	"2022-05-08 14:30:00 UTC".to_datetime
      #jaws
      party1 = Party.create!(user_id: @user1.id, duration: 124, when: date1, start_time: date1, movie_id: 578)
      #the fountain
      party2 = Party.create!(user_id: @user1.id, duration: 124, when: date2, start_time: date2, movie_id: 1381)
      
      attendee1 = Attendee.create!(user_id: @user2.id, party_id: party1.id)
      attendee2 = Attendee.create!(user_id: @user2.id, party_id: party2.id)
      visit "/dashboard"

      within "#party_id-#{party1.id}" do 
        expect(page).to have_content("Jaws")
        expect(page).to have_content('When: February 08, 2023')
        expect(page).to have_content("Start Time: 09:30 AM")
        expect(page).to have_content("Host: Skeeter")
        expect(page).to have_content("Attendees:")
        expect(page).to have_content("Alex")
      end 
      within "#party_id-#{party2.id}" do 
        expect(page).to have_content("The Fountain")
        expect(page).to have_content("When: May 08, 2022")
        expect(page).to have_content("Start Time: 02:30 PM")
        expect(page).to have_content("Host: Skeeter")
        expect(page).to have_content("Attendees:")
        expect(page).to have_content("Alex")

      end 
    end 
  end 
  describe 'When I am the host of one or more parties' do
    it 'shows me when I am host of a party and/or just an attendee', :vcr do
      date1 = 	"2023-02-08 09:30:00 UTC".to_datetime
      date2 = 	"2022-05-08 14:30:00 UTC".to_datetime
      date3 = 	"2022-06-08 16:00:00 UTC".to_datetime
      #jaws-host
      party1 = Party.create!(user_id: @user1.id, duration: 124, when: date1, start_time: date1, movie_id: 578)
      #the fountain-host
      party2 = Party.create!(user_id: @user1.id, duration: 124, when: date2, start_time: date2, movie_id: 1381)
      #jaws party 2- attendee/invited
      party3 = Party.create!(user_id: @user2.id, duration: 124, when: date3, start_time: date3, movie_id: 578)
     
      attendee1 = Attendee.create!(user_id: @user2.id, party_id: party1.id)
      attendee2 = Attendee.create!(user_id: @user2.id, party_id: party2.id)
      attendee3 = Attendee.create!(user_id: @user1.id, party_id: party3.id)
      visit "/dashboard"

      within "#party_id-#{party1.id}" do 
        expect(page).to have_content("Jaws")
        expect(page).to have_content('When: February 08, 2023')
        expect(page).to have_content("Start Time: 09:30 AM")
        expect(page).to have_content("Host: Skeeter")
      end 
      within "#party_id-#{party2.id}" do 
        expect(page).to have_content("The Fountain")
        expect(page).to have_content("When: May 08, 2022")
        expect(page).to have_content("Start Time: 02:30 PM")
        expect(page).to have_content("Host: Skeeter")

      end 
      within "#party_id-#{party3.id}" do 
        expect(page).to have_content("Jaws")
        expect(page).to have_content('When: June 08, 2022')
        expect(page).to have_content("Start Time: 04:00 PM")
        expect(page).to have_content("Attendees:")
        expect(page).to have_content("Skeeter")
      end 
    end 
    it 'each movie title links to that movies details/show page', :vcr do
      date1 = 	"2023-02-08 09:30:00 UTC".to_datetime
      date2 = 	"2022-05-08 14:30:00 UTC".to_datetime
      #jaws
      party1 = Party.create!(user_id: @user1.id, duration: 124, when: date1, start_time: date1, movie_id: 578)
      #the fountain
      party2 = Party.create!(user_id: @user1.id, duration: 124, when: date2, start_time: date2, movie_id: 1381)
      
      attendee1 = Attendee.create!(user_id: @user2.id, party_id: party1.id)
      attendee2 = Attendee.create!(user_id: @user2.id, party_id: party2.id)
      visit "/dashboard"
      
      within "#party_id-#{party1.id}" do 
        expect(page).to have_link("Jaws")
      end 
      within "#party_id-#{party2.id}" do 
        click_link "The Fountain"
      end 
      expect(current_path).to eq("/movies/1381")
    end 

  end 

end
