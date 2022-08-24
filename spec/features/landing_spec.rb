require 'rails_helper'

RSpec.describe 'landing page' do

  it "can display the apps name" do
    visit '/'

    expect(page).to have_content('Viewing Party Lite')
  end


end
