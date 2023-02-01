# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user movie show spec', type: :feature do
  let!(:u1) { create(:user) }

  describe 'as a user, when I visit a movies detail page, it' do
    before :each do 
      WebMock.allow_net_connect!
      visit user_movie_path(u1, 348, type: 'show', path: '/3/movie/348')
    end

    it 'has a button to create a viewing party' do
      expect(page).to have_button('Create Viewing Party For Alien')
    end

    it 'has a button to return to the discover page' do
      expect(page).to have_button('Discover Movies')
      click_button 'Discover Movies'
      expect(current_path).to eq discover_user_path(u1)
    end

    it 'displays details about the appropriate movie' do
      expect(page).to have_content('Alien')
      expect(page).to have_content('Vote: 8.1')
      expect(page).to have_content('Runtime: 1hr 57min')
      expect(page).to have_content('Genre: Horror, Science Fiction')
      within('#summary') do
        expect(page).to have_content('Summary')
        expect(page).to have_content("During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.")
      end
      within('#cast') do
        expect(page).to have_content('Cast')
        # todo
      end
      within('#reviews') do
        expect(page).to have_content("#{8} Reviews")
        # todo
      end
    end
  end
end
