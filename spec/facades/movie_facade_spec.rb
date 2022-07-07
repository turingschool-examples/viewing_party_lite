require 'rails_helper'

RSpec.describe MovieFacade do 
  let!(:top_rated) { MovieFacade.top_movies }

  it 'creates top rated movie poros', :vcr do
     expect(top_rated.first).to be_a(Movie)
  end 
end