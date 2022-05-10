# frozen_string_literal: true

class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :party
end
