require 'rails_helper'

RSpec.describe MovieActor do
  before :each do
   data = {
    "adult": false,
    "gender": 2,
    "id": 7664,
    "known_for_department": "Acting",
    "name": "Joseph Cotten",
    "original_name": "Joseph Cotten",
    "popularity": 11.292,
    "profile_path": "/djfCB0jPOgmq3w7RD3BMLzWsAu8.jpg",
    "cast_id": 4,
    "character": "Jedediah Leland",
    "credit_id": "52fe420ec3a36847f800088f",
    "order": 1
   }

   @actor = MovieActor.new(data) 
  end

  it 'exists and has attributes' do
    expect(@actor.name).to eq("Joseph Cotten")
    expect(@actor.popularity).to eq(11.292)
    expect(@actor.character).to eq("Jedediah Leland")
  end
end