require 'rails_helper'

describe 'Admin login' do
  describe 'happy path' do
    xit 'I can log in as an admin and get my dashboard' do
      admin = User.create(name: 'foo bar', email: "email@email.com", password: "test", role: 2)

      visit login_path

      fill_in "name",	with: admin.name
      fill_in "email",	with: admin.email
      fill_in "password",	with: admin.password
      click_button 'log in'

      expect(current_path).to eq(admin_dashboard_path)
    end
  end

  describe 'as default user' do
    xit 'does not allow defaul user to see admin dashboard index' do
      user = User.create(name: 'foo bar user', email: 'notadmin@email.com', password: 'test', role: 0)

      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      allow(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/dashboard"

      expect(page).to have_content("The page you were looking for doesn't exist")
    end

  end
end