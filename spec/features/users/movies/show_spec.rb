require 'rails_helper'

RSpec.describe 'Move detail page' do
  before(:each) do
    user = User.create!(name: 'Chris', email: 'chris@gmail.com')
    visit "/users/#{user.id}/movie/862"
  end
  # When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
  # I should see
  #
  #  Button to create a viewing party
  #  Button to return to the Discover Page
  # Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
  #
  it 'has a button to create a viewing party and to return to the discover page' do
    click_button 'Create Viewing Party'
    expect(current_path).to eq("/users/#{user.id}/movies/862/viewing-party/new")
    click_button 'Discover Page'
    expec(current_path).to eq("/users/#{user.id}/discover")
  end

  # And I should see the following information about the movie:
  #
  #  Movie Title x
  #  Vote Average of the movie x
  #  Runtime in hours & minutes x
  #  Genre(s) associated to movie x
  #  Summary description x
  #  List the first 10 cast members (characters&actress/actors) x
  #  Count of total reviews x
  #  Each review's author and information  x
  # Details: This information should come from 3 different endpoints x
  it 'viewing party page displays movie details' do
    click_button 'Create Viewing Party'
    expect(current_path).to eq("/users/#{user.id}/movies/862/viewing-party/new")
    expect(page).to have_content('Toy Story')
    expect(page).to have_content('Vote Average: 8.0')
    expect(page).to have_content('Runtime: 1 hour and 21 minutes')
    expect(page).to have_content('Animation')
    expect(page).to have_content('Adventure')
    expect(page).to have_content('Family')
    expect(page).to have_content('Comedy')
    expect(page).to have_content("Led by Woody, Andy's toys live happily in his room until Andy's birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy's heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.")
    # new endpoint, /credits
    expect(page).to have_content('Tom Hanks')
    expect(page).to have_content('Woody')
    expect(page).to have_content('Tim Allen')
    expect(page).to have_content('Buzz Lightyear')
    expect(page).to have_content('Don Rickles')
    expect(page).to have_content('Mr. Potato Head')
    expect(page).to have_content('Jim Varney')
    expect(page).to have_content('Slinky Dog')
    expect(page).to have_content('Wallace Shawn')
    expect(page).to have_content('Rex')
    expect(page).to have_content('John Ratzenberger')
    expect(page).to have_content('Hamm')
    expect(page).to have_content('Annie Potts')
    expect(page).to have_content('Bo Peep')
    expect(page).to have_content('Andy')
    expect(page).to have_content('Erik von Detten')
    expect(page).to have_content('Sid')
    expect(page).to have_content('Laurie Metcalf')
    expect(page).to have_content('Mrs. Davis')
    # new endpoint, /reviews
    expect(page).to have_content('Total Reviews: 3')
    expect(page).to have_content('Gimly')
    expect(page).to have_content('Ruuz')
    expect(page).to have_content('Rating: 8.0')
    expect(page).to have_content('JPV852')
    expect(page).to have_content('Rating: 9.0')
    expect(page).to have_content('r96sk')
    expect(page).to have_content('Rating: 10.0')
  end
end
