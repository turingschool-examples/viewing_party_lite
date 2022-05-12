require 'rails_helper'

RSpec.describe 'New User Registration Page Features' do

  describe 'registration form' do

    it 'renders a form with a name and email field' do
      visit '/register/'

      expect(page).to have_field(:email)
      expect(page).to have_field(:name)
      expect(page).to have_button("Complete Registration")
    end

    it 'once submitted, takes user to their new profile page' do
      fill_in :email, with: "johndoe@gmail.com"
      fill_in :name, with: "John Doe"
      click_on "Complete Registration"

      expect(current_path).to eq("/users/#{/\d+/}/") #reg ex will match any integer, we don't care that we're going to a specific ID number just that the page we end up on will have matching information. Refactor opportunity - how do we predict the next sequential database ID? User model method for that?

      expect(page).to have_content(["johndoe@gmail.com", "John Doe"])
    end

    it 'requires that the email is not already linked to a registered user' do
      visit '/register'
      fill_in :email, with: "johndoe@gmail.com"
      fill_in :name, with: "John Doe"
      click_on "Complete Registration"
    end
  end

end
