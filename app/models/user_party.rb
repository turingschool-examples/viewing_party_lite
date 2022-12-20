class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def the_host
    party.users.where("host = true").pluck('name').first
  end
end
