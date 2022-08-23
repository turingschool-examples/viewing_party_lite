require 'rails_helper'

RSpec.describe UserViewingParty do 

  it { should belong_to :user}
  it { should belong_to :viewing_party}

end