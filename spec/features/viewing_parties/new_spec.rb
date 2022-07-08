require 'rails_helper' 

RSpec.describe 'new viewing party page' do
  before :each do
    @user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)
    attributes2 = JSON.parse(File.read('./spec/fixtures/lock_stock_movie_details.json'), symbolize_names: true)

    @movie = Movie.new(attributes)
    @movie2 = Movie.new(attributes2)
    visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing_party/new"
    save_and_open_page
  end
  it 'has movie title and link to discover page' do
    expect(page).to have_content("Create a Viewing Party for #{@movie.title}")
    expect(page).to_not have_content("Create a Viewing Party for #{@movie2.title}")
    expect(page).to have_button("Discover Page")
    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end