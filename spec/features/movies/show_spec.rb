require 'rails_helper'

RSpec.describe 'movie show page' do
  it 'has a button to create a viewing party' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")
    movie_id = 329

    results = File.read('spec/fixtures/movie_id_jurassic.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}").
    to_return(status: 200, body: results)

    visit "users/#{user1.id}/movies/#{movie_id}"

    expect(page).to have_button("Create Viewing Party")

    click_button("Create Viewing Party")

    expect(current_path).to eq("/users/#{user1.id}/movies/#{movie_id}/parties/new")
  end

  xit 'has a button to return to Discover page' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")
    movie_id = 329

    visit "users/#{user1.id}/movies/#{movie_id}"

    expect(page).to have_button("Discover Page")

    click_button("Discover Page")
  end
end
