# frozen_string_literal: true

class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party
end
