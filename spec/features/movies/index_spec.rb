require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
   it 'shows top rated movies' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")
      visit user_discover_index_path(user.id)

      # click_link 'Top Movies'
      # expect(current_path).to eq("users/:user_id/movies?q=top%20rated")

      # click_link 'Search'
      # expect(current_path).to eq("/users/:user_id/movies?q=keyword")
   end
end