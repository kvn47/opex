class TeamsController < ApplicationController
  def create
    @team = Team.create!(team_params)
    render 'show', status: 200
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update!(team_params)
    render 'show', status: 200
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy!
  end

  private

  def team_params
    params.require(:team).permit(:name, :location, :logo)
  end
end
