class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.page(params[:page])
  end

  def show
  	@pokemon = Pokemon.find(pokemon_params[:id])
    @types = Type.all
    @effects = []
    @types.each do |type|
      @effects << @pokemon.calc_damage_factor_against(type).to_s
    end
    @pokemon_moves = @pokemon.pokemon_moves.order(:learn_method, :level).includes(:move)
  end

  private

  def pokemon_params
  	params.permit(:id)
  end
end
