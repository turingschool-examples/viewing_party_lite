require 'rails_helper'

RSpec.describe "user dashboard" do
  let(:user) { create :user }

  describe 'when I visit a user dashboard' do
    before { visit user_path(user) }

    it 'displays a title' do
      expect(page).to have_content("#{user.name}'s Dashboard")
    end
  end
#   When I visit '/users/:id' where :id is a valid user id,
# I should see:

#  "<user's name>'s Dashboard" at the top of the page

#  A button to Discover Movies*

#  A section that lists viewing parties**
end