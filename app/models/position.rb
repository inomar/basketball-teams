class Position < ApplicationRecord
  has_and_belongs_to_many :users
  # has_many :user_positions
  # has_many :users, through: :user_positions
end
