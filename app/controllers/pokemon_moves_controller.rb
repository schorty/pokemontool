class PokemonMovesController < ApplicationController
  def index
    @pokemon = Pokemon.find(pokemon_move_params[:id])
    @pokemon_moves = @pokemon.pokemon_moves.order(:learn_method)
  end

  private

  def pokemon_move_params
    params.permit(:id)
  end
end
