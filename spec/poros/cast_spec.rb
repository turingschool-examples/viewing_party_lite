require 'rails_helper'
require './app/poros/cast'

RSpec.describe Cast do
  it 'builds a cast object when data is passed in' do
    data = {
      name: "That Actor",
      character: "The Narrator",
    }
    @member = Cast.new(data)

    expect(@member).to be_an_instance_of(Cast)
    expect(@member.name).to eq("That Actor")
    expect(@member.character).to eq("The Narrator")
  end
end
