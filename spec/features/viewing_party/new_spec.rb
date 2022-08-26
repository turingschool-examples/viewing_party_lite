require 'rails_helper'

RSpec.describe 'New Viewing Party Page', type: :feature do
   it 'has name of the movie title rendered above a new viewing party form' do
      user1 = User.create!(name: 'Nancy Drew', email: 'nancydrew@gmail.com')
      user2 = User.create!(name: 'Jenny', email: 'jennyfromtheblock@email.com')
      user3 = User.create!(name: 'Sherlock Holmes', email: '221bbaker@email.com')
      user4 = User.create!(name: 'Jelly Bean', email: 'jellybean123@email.com')

      visit new_user_viewing_party_path(user1.id, 505)

      expect(page).to have_content('Johnny Handsome')

      fill_in 'Duration of Party', with: 90
      fill_in 'Date', with: "12/30/2022"
      fill_in 'Start Time', with: "07:00 PM"

      click_button 'Create Party'

      expect(current_path).to eq(user_path(user1.id))
   end
end
