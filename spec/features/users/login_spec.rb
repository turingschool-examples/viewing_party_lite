require 'rails_helper'

describe 'Login' do
  context "with a bad password" do
    it 'cannot log in with bad credentials' do
      user = create(:user)

      visit login_path

      fill_in "name", with: user.name
      fill_in "email", with: user.email
      fill_in "password", with: "incorrect password"

      click_on "log in"

      expect(current_path).to eq(login_path)

      expect(page).to have_content("Wrong password")
    end
  end
end
