require 'rails_helper'


RSpec.describe "New User", type: :feature do
  it "has button to create viewing party" do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    visit "/users/#{user.id}/movies/278"
    click_button "Create new viewing party"

    expect(current_path).to eq("/users/#{user.id}/movies/278/viewing_party/new")
  end
end
