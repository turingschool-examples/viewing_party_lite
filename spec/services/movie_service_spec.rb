require 'rails_helper'

RSpec.describe 'MovieService' do
  xit 'returns movie data json', :vcr do
    search = MovieService.movie_results('castaway')
  end
end