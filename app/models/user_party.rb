# frozen_string_literal: true

class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum host: %i[invited hosting]
end
