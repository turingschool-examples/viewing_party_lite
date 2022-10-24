require 'rails_helper'

RSpec.describe 'User Login Page' do
  describe 'As a registered user' do
    describe "When I visit the landing page " do
      it "I see a link for 'Log In', When I click on 'Log In' I'm taken to a Log In page" do
        visit root_path

        click_button "Log In"

        expect(current_path).to eq login_path
      end
    end

    describe "When I visit the login page " do
      before :each do
        @user_1 = create(:user, password: "test")
      end
      it "I'm taken to a Log In page where I can input my unique email and password. When I enter my unique email and correct password I'm taken to my dashboard page" do
        visit login_path

        fill_in 'Email', with: "#{@user_1.email}"
        fill_in 'Password', with: "#{@user_1.password}"

        click_button "Log In"

        expect(current_path).to eq(user_path(@user_1))
      end
    end
  end
end
