require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before(:each) do
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/movie_details_godfather238.json'), headers: {})

      @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
      @user2 = User.create!(name: 'John Smith', email: 'johndoe@gmail.com')
      @user3 = User.create!(name: 'John Williams', email: 'johndoe@email.com')
      @user4 = User.create!(name: 'John Kennedy', email: 'johndoe@webmail.com')
      @user5 = User.create!(name: 'John Deere', email: 'johndoe@mail.com')
      @movie = MovieFacade.movie_details(238)
  end

  it 'displays the movie title for the new viewing party' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)

    expect(page).to have_content("Create a Movie Party for The Godfather")
  end
  
  it 'has a link back to the discover page' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)

    expect(page).to have_link('Discover Page', href: user_discover_index_path(@user1))
  end

  it 'has a form to enter details for user party and duration defaults to movies runtime' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)
    users = [@user2, @user3, @user4, @user5]
    
    within '#party-details' do
      expect(page).to have_content("The Godfather")
      expect(page).to have_field('Duration of Party', with: @movie.runtime)
      expect(page).to have_field('Day')
      expect(page).to have_field('Start Time')
      expect(page).to have_button('Create Party')
      users.each do |user|
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.email)
      end
      expect(page).to_not have_content(@user1.name)
    end
  end

end
