require 'rails_helper'

RSpec.describe 'The Register Page', type: :feature do

  before(:each) do
    visit register_path
  end

  describe 'When I visit the register path' do
    it 'includes a form with name, email, and register button, once user registers they are directed to their dashboard page' do
      expect(page).to have_content("Register a New User")
      save_and_open_page
      within "#register-form" do
        fill_in :name, with: 'Bob'
        fill_in :email, with: 'bob@gmail.com'

        click_button 'Create New User'
      end

      new_user = User.last
      expect(current_path).to eq(user_path(new_user))
    end

    xit 'returns an error message if fields are not filled correctly' do
      within "#register-form" do
        fill_in :name, with: ''
        fill_in :email, with: 'bob@gmail.com'

        click_button 'Create New User'
      end

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")
    end

    xit 'returns an error message if email already exists' do
      within "#register-form" do
        fill_in :name, with: ''
        fill_in :email, with: 'bob@gmail.com'

        click_button 'Create New User'
      end

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Name can't be blank")
    end
  end
end