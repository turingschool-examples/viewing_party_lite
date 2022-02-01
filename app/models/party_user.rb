class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum status: {pending: 0, hosting: 1, invited: 2}
end
