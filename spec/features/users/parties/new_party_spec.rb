require 'rails_helper'

RSpec.describe "New Party Page" do 

  describe "As a Visitor" do 

    it 'it has the movie title and a form to create a new party' do
      skeeter = User.create!(name: 'Skeeter', email: 'skeeter@example.com')
      jaws_id = 578
      date = DateTime.now.strftime("%m/%d/%y")
      visit "/users/#{skeeter.id}/movies/#{jaws_id}/party/new"
      save_and_open_page
      expect(page).to have_content("Create a Movie Party for Jaws")
      expect(page).to have_field('Duration of Party', with: '124')
      expect(page).to have_field('Day')
      expect(page).to have_field('Start Time', with: '7:00')

    end 

  end 

end 

