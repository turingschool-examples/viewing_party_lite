# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Show Page', type: :feature do # rubocop:disable Metrics/BlockLength
  let!(:user_1) { create(:user) }
  before(:each) do
    @movie = Movie.new({id: 550, title: "Fight Club"})
    visit user_movie_path(user_1, @movie.id)
  end

  describe 'When I visit the user movie path' do
    it 'I see a button to return to the "Discover Page"' do
    end

    xit "I see a button to 'Create Viewing Party for Fight Club'" do
    end

    describe "I see the Movie..." do
      it 'Title, Vote Average, Runtime, and Genres'
      it 'Summery'
      it 'Top 10 cast members'
      it 'Count of reviews'
      it 'Each reviews author and info'
    end
  end
end
