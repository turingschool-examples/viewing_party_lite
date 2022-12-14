require 'rails_helper'

RSpec.describe 'Admin Show Page', type: :feature do
  let!(:user_1) { create(:user, role: 1)}
  let!(:user_2) { create(:user)}

  describe 'When I visit the admin show page' do
    xit 'as a visit, I am taken back to the landing page where I see an error' do

    end
  end
end