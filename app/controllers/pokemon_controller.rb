class PokemonController < ApplicationController
  def index
  end

  def show
  	@pokemon = Pokemon.find(pokemon_params[:id])
  end

  private

  def pokemon_params
  	params.permit(:id)
  end
end