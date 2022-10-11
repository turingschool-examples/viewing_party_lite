require 'rails_helper'
require 'faker'

RSpec.describe "User Show Page" do
    describe "As a user when I visit the show page" do
        it 'Has my username' do
            @alex = User.create!(user_name: "Alex", email: Faker::Internet.email , password_digest: Faker::Internet.password)
            visit user_path(@alex)

            expect(page).to have_content("Alex")
            require 'pry'; binding.pry
        end
    end
end