require "rails_helper"

RSpec.describe MovieCast do
  it "exists with attributes" do
    data = {
      :name => 'Pickle Rick',
      :character => "Rickle Pick",
    }

    cast = MovieCast.new(data)

    expect(cast).to be_an_instance_of(MovieCast)
    expect(cast.name).to eq('Pickle Rick')
    expect(cast.character).to eq('Rickle Pick')
  end
end
