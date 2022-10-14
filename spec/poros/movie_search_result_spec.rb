require 'rails_helper'

RSpec.describe MovieSearchResult do

  before :each do
    @result = JSON.parse(file_fixture("search_result.json").read, symbolize_names: true)
  end
  it 'exists' do 
    sunshine = MovieSearchResult.new(@result)

    expect(sunshine).to be_instance_of MovieSearchResult
  end

  it 'has attributes' do
    sunshine = MovieSearchResult.new(@result)

    expect(sunshine.title).to eq("Sunshine")
    expect(sunshine.id).to eq(1272)
    expect(sunshine.vote_average).to eq(7.0)
  end

end