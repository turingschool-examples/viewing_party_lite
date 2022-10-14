require 'rails_helper'

RSpec.describe 'New Viewing Party' do

  it 'has a form that can create a new viewing party', :vcr do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)
    movie = MoviesFacade.get_movie(393404)

    visit new_user_movie_viewing_party_path(user_1, movie.id)

    expect(page).to have_content("Create a Movie Party for #{movie.title}")
    expect(page).to have_content(movie.title)

    expect(page).to have_content(user_2.name)
    expect(page).to have_content(user_3.name)
    
    fill_in :viewing_party_duration, with: 200
    fill_in :viewing_party_date, with: "2022-10-12"
    fill_in :viewing_party_start_time, with: "13:33:33"

    check "#{user_2.name}"
    click_button 'Create Party'

    expect(current_path).to eq(user_path(user_1.id))
  end
end