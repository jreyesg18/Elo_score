class UsersController < ApplicationController
  require 'elo'

  def index
    @users = User.all
    @user1, @user2 = User.random_pair
  end

  def choose_winner
    chosen_user = User.find(params[:id])
    other_user = User.find(params[:other_id])

    result = Elo::Player.new(rating: chosen_user.elo_ranking)
    opponent = Elo::Player.new(rating: other_user.elo_ranking)

    # Calcula los nuevos puntajes Elo
    result.wins_from(opponent)

    chosen_user.update(elo_ranking: result.rating)
    other_user.update(elo_ranking: opponent.rating)

    redirect_to users_path
  end

  def ranking
    @users = User.order(elo_ranking: :desc)
  end

  def show
    @user = current_user
    @user_position = User.order(elo_ranking: :desc).pluck(:id).index(@user.id) + 1
  end

  private
  def user_params
    params.require(:user).permit(:name, :lastname, :username, :elo_rating, :image, :image_cache)
  end
end
