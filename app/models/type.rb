class Type < ActiveRecord::Base
  has_many :effects
  has_many :pokemon, through: :pokemon_types

  def factor_against(type)
    if eff = effects.find_by(attacker_type: type.name)
      eff.factor.to_f
    else
      1.0
    end
  end

  def to_html
    "<span class='label type_#{self.name.downcase}'>#{self.name}</span>".html_safe
  end
end
