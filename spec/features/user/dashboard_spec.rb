require "rails_helper"

RSpec.describe "User Dashboard" do 
  before :each do
    @user_1 = create(:user)

    visit "users/#{@user_1.id}"
  end

  it "will have the user's name" do 
    expect(page).to have_content(@user_1.name)
  end 
end