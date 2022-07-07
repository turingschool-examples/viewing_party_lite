require 'rails_helper'

RSpec.describe "User Registration Page", type: :feature do
  # before :each do
  #   visit "/register"
  # end

  it 'has a form' do
    visit "/register"
    expect(page).to have_field(:name)
    expect(page).to have_field(:name)
    expect(page).to have_button("Register")
  end
end
