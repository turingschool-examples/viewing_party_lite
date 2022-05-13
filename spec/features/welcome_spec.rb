require "rails_helper"

RSpec.describe "Welcome Page" do
  it "displays title of application" do
    visit "/"
    expect(page).to have_content("View Party")
  end

  it "has button to create new user" do
    visit "/"
    expect(page).to have_button("Create New User")
  end

  it "has list of each user with link to each user's dashboard" do
    person1 = Person.create!(name: "Scott Pascale", email: "spascale@mailg.com")
    person2 = Person.create!(name: "Luke Sullivan", email: "lsullivan@mailg.com")

    visit "/"

    expect(page).to have_link(person1.name)
    expect(page).to have_link(person2.name)

    click_link person1.name

    expect(current_path).to eq(person_path(person1.id))
  end

  it "has link to go back to landing page" do
    visit "/"

    expect(page).to have_link("Welcome Page")
  end
end
