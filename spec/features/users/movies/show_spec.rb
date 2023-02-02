require 'rails_helper'

RSpec.describe 'The Movie Details (Show) Page', type: :feature do
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  
  describe 'the page basics' do
    xit 'has a button to return to Discover Page' do
      visit user_movie_path(user1, movie1)
    end

    xit 'has a button to create a viewing party' do
    end
  end
end