require 'rails_helper'

RSpec.describe 'Create Viewing Party' do
  before(:each) do
    VCR.use_cassette("testing_party_create") do
      @movie = MoviesFacade.movie_details(238)
      users = FactoryBot.create_list(:random_user, 5)

      @user_1 = users[0]
      @user_2 = users[1]
      @user_3 = users[2]
      @user_4 = users[3]
      @user_5 = users[4]
      visit new_user_movie_party_path(@user_1, @movie.id)
    end
  end
end
