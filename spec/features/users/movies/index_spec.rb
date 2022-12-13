require 'rails_helper'

RSpec.describe 'movies results page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')


    json_response = File.read('spec/fixtures/top_rated_movies.json')

    details_response = File.read('spec/fixtures/shawshank_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: details_response)

    credits_response = File.read('spec/fixtures/shawshank_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/credits?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: credits_response)

    reviews_response = File.read('spec/fixtures/shawshank_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/reviews?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: reviews_response)

    visit(user_movies_path(@user1.id, 278))
  end

  it 'displays the titles and vote average of the top 20 movies' do

    expect(page).to have_content("20th Century Girl")
    expect(page).to have_content("Vote Average: 8.7")

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote Average: 8.7")

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
  end

  it 'can search for movies by title from the discover movies page' do
    visit(user_discover_index_path(@user1.id))

    # json_response = File.read('spec/fixtures/search_movies.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=a9f28a7ce46d86cfac371bf3b2883ad5&query=Test").
    #   to_return(status: 200, body: json_response)

    expect(page).to have_field(:title)
    expect(page).to have_button("Search")

    fill_in "Search by Title:", with: "Test"
    click_button "Search"

    expect(page).to have_content("El test")
    expect(page).to have_content("Vote Average: 6.7")

    expect(page).to have_content("The Beta Test")
    expect(page).to have_content("Vote Average: 6.3")

    expect(page).to have_content("Test")
    expect(page).to have_content("Vote Average: 6.6")
  end

  it 'contains a button to return to the discover page' do
    expect(page).to have_button("Return to Discover Page")
    click_button "Return to Discover Page"
    expect(current_path).to eq(user_discover_index_path(@user1.id))
  end

  it 'has a link to each movies show page as the title' do
    # visit(user_movies_path(@user1.id))

    # json_response = File.read('spec/fixtures/search_movies.json')
    # stub_request(:get, ("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}")).
    #   to_return(status: 200, body: json_response)

    # details_response = File.read('spec/fixtures/shawshank_details.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV["movie_api_key"]}").
    #   to_return(status: 200, body: details_response)

    # credits_response = File.read('spec/fixtures/shawshank_credits.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/278/credits?api_key=#{ENV["movie_api_key"]}").
    #   to_return(status: 200, body: credits_response)

    # reviews_response = File.read('spec/fixtures/shawshank_reviews.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/278/reviews?api_key=#{ENV["movie_api_key"]}").
    #   to_return(status: 200, body: reviews_response)

    expect(page).to have_link("The Shawshank Redemption")
    click_link "The Shawshank Redemption"
    expect(current_path).to eq(user_movie_path(@user1.id, 278))
  end
end
