class Team < ApplicationRecord
  has_many :team_user
  has_many :users, through: :team_user
  has_one_attached :logo
  has_one_attached :background
end
