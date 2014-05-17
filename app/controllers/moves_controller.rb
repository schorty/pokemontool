class MovesController < ApplicationController
  def index
  	@moves = Move.all
  end

  def show

  end

  def overview
  	@moves = Move.all
  end

  private

  def move_params
  	params.permit(:move_id)
  end
end
