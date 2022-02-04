require 'rails_helper'

RSpec.describe Cast do
  it 'exists' do
      attributes = {
        name: "Rodger Dodger",
        character: "Batman"
      }

      cast = Cast.new(attributes)

      expect(cast).to be_an_instance_of(Cast)
      expect(cast.name).to eq("Rodger Dodger")
      expect(cast.character).to eq("Batman")
  end
end
