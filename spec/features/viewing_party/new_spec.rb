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
    describe 'I can see a form with;' do
      it 'a populated duration that is the minimum time for the movie' do
        within('#view_party_form') do
          expect(page).to have_field('duration')
          expect(find('#duration')['placeholder']).to eq @movie.runtime.to_s
        end
      end
      it 'When: field to select date' do
        within('#view_party_form') { expect(page).to have_field('date') }
      end
      it 'Start Time: field to select time' do
        within('#view_party_form') { expect(page).to have_field('time') }
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
      it 'When I fill in the information in the form correctly, I am redirected to my dashboard'
      it 'I see the newly made viewing party in my dashboard'
    end
    context 'Sad Path' do
      it 'When I fill in the information in the form incorrectly, I see a flash message stating an error'
    end
  end
end
