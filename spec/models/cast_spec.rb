require 'rails_helper'

describe Cast do
  it 'exists' do
    cast = Cast.new({:name => "Tim Robbins", :character => "Andy Dufresne"})
    expect(cast).to be_an_instance_of(Cast)
  end

  it 'attributes' do
    cast = Cast.new({:name => "Tim Robbins", :character => "Andy Dufresne"})
    expect(cast.name).to eq("Tim Robbins")
    expect(cast.character).to eq("Andy Dufresne")
  end
end
