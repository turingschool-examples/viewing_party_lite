require 'rails_helper'

RSpec.describe "the User Show page aka the user's dashboard" do 
  describe "when a user visits '/users/:id' where id is a valid user id" do 
    it "shows '<user name>'s Dashboard', a Discover Movies button, and a list of that user's viewing parties" do 
      user = User.create!(name: 'Amanda', email: 'amanda@turing.ed')
      visit user_path(user)

      expect(page).to have_content("Amanda's Dashboard")
    end
  end
end