require "rails_helper"

RSpec.describe "Person Dashboard" do
  it "displays the persons name at the top" do
    person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")

    visit person_path(person.id)

    expect(page).to have_content("Billy Williams's Dashboard")
  end

  it "has a button to discover movies" do
    person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")

    visit person_path(person.id)

    expect(page).to have_button("Discover Movies")

    click_button "Discover Movies"

    expect(current_path).to eq(discover_path(person.id))
  end

  it "displays viewing parties that the person is a part of" do
    person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")

    party1 = Party.create!(host_id: 1, movie_id: 2, movie_name: "Star Wars", date: "May 4, 2022", time: "8:00pm", duration: 180)
    party2 = Party.create!(host_id: 1, movie_id: 3, movie_name: "Tootsie", date: "June 12, 2022", time: "6:00pm", duration: 130)

    PartyPerson.create(party_id: party2.id, person_id: person.id)
    PartyPerson.create(party_id: party1.id, person_id: person.id)

    visit person_path(person.id)

    expect(page).to have_content(party1.movie_name)
    expect(page).to have_content(party1.date)
    expect(page).to have_content(party1.time)
    expect(page).to have_content(party1.duration)
  end
end
