require 'rails_helper'

RSpec.describe 'Person Dashboard' do
  before :each do
    @person = Person.new(name: "Billy Williams", email: "bwill@mailer.com")
  end

  it 'displays the persons name at the top' do
    visit person_path(@person.id)

    expect(page).to have_content("Billy Williams's Dashboard")
  end

  it 'has a button to discover movies' do
    visit person_path(@person.id)

    expect(page).to have_button("Discover Movies")
  end

  it 'displays viewing parties that the person is a part of' do
    visit person_path(@person.id)

    expect(page).to have_content("View Party Name")
  end
end
