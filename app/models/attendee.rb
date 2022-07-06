class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
end
