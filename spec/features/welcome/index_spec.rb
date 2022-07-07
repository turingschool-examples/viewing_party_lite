require 'rails_helper'
RSpec.describe 'welcome page index' do 
  it 'has title of application' do
    visit '/'
    expect(page).to have_content("Viewing Party Lite")
  end


end