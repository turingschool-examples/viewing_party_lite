require 'rails_helper'

RSpec.describe UserParty, type: :model do 
  it { should belong_to(:user) }
  it { should belong_to(:party) }
end