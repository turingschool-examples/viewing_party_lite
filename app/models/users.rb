# frozen_string_literal: true

class Users < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
