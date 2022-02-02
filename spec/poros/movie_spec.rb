require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    fight = Movie.new(data)
    expect(fight).to be_an_instance_of(Movie)
  end

  it 'has attributes' do
    fight = Movie.new(data)
    expect(fight.id).to eq(550)
    expect(fight.title).to eq("Fight Club")
    expect(fight.vote_average).to eq(8.4)
    # expect(fight.runtime).to eq(8.4)
  end
end
