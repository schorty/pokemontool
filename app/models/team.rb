class Team < ActiveRecord::Base
  has_many :pokemon, through: :team_memberships
  has_many :team_memberships
end
