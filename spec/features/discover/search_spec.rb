require 'rails_helper'
require 'faker'

RSpec.describe "Discover Movies Page" do
    describe "As a user when I visit the discover movies page" do
        it 'has a Discover Movies header' do
            @alex = User.create!(user_name: "Alex", email: Faker::Internet.email , password_digest: Faker::Internet.password)
            visit user_discover_path(@alex)

            expect(page).to have_content("Discover Movies")
        end
    end
end
