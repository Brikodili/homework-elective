class UsersController < ApplicationController
  before_action :set_current_user, only: [:user_courses]

  def user_courses
    @courses = @current_user.courses
  end

  private

  def set_current_user
    @current_user = User.find(params[:id])
  end
end
