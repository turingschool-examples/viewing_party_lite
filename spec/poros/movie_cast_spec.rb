require 'rails_helper'

RSpec.describe MovieCast do
  it 'exists' do
    attributes = {
      name: "Marlon Brando",
      character: "Don Vito Corleone"
    }
    
    actor = MovieCast.new(attributes)
    expect(actor).to be_instance_of(MovieCast)
    expect(actor.name).to eq("Marlon Brando")
    expect(actor.character).to eq("Don Vito Corleone")
  end
end