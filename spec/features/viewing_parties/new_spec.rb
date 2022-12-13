# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the new viewing parties page' do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    VCR.use_cassette('movie_details') do
      VCR.use_cassette('movie_credits') do
        VCR.use_cassette('movie_reviews') do
          @movie = MoviesFacade.get_movie_heavy(238)
        end
      end
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    VCR.use_cassette('movie_details') do
      VCR.use_cassette('movie_credits') do
        VCR.use_cassette('movie_reviews') do
          visit new_movie_viewing_party_path(@movie.id)
        end
      end
    end
  end

  describe 'layout' do
    it 'has movie title at the top of the screen' do
      expect(page).to have_content("Create a Movie Party for #{@movie.movie_title}")
    end

    it 'has a button to return to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(discover_index_path)
    end
  end

  describe 'creating a new viewing party' do
    it 'has a form to create a new viewing party' do
      within '#viewing_party_form' do
        expect(page).to have_field('Movie Title', with: @movie.movie_title)
        expect(page).to have_field('Duration of Party')
        fill_in 'Duration of Party', with: 400

        expect(page).to have_field('Start Time')
        fill_in 'Start Time', with: DateTime.now

        expect(page).to have_unchecked_field("invitees_#{@user2.id}")
        expect(page).to have_unchecked_field("invitees_#{@user3.id}")
        expect(page).to_not have_unchecked_field("invitees_#{@user1.id}")

        check "invitees_#{@user2.id}"
        check "invitees_#{@user3.id}"

        VCR.use_cassette('godfather_movie') do
          click_button 'Create Party'
        end
      end

      # expect(current_path).to eq(user_path(@user1))
    end
  end

  describe 'sad paths' do 
    it 'throws error message if datetime left blank' do 
      VCR.use_cassette('movie_details') do
        VCR.use_cassette('movie_credits') do
          VCR.use_cassette('movie_reviews') do
            click_button 'Create Party'

            expect(current_path).to eq(new_movie_viewing_party_path(@movie.id))
            expect(page).to have_content('Error: Datetime field cannot be left blank')
          end
        end
      end
    end
  end
end
