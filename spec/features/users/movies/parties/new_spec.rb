require 'rails_helper'

RSpec.describe 'parties/new' do
  before :each do
    @user = User.create(name: 'Sunny', email: 'sunny@email.com')
  end
  it 'shows the name of the movie at the top', vcr: 'viewing_party' do
    movie = MovieFacade.find(550)
    visit new_user_movie_party_path(@user.id, movie.id)

    expect(page).to have_content('Fight Club')
  end
  it 'has a duration field that autopopulates with movie runtime in minutes', vcr: 'viewing_party' do
    movie = MovieFacade.find(550)
    visit new_user_movie_party_path(@user.id, movie.id)
    expect(page).to have_field('Party Duration', with: 139)
  end
  it 'has a date and time fields', vcr: 'viewing_party' do
    movie = MovieFacade.find(550)
    visit new_user_movie_party_path(@user.id, movie.id)
    save_and_open_page
    expect(page).to have_select('_start_time_3i', with_selected: Time.now.day.to_s)
  end
end
