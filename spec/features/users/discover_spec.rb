require 'rails_helper'

RSpec.describe 'Discover page' do
  context 'discover movies search' do
    it 'goes to the search & redirects back to discover' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")

      curr_path = "/users/#{@user1.id}/movies?utf8=%E2%9C%93&search=something&commit=Find+Movies"

      visit user_discover_path(@user1.id)

      fill_in "Search", with: "something"

      click_on "Find Movies"

      expect(page).to have_current_path(curr_path)
      expect(page).to have_content("Something Borrowed")
    end
  end
end