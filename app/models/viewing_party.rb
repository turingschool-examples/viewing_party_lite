class ViewingParty < ApplicationRecord
  belongs_to :host, class_name: 'User'
  validates :host, presence: true
end
