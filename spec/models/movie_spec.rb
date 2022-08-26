require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:event_users) }
  it { should have_many(:users).through(:event_users) }
end
