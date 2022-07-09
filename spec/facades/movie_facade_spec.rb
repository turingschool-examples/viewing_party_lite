require 'rails_helper'

RSpec.describe MovieFacade do
  it 'creates a TopRated poro', :vcr do
    top_rated = MovieFacade.create_top_rated

    expect(top_rated[0]).to be_an_instance_of(TopRated)
  end 
end
