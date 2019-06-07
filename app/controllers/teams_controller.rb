class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    team = Team.create!(team_params)
    render json: team
  end

  def show
    team = find_team
    render json: team
  end

  def update
    team = find_team
    team.update!(team_params)
    render json: team
  end

  def destroy
    team = find_team
    team.destroy!
  end

  private

  def find_team
    Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :location, :logo)
  end
end
