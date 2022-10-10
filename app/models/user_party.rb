class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party
  validates :is_host, presence: true
end
