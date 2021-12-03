require 'rails_helper'

RSpec.describe 'movies show page' do
  before do
    @user = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")

  end

  it 'has button to create viewing party' do
    VCR.use_cassette('movie_show') do
      visit user_movie_path(@user, 238)
      click_button 'Create a Viewing Party For This Movie'

      expect(current_path).to eq(new_party_path)
    end
  end

  it 'has button to create viewing party' do
    VCR.use_cassette('movie_show') do
      visit user_movie_path(@user, 238)
      click_button 'Return to Discover Page'

      expect(current_path).to eq(user_discover_index_path(@user))
    end
  end

  it 'has movie attributes' do
    VCR.use_cassette('movie_show') do
      visit user_movie_path(@user, 238)
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('8.7')
      expect(page).to have_content('2:55')
      expect(page).to have_content('Drama, Crime')
      expect(page).to have_content('Spanning the years')
      expect(page).to have_content('Marlon')
      expect(page).to have_content('futuretv')
    end
  end
end
