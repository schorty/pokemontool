class MovesController < ApplicationController
  def index
  	@moves = Move.all
  end

  def show
    @move = Move.find(params[:id])
    p @move
  end

  def overview
  	@moves = Move.all
  end

  private

  def move_params
  	params.permit(:move_id)
  end
end
