class Team < ActiveRecord::Base
  has_many :pokemon, through: :team_memberships
  has_many :team_memberships, dependent: :destroy

  validate :team_isnt_full_yet

  private

  def team_isnt_full_yet
  	return if team_memberships.count <= 6
  	errors.add("Too many Pokémon in Team #{name}")
  end
end
