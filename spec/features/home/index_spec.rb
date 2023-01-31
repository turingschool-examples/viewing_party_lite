require 'rails_helper'

RSpec.describe "index page" do
  it 'The title of the application' do
    visit root_path

    expect(page).to have_content("Viewing Party")
  end
end