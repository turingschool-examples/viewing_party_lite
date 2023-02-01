# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user movie show spec', type: :feature do
  let!(:u1) { create(:user) }
  let!(:m1) do
    movie_data = {
      title: 'Test',
      vote_average: 8.5,
      runtime: 120,
      genres: [{ name: 'Horror' }, { name: 'Science-Fiction' }],
      overview: 'This is a summary of our test movie.'
    }
    Movie.new(movie_data)
  end

  describe 'as a user, when I visit a movies detail page, it' do
    it 'has a button to create a viewing party' do
      WebMock.allow_net_connect!
      visit user_movie_path(u1, 348, type: 'show', path: '/3/movie/348')
      binding.pry
    end
    it 'has a button to return to the discover page'
    it 'displays details about the appropriate movie'
  end
end
