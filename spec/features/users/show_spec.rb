require 'rails_helper'

RSpec.describe 'User Dashboard Page' do 
  before :each do 
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")
  end

  describe 'when I visit users/:id' do 
    it 'I see the user names dashboard header at top of page' do 
      visit "users/#{@user1.id}"
      save_and_open_page
    end
  end
end