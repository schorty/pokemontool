class TypechartController < ApplicationController
  def index
    @types = Type.all
    @effects = @types.map do |type|
      type.effects.map(&:factor)
    end
  end

  def chart
    @team = Team.new
    6.times { |_| @team.members << Teammember.new(['None']) }
    @team.setup_type_matrix
    @types = Type.all
  end

  def show_chart
    @team = Team.new
    @types = Type.all
    
    if params[:commit]
      params[:m].map do |m|
        unless m[:type1] == 'None' && m[:type2] == 'None'
          types = []
          types << m[:type1] if m[:type1] && m[:type1] != 'None'
          types << m[:type2] if m[:type2] && m[:type1] != m[:type2] && m[:type2] != 'None'
          @team.members << Teammember.new(types)
        end
      end

      (6 - @team.members.length).times do |_| 
        @team.members << Teammember.new(['None']) 
      end
      
      @team.setup_type_matrix
    end

    respond_to do |format|
      format.js
    end
  end
end