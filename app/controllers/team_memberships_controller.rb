class TeamMembershipsController < ApplicationController
  before_action :set_team_membership, only: [:edit, :update]
  before_action :set_team, only: [:new, :create]

  def new
    @team_membership = TeamMembership.new
    @pokemon = Pokemon.all.order(:name)
  end

  def create
    @team = TeamMembership.new(team_membership_params)

    if @team.save!
      redirect_to teams_url(@team), notice: 'Team created.'
    else
      render :new
    end
  end

  def edit
    # ❨╯°□°❩╯︵┻━┻
  end

  def update
    if @team_membership.update(team_membership_params)
      redirect_to team_url, notice: 'TeamMembership updated.'
    else
      render :edit
    end
  end

  def destroy
    @team_membership.destroy
    redirect_to team_url, notice: 'TeamMembership deleted.'
  end

  private

  def team_membership_params
    params.require(:team_membership).permit(:pokemon_id, :level, :ev_hp, :ev_attack, :ev_defense, :ev_special_attack, :ev_special_defense, :ev_speed, :iv_hp, :iv_attack, :iv_defense, :iv_special_attack, :iv_special_defense, :iv_speed)
  end

  def set_team_membership
    @team_membership = TeamMembership.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
