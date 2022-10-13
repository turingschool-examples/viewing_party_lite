# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing Party | New', type: :feature do
  describe 'When I visit the new viewing party page;', :vcr do
    before(:each) do
      @user1 = User.create!(name: 'jojo binks', email: 'jojo_binks@gmail.com')
      @user2 = User.create!(name: 'bobby', email: 'bobby@yahoo.com')
      @user3 = User.create!(name: 'marissa nicole', email: 'marissa.nicole99@gmail.com')
      @movie = MovieFacade.create_individual_movie(361_743)
      visit new_user_movie_viewing_party_path(@user1, @movie.id)
    end
    it 'I should see the name of the movie title rendered' do
      within('#movie_title') { expect(page).to have_content('Top Gun') }
    end
    describe 'I can see a form with;', :vcr do
      it 'a populated duration that is the minimum time for the movie' do
        within('#view_party_form') do
          expect(page).to have_field('form_info[duration]')
          expect(find_field('form_info[duration]')['placeholder']).to eq @movie.runtime.to_s
        end
      end
      it 'When: field to select date' do
        within('#view_party_form') { expect(page).to have_field('form_info[date]') }
      end
      it 'Start Time: field to select time' do
        within('#view_party_form') { expect(page).to have_field('form_info[time]') }
      end
      it 'Checkboxes next to each existing user in the system' do
        within('#view_party_form') do
          check_boxes = find_all('.checkbox')
          expect(check_boxes.count).to eq 2

          expect(page).to_not have_content @user1.email.capitalize
          expect(page).to have_content @user2.email.capitalize
          expect(page).to have_content @user3.email.capitalize
        end
      end
      it 'Button to create a party' do
        within('#view_party_form') { expect(page).to have_button('Create Viewing Party') }
      end
    end
    context 'Happy path' do
      it 'When I fill in the information in the form correctly, I am redirected to my dashboard' do
        within('#view_party_form') do
          fill_in 'form_info[duration]', with: 140
          fill_in 'form_info[date]', with: '1999-07-20'
          fill_in 'form_info[time]', with: '19:30'
          check "users[#{@user2.id}]"
          click_on 'Create Viewing Party'
          expect(page.current_path).to eq user_path(@user1)
        end
      end
      it 'I see the newly made viewing party in my dashboard' do
        within('#view_party_form') do
          fill_in 'form_info[duration]', with: 140
          fill_in 'form_info[date]', with: '1999-07-20'
          fill_in 'form_info[time]', with: '19:30'
          check "users[#{@user2.id}]"
          click_on 'Create Viewing Party'
          expect(page.current_path).to eq user_path(@user1)
        end
        within('.container') do
          expect(page).to have_content('View Party created successfully')
        end
        party = ViewingParty.last
        within("#party-#{party.id}") do
          expect(page).to have_content 'Top Gun: Maverick'
          expect(page).to have_content 'July 20, 1999 12:00 AM'
          within('#role') do
            expect(page).to have_content('Host')
            expect(page).to_not have_content('Invited')
          end
        end
      end
      it 'Other users are correctly invited to my viewing party' do
        within('#view_party_form') do
          fill_in 'form_info[duration]', with: 140
          fill_in 'form_info[date]', with: '1999-07-20'
          fill_in 'form_info[time]', with: '19:30'
          check "users[#{@user2.id}]"
          click_on 'Create Viewing Party'
          expect(page.current_path).to eq user_path(@user1)
        end
        visit user_path(@user2)
        within('#viewing_parties') do
          expect(page).to have_content('Top Gun: Maverick')
          expect(page).to have_content('July 20, 1999 12:00 AM')
          within('#role') do
            expect(page).to_not have_content('Host')
            expect(page).to have_content('Invited')
          end
        end
      end
    end
    context 'Sad Path' do
      it 'When I fill in the information in the form incorrectly, I see a flash message stating an error' do
        within('#view_party_form') do
          fill_in 'form_info[duration]', with: 140
          fill_in 'form_info[date]', with: '1999-07-20'
          check "users[#{@user2.id}]"
          click_on 'Create Viewing Party'
          expect(page.current_path).to eq new_user_movie_viewing_party_path(@user1, @movie.id)
        end
        within('.container') do
          expect(page).to have_content('Error: Incorrect information entered')
        end
      end
      it 'When I fill in a duration that is less than the movie duration, I see a flash message stating an error' do
        within('#view_party_form') do
          fill_in 'form_info[duration]', with: 20
          fill_in 'form_info[date]', with: '1999-07-20'
          fill_in 'form_info[time]', with: '19:30'
          check "users[#{@user2.id}]"
          click_on 'Create Viewing Party'
          expect(page.current_path).to eq new_user_movie_viewing_party_path(@user1, @movie.id)
        end
        within('.container') do
          expect(page).to have_content('Error: Incorrect information entered')
        end
      end
    end
  end
end
