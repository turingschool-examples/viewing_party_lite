require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before :each do
    visit user_movies_path(user1)
  end
end
