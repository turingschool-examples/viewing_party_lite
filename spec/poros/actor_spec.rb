require 'rails_helper'

RSpec.describe Actor do
   it 'has the character name and the actors name' do
      data = {
         "name": "Mickey Rourke",
         "character": "Johnny Handsome"
      }

      actor = Actor.new(data)

      expect(actor).to be_a(Actor)
      expect(actor.name).to eq("Mickey Rourke")
      expect(actor.character).to eq("Johnny Handsome")
   end
end