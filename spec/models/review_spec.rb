require 'rails_helper'

RSpec.describe Review do
  describe 'associations' do
    it {should belong_to(:movie)}
  end
end