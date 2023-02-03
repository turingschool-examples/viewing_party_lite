require 'rails_helper'

RSpec.describe 'New and show viewing party page' do
  before(:each) do
    @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
    @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
    @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

    @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22', host: @user_2.id)
    @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46', host: @user_1.id)

    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)

    @viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)
    @viewing_party_user_4 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_2.id)

    @movie = MoviesFascade.find(238)

    # visit new_user_movie_viewing_party_path(@user_1)
    visit "/users/#{@user_1.id}/movies/#{@movie.movie_id}/viewing_parties/new"
    # /users/:user_id/movies/:movie_id/viewing_parties/new(.:format)
  end

  it 'displays name of movie title rendered above a form' do
    expect(page).to have_content(@movie.title)
    expect(page).to_not have_content(@user_1.name)
    expect(page).to have_field('Duration', with: @movie.runtime)
    expect(page).to have_content('Date')
    expect(page).to have_content('Time')
    page.check('Christian')
    expect(page).to have_field('Christian', checked: true)
    click_on 'Create Viewing Party'
    expect(page).to have_content('Duration')
    expect(page).to have_content('Start time')
    expect(page).to have_content(@user_1.name)
    visit "/users/#{@user_2.id}"
    expect(page).to have_content('The Godfather')
  end
end
