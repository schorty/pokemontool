class Pokemon < ActiveRecord::Base
	has_many :types
	has_many :pokemon_moves, dependent: :destroy
	has_many :moves, through: :pokemon_moves
end
