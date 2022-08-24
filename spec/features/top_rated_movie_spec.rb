require 'rails_helper'
require 'faker'

RSpec.describe 'Top Rated Movies' do
  describe 'happy path' do
    it 'allows user to see first 40 top rated movies', :vcr do
      # json_response = File.read('spec/fixtures/members_of_the_senate.json')
      # stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
      #          with(
      #            headers: {
      #        	     'X-Api-Key'=>'RyVUj8HR4zzcDItMW1VjJBnxXXJntt0f6lDmqKBN'
      #            }).
      #          to_return(status: 200, body: json_response, headers: {})
      user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

      visit "/users/#{user1.id}/movies?q=top%20rated"

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end
  end
end