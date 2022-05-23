require 'rails_helper'

RSpec.describe "New Party Page" do 

  describe "As a Visitor" do 

    it 'it has the movie title and a form to create a new party' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      jaws_id = 578
      
      visit "/users/#{skeeter.id}/movies/#{jaws_id}/party/new"
     
      expect(page).to have_content("Create a Movie Party for Jaws")
      expect(page).to have_field('Duration of Party', with: '124')
      expect(page).to have_field('Start Time', with: '7:00')

    end 

    it 'the new party form has a checkbox list of all users to add them to the party' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password_digest: 'test12', password_confirmation: 'test12')
      hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password_digest: 'test1', password_confirmation: 'test1')
      ruby = User.create!(name: 'Ruby', email: 'rubythehut@food.com', password_digest: 'test', password_confirmation: 'test')
      woobie = User.create!(name: 'Woobie', email: 'woobiethehut@food.com', password_digest: 'test1234', password_confirmation: 'test1234')
      jaws_id = 578
     
      visit "/users/#{skeeter.id}/movies/#{jaws_id}/party/new"
    
      expect(page).to have_content('Invite Other Users')
      expect(page).to have_field('LugNut', checked: false) 
      expect(page).to have_field('Hazel', checked: false) 
      expect(page).to have_field('Ruby', checked: false) 
      expect(page).to have_field('Woobie', checked: false) 
    end 
    
    describe 'when a new party is created' do
      it 'I am redirected to my dashboard with new party shown, party also show on attendees dashboards' do
        skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
        lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password_digest: 'test12', password_confirmation: 'test12')
        hazel = User.create!(name: 'Hazel', email: 'hazelthehut@food.com', password_digest: 'test1', password_confirmation: 'test1')
        jaws_id = 578
        
        visit "/users/#{skeeter.id}/movies/#{jaws_id}/party/new"
        
        fill_in "Duration of Party", with: 124
        select 2022, from: '_date_1i'
        select 'May', from: '_date_2i'
        select '12', from: '_date_3i'

        fill_in "Start Time", with: "8:00"
        check("attendees_#{lugnut.id}")
        check("attendees_#{hazel.id}")

        click_on "Create Party"
        expect(current_path).to eq("/users/#{skeeter.id}")
        expect(page).to have_content("Jaws")
        expect(page).to have_content("When: May 12, 2022")
        
        visit "/users/#{lugnut.id}"
        expect(page).to have_content("When: May 12, 2022")
        expect(page).to have_content("Jaws")

      end 
    end 
    it 'cannot make a new party with a duration less than the movies runtime' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com', password_digest: 'test123', password_confirmation: 'test123')
      lugnut = User.create!(name: 'LugNut', email: 'fatdog@corgi.com', password_digest: 'test12', password_confirmation: 'test12')
      jaws_id = 578
      
      visit "/users/#{skeeter.id}/movies/#{jaws_id}/party/new"
      
      fill_in "Duration of Party", with: 111
      select 2022, from: '_date_1i'
      select 'May', from: '_date_2i'
      select '12', from: '_date_3i'

      fill_in "Start Time", with: "8:00"
      check("attendees_#{lugnut.id}")
      click_on "Create Party"

      expect(current_path).to eq("/users/#{skeeter.id}/movies/#{jaws_id}/party/new")
      expect(page).to have_content('Duration Cannot Be Less Than Movie Runtime!')
    end 
  end 
end 

