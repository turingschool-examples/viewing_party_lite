require 'rails_helper'

RSpec.describe "Movie's detail page" do
  before :each do
    User.delete_all
    Movie.delete_all
    
    @user_1 = create(:user)
    @user_2 = create(:user)

    # @movie_1 = Movie.create!(title: 'Harry Potter and The Chamber of Secrets', runtime: 161, genre: 'fantasy', summary: 'An ancient prophecy seems to be coming true when a mysterious presence begins stalking the corridors of a school of magic and leaving its victims paralyzed.' )

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }).
        to_return(status: 200, body: json_response, headers: {})

        @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))

    visit "/users/#{@user_1.id}/movies/#{@movie_detail.id}"
  end
  
  it 'has a button to create a viewing page' do
    expect(page).to have_button("Create a Viewing Party for the #{@movie_detail.title}")

    click_button("Create a Viewing Party for the #{@movie_detail.title}")
    expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie_detail.id}/viewing_parties/new")
  end

  it 'has a button to return to the discover page' do
    expect(page).to have_button('Discover Page')

    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it 'should display the movie title' do
    expect(page).to have_content("#{@movie_detail.title}")
  end
end