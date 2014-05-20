class Type < ActiveRecord::Base
  has_many :effects
  has_many :pokemon, through: :pokemon_types

  def factor_against(type)
    eff = effects.find_by(attacker_type: type)
    if eff
      eff.factor
    else
      1.0
    end
  end
end
