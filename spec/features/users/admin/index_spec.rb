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

  describe 'As a visitor or a default user' do
    describe 'If I try to go to any admin routes I am redirected to the landing page' do
      it 'does not allow admin access to visitors or default users' do
        user = create(:user)

        visit login_path

        fill_in 'Email', with: "#{user.email}"
        fill_in 'Password', with: "#{user.password}"

        click_button 'Log In'

        visit admin_dashboard_path

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You are not authorized to view this page")

        visit admin_path(user)

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You are not authorized to view this page")
      end
    end
  end
end
# As a visitor or default user 
# If I try to go to any admin routes ('/admin/dashboard' or '/admin/users/:id')
# I get redirected to the landing page
# And I see a message pop up telling me I'm not authorized to access those pages. 