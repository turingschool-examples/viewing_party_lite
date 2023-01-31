require 'rails_helper'

RSpec.describe "user show page" do 
  before(:all) do
    User.delete_all
    @user = create(:user)
  end

  it 'displays the site and page title' do
    visit user_path(@user.id)

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("#{@user.name}'s Dashboard")

  end




end