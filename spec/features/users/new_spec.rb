require 'rails_helper'

RSpec.describe 'creating a new user' do
  it 'has a form to create a new user' do
    visit '/register'
    expect(page)
  end
end
