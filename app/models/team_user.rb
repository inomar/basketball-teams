class TeamUser < ApplicationRecord
  enum role: { admin: 0, member: 1 }
  belongs_to :team
  belongs_to :user
end
