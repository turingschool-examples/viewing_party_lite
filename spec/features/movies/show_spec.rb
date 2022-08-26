# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movie show page', :vcr do
  it "can show a movie's show page" do
    user_1 = User.create!(name: 'Nick', email: 'testemail1@mail.com')
    user_2 = User.create!(name: 'Mike', email: 'testemail2@mail.com')

    visit "/users/#{user_1.id}/movies/238"
    expect(page).to have_content('The Godfather')
    expect(page).to have_button('Discover Page')

    within('#details') do
      expect(page).to have_content('Vote Average: 8.7')
      expect(page).to have_content('Runtime: 2hr 55min')
      expect(page).to have_content('Genre(s): Drama Crime')
    end

    within('#summary') do
      expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.')
    end

    within('#cast') do
      expect(page).to have_content('Marlon Brando')
      expect(page).to have_content('Al Lettieri')
      expect(page).to_not have_content('Abe Vigoda')
    end

    within('#reviews') do
      expect(page).to have_content('2 Reviews')
      expect(page).to have_content('Author: crastana')
      expect(page).to have_content('The best movie ever...')
      expect(page).to have_content('Author: futuretv')
      expect(page).to have_content('The Godfather Review by Al Carlson')
    end
  end
end
