require 'rails_helper'


RSpec.describe 'user discover movies page' do 
    it "has a button to find top rated movies" do 
    user_1 = User.create!(name: "ODB", email: "testemail1@mail.com")
    visit "/users/#{user_1.id}/discover"
    save_and_open_page
    end

end