require 'rails_helper'

RSpec.describe MovieService do
  it "can find popular movies" do
    require "pry"; binding.pry
  expect(MovieService.popular_movies).to eq(Hash)

  end
end
