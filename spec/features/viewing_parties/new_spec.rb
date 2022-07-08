# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before :each do
    @user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    @user2 = User.create!(name: 'Judy Garland', email: 'jgarland@gmail.com')
    @user3 = User.create!(name: 'Fred Astaire', email: 'tapshoes@gmail.com')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)
    attributes2 = JSON.parse(File.read('./spec/fixtures/lock_stock_movie_details.json'), symbolize_names: true)

    @movie = Movie.new(attributes)
    @movie2 = Movie.new(attributes2)

    # save_and_open_page
  end
  it 'has movie title and link to discover page', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing_party/new"

    expect(page).to have_content("Create a Viewing Party for #{@movie.title}")
    expect(page).to_not have_content("Create a Viewing Party for #{@movie2.title}")
    expect(page).to have_button('Discover Page')
    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
  it 'has form with default values for duration, day, start time, and a section to invite others', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing_party/new"

    expect(page).to have_content('Movie Title')
    expect(find_field('Duration').value).to eq(@movie.runtime_mins.to_s)
    expect(page).to have_content('Date')
    expect(find_field('Date').value).to eq(Date.today.strftime('%Y-%m-%d'))
    expect(find_field('Start time').value).to eq('19:00:00')

    fill_in 'Duration', with: 200
    fill_in 'Date', with: '08/08/2022'
    fill_in 'Start time', with: '20:00:00'

    expect(page).to have_content('Invite Other Users')

    expect(page).to have_field("viewing_party_#{@user1.id}")
    expect(page).to have_field("viewing_party_#{@user2.id}")
    expect(page).to have_field("viewing_party_#{@user3.id}")
    check("viewing_party_#{@user1.id}")
    check("viewing_party_#{@user2.id}")

    click_button 'Create Party'
    expect(current_path).to eq("/users/#{@user1.id}")
    # expect(page).to have_content(@movie.title)
    # expect(page).to have_content("Hosting")
  end
end
