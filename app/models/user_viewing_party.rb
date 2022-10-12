# frozen_string_literal: true

class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
  validates_presence_of :user_id,
                        :viewing_party_id,
                        :role
  enum role: %i[Invited Host]
end
