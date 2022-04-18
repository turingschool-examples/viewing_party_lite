# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    @user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')
    @user2 = User.create(name: 'Pat Butterman', email: 'ButterPatMan@yourmom.com')
    @movie_id = 329

    @results_movies = File.read('spec/fixtures/movie_id_jurassic.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{@movie_id}?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: @results_movies)

    @results = File.read('spec/fixtures/jurassic_park_cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/329/credits?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: @results)

    @reviews = File.read('spec/fixtures/jurassic_park_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/329/reviews?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: @reviews)
  end

  it "displays User's Dashboard at top of page" do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')

    visit "/users/#{user1.id}"

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  it 'has a button of discovery' do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')

    visit "/users/#{user1.id}"

    expect(page).to have_button('Discover Movies')
  end

  it 'has a section to list viewing parties' do
    visit "/users/#{@user1.id}/movies/#{@movie_id}/parties/new"

    fill_in :duration, with: 128
    select('2022', from: '_date_1i')
    select('March', from: '_date_2i')
    select('25', from: '_date_3i')
    select('17', from: '_start_time_4i')
    select('33', from: '_start_time_5i')
    check @user2.name.to_s
    click_button 'Create Party'
    expect(current_path).to eq("/users/#{@user1.id}")
    expect(page).to have_content("Jurrasic Park")
  end
end
