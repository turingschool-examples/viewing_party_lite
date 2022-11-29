require 'rails_helper'

RSpec.describe 'Landing Page' do 

  it 'has a landing page' do 
    visit root_path
    expect(current_path).to eq(root_path)
  end


end