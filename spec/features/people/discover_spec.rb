require "rails_helper"

RSpec.describe "Discover Page" do
  it "has a button to discover top rated movies" do
    person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")

    party1 = Party.create!(host_id: 1, movie_id: 2, movie_name: "Star Wars", date: "May 4, 2022", time: "8:00pm", duration: 180)
    party2 = Party.create!(host_id: 1, movie_id: 3, movie_name: "Tootsie", date: "June 12, 2022", time: "6:00pm", duration: 130)

    PartyPerson.create(party_id: party2.id, person_id: person.id)
    PartyPerson.create(party_id: party1.id, person_id: person.id)

    visit discover_path(person.id)

    click_button "Find Top Rated Movies"

    expect(current_path).to eq("people/:person.id/movies?q=top%20rated")
  end

  it "has a text field to enter keywords to search by movie title" do
    person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")

    party1 = Party.create!(host_id: 1, movie_id: 2, movie_name: "Star Wars", date: "May 4, 2022", time: "8:00pm", duration: 180)
    party2 = Party.create!(host_id: 1, movie_id: 3, movie_name: "Tootsie", date: "June 12, 2022", time: "6:00pm", duration: 130)

    PartyPerson.create(party_id: party2.id, person_id: person.id)
    PartyPerson.create(party_id: party1.id, person_id: person.id)

    visit discover_path(person.id)

    expect(page).to have_content("Search by movie title")

    fill_in :search, with: "Top Gun"

    click_button "Find Movies"
  end

  # it 'has a button to search by movie titles' do
  #   person = Person.create!(name: "Billy Williams", email: "bwill@mailer.com")
  #
  #   party1 = Party.create!(host_id: 1, movie_id: 2, movie_name: "Star Wars", date: "May 4, 2022", time: "8:00pm", duration: 180)
  #   party2 = Party.create!(host_id: 1, movie_id: 3, movie_name: "Tootsie", date: "June 12, 2022", time: "6:00pm", duration: 130)
  #
  #   PartyPerson.create(party_id: party2.id, person_id: person.id)
  #   PartyPerson.create(party_id: party1.id, person_id: person.id)
  #
  #   visit discover_path(person.id)
  #
  #   click_button "Find Movies"
  # end
end
