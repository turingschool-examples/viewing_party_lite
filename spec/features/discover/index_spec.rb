require 'rails_helper'

RSpec.describe 'discover movies page' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')  
  end

  it 'has a button discover top rated movies that leads to top 20 rated movies' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}")
        .to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'))

    visit user_discover_index_path(@user1)

    expect(page).to have_link('Find Top Rated Movies', href: "/users/#{@user1.id}/movies?q=top%20rated")

    click_link 'Find Top Rated Movies'
    expect(current_path).to eq(user_movies_path(@user1))
  end
  
  it 'has a search field to find movies by title' do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&include_adult=false&query=The%20Matrix")
       .to_return(status: 200, body: File.read('spec/fixtures/search_for_the_matrix.json'))


    visit user_discover_index_path(@user1)

    fill_in('q', with: 'The Matrix')
    click_on('Find Movies')

    expect(current_path).to eq(user_movies_path(@user1))
  end
end
