class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum host: [:invited, :hosting]
end
