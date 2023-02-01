require 'rails_helper'

RSpec.describe 'The User Discover Movie page', type: :feature do
  describe 'forms' do
    describe "Top Movies" do
      it 'has button Discover Top Movies' do
        expect(page).to have_button "Discover Top Movies"
      end

      it 'the button routes to the movies results page' do
        click_button "Discover Top Movies"

        expect(current_path).to eq movies_user_page 
      end
    end

    describe 'Title Search' do
      it 'has a text field to search by title' do
        expect(page).to have_field "Title Search"
      end

      it 'routes to the movie results page' do
        fill_in "Title Search", with: "Test"

        click_button "Search"

        expect(current_path).to eq movies_user_page
      end
    end
  end
end
