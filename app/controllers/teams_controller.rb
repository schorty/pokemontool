class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :destroy]

  def index
    @teams = Team.all
  end

  def show
    # ❨╯°□°❩╯︵┻━┻
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
  end

  def edit
    # ❨╯°□°❩╯︵┻━┻
  end

  def update
    if @team.update(team_params)
      redirect_to team_url, notice: 'Team updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to team_url, notice: 'Team deleted.'
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
