class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :view_party
end
