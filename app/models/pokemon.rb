class Pokemon < ActiveRecord::Base
  has_many :pokemon_types, dependent: :destroy
  has_many :pokemon_moves, dependent: :destroy
  has_many :types, through: :pokemon_types
	has_many :moves, through: :pokemon_moves

	validates :name, presence: true
end
