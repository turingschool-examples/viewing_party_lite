require 'rails_helper'

RSpec.describe Cast do
  it 'exists and contains attributes' do
    @cast_member = Cast.new({name: "Arnold Swarzenegger", character: "Winston Churchill"})
    expect(@cast_member.name).to eq("Arnold Swarzenegger")
    expect(@cast_member.character).to eq("Winston Churchill")
    expect(@cast_member).to be_instance_of(Cast)
  end
end
