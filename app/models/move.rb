class Move < ActiveRecord::Base
	belongs_to :type, dependent: :destroy
	has_many :pokemon_moves, dependent: :destroy
	has_many :pokemons, through: :pokemon_moves
	
	validates :name, presence: true
end
