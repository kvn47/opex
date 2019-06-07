class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create!(user_params)
    render json: user
  end

  def show
    user = find_user
    render json: user
  end

  def update
    user = find_user
    user.update!(user_params)
    render json: user
  end

  def destroy
    user = find_user
    user.destroy!
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :birth_date, :location, :team_id)
  end

  def find_user
    User.find(params[:id])
  end
end
