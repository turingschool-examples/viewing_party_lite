require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do

  describe 'As a Visitor' do 

    it 'the discover movies button takes me to the discover movies page' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')

      visit "/users/#{skeeter.id}"
      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{skeeter.id}/discover")
    end 

  end 

end 