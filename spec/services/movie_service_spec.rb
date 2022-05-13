require 'rails_helper'

RSpec.describe MovieService do
  it 'makes an API call' do
    MovieFacade.top_rated_movies
  end
end
