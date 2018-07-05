class Position < ApplicationRecord
  #has_and_belongs_to_many :users
  has_many :position_user
  has_many :users, through: :position_user
end
