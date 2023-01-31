class ViewingParty < ApplicationRecord
  belongs_to :host, :class_name => "User", :foreign_key => "user_id"
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users
end
