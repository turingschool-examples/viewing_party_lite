require 'rails_helper'

RSpec.describe 'landing page' do
  describe '#index' do
    it 'displays the title of the application' do
      user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')
      user_2 = User.create!(name: 'David Smith', email: 'daves@gmail.com')
      user_3 = User.create!(name: 'Mary Jones', email: 'cidlou@gmail.com')

      visit '/'
      save_and_open_page
      expect(page).to have_content('Viewing Party Lite')
    end
  end
end