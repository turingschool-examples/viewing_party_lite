require 'rails_helper'

describe 'The movie details page' do
  before do
    @user = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')
    @movie_id = 550
    visit user_movie_path(@user,@movie_id)
  end

  it 'displays movie details for movie' do
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average 8.4')
    expect(page).to have_content('Runtime: 2 hours 19 minutes')
  end
end
