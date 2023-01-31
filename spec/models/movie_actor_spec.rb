require 'rails_helper'

RSpec.describe MovieActor do
  describe 'associations' do
    it {should belong_to(:movie)}
    it {should belong_to(:actor)}
  end
end