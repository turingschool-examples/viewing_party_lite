require 'rails_helper'

RSpec.describe "New Viewing Party", type: :feature do
  it 'has a form to create new party', :vcr do

    user = User.create!(name: "Tim", email: "Tim@mail.com")
    user2 = User.create!(name: "Tom", email: "Tom@mail.com")
    visit "/users/#{user.id}/movies/278/viewing_party/new"

    fill_in "duration", with: 200
    fill_in "date", with: "2023/01/01"
    fill_in "time", with: Time.now.strftime("%I:%M:%S")

    within "#check_box-Tom" do
      page.check("users[]")#all check boxes have the same name
    end
      click_button "submit"

    expect(Party.last.id).to eq(11)
    expect(current_path).to eq("/users/#{user.id}")
  end
end
