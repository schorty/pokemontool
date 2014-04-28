class DamageController < ApplicationController

  def calc
  end
  
  def result

    if params[:m]
      @dc = DamageCalculator.new(params[:m])
      @dc.calc_damage
    end

    respond_to do |format|
      format.js
    end
  end
end
