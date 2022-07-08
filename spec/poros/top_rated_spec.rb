require 'rails_helper'

RSpec.describe TopRated do
  it 'exists with attributes' do
    godfather = TopRated.new({title: "The Godfather", vote_average: 7.9, id: 8})
    expect(godfather).to be_an_instance_of(TopRated)
    expect(godfather.title).to eq("The Godfather")
    expect(godfather.vote_average).to eq(7.9)
    expect(godfather.id).to eq(8)
  end
end
