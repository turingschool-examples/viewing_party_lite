# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @user = User.create!(name: 'Bob', email: 'bob@yahoo.com')
  end
  it 'will show a movies duration', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('1 hour(s) and 29 minute(s)')
  end
  it 'will show a movies rating', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('7.9')
  end
  it 'will show a movies summary', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('Gordie, Chris, Teddy and Vern are four friends who decide to hike to find the corpse of Ray Brower, a local teenager, who was hit by a train while plucking blueberries in the wild.')
  end
  it 'will show a count of reviews', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('Review Count: 1')
  end
  it 'will show a reviews author', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('Joe')
  end
  it 'will show a reviews content', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content("My all-time favourite movie! Like Gordie, I was a shy, sensitive boy, who was (and am) a writer, and I've been told by so many people I have a talent for it. Also, I've had many friends like Chris, being tough on the outside, while sweet on the inside, and I've known people like Vern, Teddy and Denny too :) Beautiful music, acting and truth about growing up, as relevant today as it was in the 80s/50s :) <3")
  end
  it 'will show cast members', :vcr do
    visit(user_movie_path(@user, 235))
    expect(page).to have_content('Wil Wheaton as Gordie Lachance')
    expect(page).to have_content('River Phoenix as Chris Chambers')
    expect(page).to have_content('Corey Feldman as Teddy Duchamp')
  end
end
