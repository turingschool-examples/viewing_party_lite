require 'rails_helper'

RSpec.describe MovieService do
  it 'makes an API call' do
    result = MovieService.top_rated_movies

    poro_factory = MovieService.top_rated_movies_list

  end
end
