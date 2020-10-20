class UserScoresController < ApplicationController

  # before_action :set_user_score, only: [:show]

  def index
    @user_scores = UserScore.all
  end

  def show
    @user_score = UserScore.find(params[:id])
  end

  def course_user_scores
    @user_scores = UserScore.where(course_id: params[:course_id])
  end

  def new
    @users = Course.find(params[:course_id]).course_attendances.collect(&:user)
  end

  def create
    @user_score = UserScore.create(user_score_params)
    if @user_score.save
      redirect_to @user_score
    else
      flash[:course_errors] = @user_score.errors.full_messages
      redirect_to new_user_score_url(params[:course_id])
    end
  end

  private

  # def set_user_score
  #   @user_score = UserScore.where(course_id: params[:course_id], user_id: current_user.id)
  # end

  def user_score_params
    params.require(:user_score).permit(:user_id, :score, :course_id)
  end
end
