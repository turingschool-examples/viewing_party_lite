require 'rails_helper'

RSpec.describe ' MovieIndexTopResultFacade', :vcr do
  it 'makes service call and returns an ' do
    movies =  MovieIndexTopResultFacade.service

    expect(movies).to be_a(Array)
    expect(movies).to be_all(MovieIndexResult)
  end
end