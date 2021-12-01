require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before do
    visit register_path
    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user@email.com'
    click_button 'Create User'

    @user = User.last
  end

 it 'displays dashboard sections' do
   expect(page).to have_content("#{@user.name}'s Dashboard")
   click_button "Discover Movies"
   expect(current_path).to eq(user_discover_index_path(@user))
 end

 it 'has a section for viewing parties' do
   within('#viewing-parties') do
     expect(page).to have_content('Viewing Parties')
   end
 end
end
