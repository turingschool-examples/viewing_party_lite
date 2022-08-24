require 'rails_helper'

RSpec.describe 'Discover page' do
  context 'discover movies search' do
    xit 'goes to the search & redirects back to discover' do
      @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")

      visit user_discover_path(@user1.id)

      click_on "Find Movies"

      expect(page).to have_content("blah")
    end
  end
end