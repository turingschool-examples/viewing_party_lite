require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before do
    visit registration_path
    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user@email.com'
    click_button 'Create User'

    @user = User.last
  end

 it 'displays dashboard sections' do
   expect(page).to have_content("#{@user.name}'s Dashboard")
   expect(page).to have_button("Discover Movies")
 end

 it 'has a section for viewing parties' do
   within('#viewing-parties') do
     expect(page).to have_content('Viewing Parties')
   end
 end
end
