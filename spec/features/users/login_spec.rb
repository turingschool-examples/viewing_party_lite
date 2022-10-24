require 'rails_helper'

RSpec.describe 'User Login Page' do
  describe 'As a registered user' do
    describe "When I visit the landing page " do
      it "I see a link for 'Log In', When I click on 'Log In' I'm taken to a Log In page" do
        visit root_path

        click_button "Log In"

        expect(current_path).to be login_path
      end
    end
  end
end
