require 'rails_helper'

RSpec.describe 'users discover' do
  let!(:user1) { User.create(name: 'Jeff', email: 'jeff@email.com') }
  let!(:user2) { User.create(name: 'Amy', email: 'amy@email.com') }

  before(:each) do
    visit "/users/#{user1.id}/discover"
  end

  it 'has button to user_movies index page which shows 20 top movies', :vcr do
    expect(page).to have_link('Top Movies')

    click_link 'View Top Movies'

    expect(current_path).to eq(user_movies_path(user1.id))

    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to have_content("Gabriel's Inferno: Part III")
  end

  describe 'search happy path' do
    it 'can search by keyword and return relavant video if exists' do
      dog1 = MovieDetail.new(genre: nil, id: 1, runtime: 120, summary: 'a dog movie', title: 'Wiener-Dog',
                             vote_average: 7.3)
      dog2 = MovieDetail.new(genre: nil, id: 2, runtime: 120, summary: 'a dog movie',
                             title: 'Rock Dog 2: Rock Around the Park', vote_average: 7.0)
      dog3 = MovieDetail.new(genre: nil, id: 3, runtime: 130, summary: 'a dog movie',
                             title: 'Straight Outta Nowhere: Scooby-Doo! Meets Courage the Cowardly Dog', vote_average: 7.6)
      dogs = [dog1, dog2, dog3]

      allow(MovieFacade).to receive(:search).and_return(dogs)

      fill_in :keyword, with: 'dog'
      click_button 'Search'

      expect(current_path).to eq(user_movies_path(user1.id))
      expect(page).to have_content('Straight Outta Nowhere: Scooby-Doo! Meets Courage the Cowardly Dog')
      expect(page).to have_content('Wiener-Dog')
    end
  end

  describe 'search sad path' do
    it 'returns error message if no keyword match' do
      dogggs = "No movies found containing 'doggggggg'"

      allow(MovieFacade).to receive(:search).and_return(dogggs)
      fill_in :keyword, with: 'doggggggg'
      click_button 'Search'

      expect(current_path).to eq("/users/#{user1.id}/discover")
      expect(page).to have_content("Error: No movies found containing 'doggggggg', please try again!.")
    end
  end
end
