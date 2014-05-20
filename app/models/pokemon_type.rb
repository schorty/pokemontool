class PokemonType < ActiveRecord::Base
  belongs_to :type
  belongs_to :pokemon
end
