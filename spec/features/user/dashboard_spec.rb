require "rails_helper"

RSpec.describe "User Dashboard" do 
  before :each do
    @user_1 = create(:user)

    visit "/dashboard/#{@user_1}"
  end

  it "will have the user's name"
    expect(page).to have_content(@user_1.name)
end