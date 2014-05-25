class Pokemon < ActiveRecord::Base
  has_many :pokemon_types, dependent: :destroy
  has_many :pokemon_moves, dependent: :destroy
  has_many :types, through: :pokemon_types
  has_many :moves, through: :pokemon_moves

  validates :name, presence: true

  def calc_damage_factor_against(type)
    factor = 1

    types.each do |t|
      factor *= t.factor_against(type)
    end

    factor
  end
end
