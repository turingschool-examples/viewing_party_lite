require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    # @user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")
    @user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com", password: "124", password_confirmation: "124")

    @movie_id = 329

    @results_movies = File.read('spec/fixtures/movie_id_jurassic.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{@movie_id}?api_key=#{ENV['movie_api_key']}").
    to_return(status: 200, body: @results_movies)

    @results = File.read('spec/fixtures/jurassic_park_cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/329/credits?api_key=#{ENV['movie_api_key']}").
    to_return(status: 200, body: @results)

    @reviews = File.read('spec/fixtures/jurassic_park_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/329/reviews?api_key=#{ENV['movie_api_key']}").
    to_return(status: 200, body: @reviews)
  end

  it 'has a button to create a viewing party' do
    visit "users/#{@user1.id}/movies/#{@movie_id}"

    expect(page).to have_button("Create Viewing Party")

    click_button("Create Viewing Party")

    expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie_id}/parties/new")
  end

  it 'has a button to return to Discover page' do
    visit "users/#{@user1.id}/movies/#{@movie_id}"

    expect(page).to have_button("Discover Page")

    click_button("Discover Page")

    expect(current_path).to eq(user_discover_index_path(@user1))
  end

  it 'shows movie info from base movie endpoint' do
    visit "users/#{@user1.id}/movies/#{@movie_id}"

    summary = "A wealthy entrepreneur secretly creates a theme park featuring living dinosaurs drawn from prehistoric DNA. Before opening day, he invites a team of experts and his two eager grandchildren to experience the park and help calm anxious investors. However, the park is anything but amusing as the security systems go off-line and the dinosaurs escape."
    genres = "Adventure Science Fiction"

    expect(page).to have_content("Jurassic Park")
    expect(page).to have_content(7.9)
    expect(page).to have_content("2hr 7min")
    expect(page).to have_content(summary)
    expect(page).to have_content(genres)
  end

  it 'shows cast info from movie cast endpoint' do
    visit "users/#{@user1.id}/movies/#{@movie_id}"

    expect(page).to have_content("Jeff Goldblum as Dr. Ian Malcolm")
    expect(page).to have_content("Samuel L. Jackson as Arnold")
    expect(page).to_not have_content("Wayne Knight as Dennis Nedry") #womp womp
  end

  it 'shows a count of reviews with author name and info' do
    visit "users/#{@user1.id}/movies/#{@movie_id}"
    review1 = "If you somehow missed this movie and have never seen it then watch it immediately. As a young boy of 9 on my way to the cinema I wasn't at all prepared for the on-screen awesomeness I was about to witness, one of the defining movies of my childhood and of the modern age. With special effects that simply blew any and all previous dino movies out of the water, compelling story and the odd comic moment such as the Mr Arnolds arm it really did make that evening something I will remember forever. So successful it went on to spawn 3 sequels, the second was enjoyable, the third not so much. The newest Chris Pratt one, I'll leave that for you but its worth a watch, especially if you want to wash the taste of the 3rd one out of your mouth. It gave me nightmares for weeks, really really wonderful nightmares."

    within("#reviews") do
      expect(page).to have_content("Rob")
      expect(page).to have_content(review1)
    end
  end
end
