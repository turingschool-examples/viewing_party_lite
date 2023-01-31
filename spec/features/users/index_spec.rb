require 'rails_helper'

RSpec.describe 'User index spec' do
    before(:each) do
      @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
      @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
      @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

      @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22')
      @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46')

      @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)
    end
  describe 'User Register' do
    it "The form should include:
  -Name
  -Email (must be unique)
  -Register Button
  Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created." do
      visit register_path
      fill_in :name, with: "Bob"
      fill_in :email, with: "Bob@gmail.com"
      click_on "Submit"
      expect(page).to have_content("Bob Show Page")
      
    end
  end
end
