require 'rails_helper'

RSpec.describe MovieResult do
  it 'exists with attributes' do
    godfather = MovieResult.new({title: "The Godfather", vote_average: 7.9, id: 8})
    expect(godfather).to be_an_instance_of(MovieResult)
    expect(godfather.title).to eq("The Godfather")
    expect(godfather.vote_average).to eq(7.9)
    expect(godfather.id).to eq(8)
  end
end
