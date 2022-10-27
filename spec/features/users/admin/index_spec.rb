# When I log in as an admin user
# I'm taken to my admin dashboard `/admin/dashboard`
# I see a list of all default user's email addresses
# When I click on a default user's email address
# I'm taken to the admin users dashboard. `/admin/users/:id`
# Where I see the same dashboard that particular user would see
require 'rails_helper'

RSpec.describe 'the admin dashboard' do
  describe 'When I log in as an admin user' do
    describe 'I am taken to /admin/dashboard and I see all users email addresses' do
      it 'displays all user email addresses as a link to /admin/users/:id' do
        user = User.create!(name: 'Ezra', email: 'ezra@gmail.com', password: 'password', role: 2)
        users = create_list(:user, 10)
        user_1 = users.first

        visit login_path

        fill_in 'Email', with: "#{user.email}"
        fill_in 'Password', with: "#{user.password}"

        click_button 'Log In'

        expect(current_path).to eq('/admin/dashboard')

        users.each do |user|
          expect(page).to have_link(user.email)
        end
        
        click_link "#{user_1.email}"

        expect(current_path).to eq("/admin/users/#{user_1.id}")
      end
    end
  end
end