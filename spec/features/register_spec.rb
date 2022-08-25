require 'rails_helper'

RSpec.describe 'Register Page' do
  it "has a form to fill out the name and email" do
    ben = User.create!(name: "Ben", email: "benjsdev@gmail.com")
    brian = User.create!(name: "Brian", email: "bshearsdev@gmail.com")
    drew = User.create!(name: "Drew", email: "dmacdev@gmail.com")

    visit "/register"

    fill_in "Name", with: "Brad"
    fill_in "Email", with: "bhopkodev@gmail.com"

    click_on "Submit"

    brad = User.last

    expect(current_path).to eq("/users/#{brad.id}")

    visit root_path

    expect(page).to have_content("bhopkodev@gmail.com")
  end
end
