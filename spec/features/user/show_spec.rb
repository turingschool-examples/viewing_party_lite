require 'rails_helper'

RSpec.describe "user show" do
  it 'shows user details' do
    visit user_path

    expect(page).to have_button('Create New User')
    click_button "Create New User"
    expect(current_path).to eq(register_path)
  end
end
