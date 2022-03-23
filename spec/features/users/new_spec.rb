require 'rails_helper'

RSpec.describe 'Registration form page' do

  before :each do
    visit new_user_path
  end

  it 'displays a form to register a new user' do

    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_button("Save")
  end

  context 'happy path' do
    it 'takes the user to its dashboard on successful registration' do
      fill_in :name, with: 'Bob Barker'
      fill_in :email, with: 'BobBarker@ThePriceIsWrong.net'

      click_on("Save")
      expect(current_path).to eq(user_path(:id))
    end
  end

  context 'sad path' do
    it 'returns an error if name is not filled out' do
      fill_in :email, with: 'BobBarker@ThePriceIsWrong.net'

      click_on("Save")
      save_and_open_page
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Please fill out this field.")
    end
  end
end
