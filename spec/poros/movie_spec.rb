require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @data = {
      original_title: "Batman",
      vote_average: 8.8,
      id: 278
    }
  end
  it 'has attributes', :vcr do

    mov_details = Movie.new(@data)
    expect(mov_details).to be_an_instance_of(Movie)
    expect(mov_details.title).to eq('Batman')
    expect(mov_details.vote_average).to eq(8.8)
    expect(mov_details.id).to eq(278)
  end
end
