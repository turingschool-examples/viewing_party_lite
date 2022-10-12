# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Movie Show Page' do
  describe 'As a user when I visit the movie show page' do
    before :each do
      # allow_any_instance_of(Movie).to receive(:find) {}
    end

    xit 'has a header for the movie title' do
      @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
                           password_digest: Faker::Internet.password)

      @inglorious_bastards = double(id: 1, title: 'Inglorious Bastards')

      movie_data = ''

      allow(Movie).to receive(:new).with(movie_data).and_return(@inglorious_bastards)

      visit user_movie_path(@alex, @inglorious_bastards.id)

      expect(page).to have_content('Inglorious Bastards')
    end
  end
end
