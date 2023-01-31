require 'rails_helper'

RSpec.describe "register page" do
  it 'has a form with fields to fill in' do
    visit 'register'
save_and_open_page
    expect(page).to have_field("Name")
    expect(page).to have_field("Email")
    expect(page).to have_button("Create New User")
  end
end