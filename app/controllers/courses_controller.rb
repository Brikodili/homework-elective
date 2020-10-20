class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show; end

  def edit; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      redirect_to @course
    else
      flash[:course_errors] = @course.errors.full_messages
      redirect_to :back
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy

    redirect_to courses_path
  end

  def students
    @students = CourseAttendance.where(course_id: params[:course_id]).collect(&:user)
  end

  private

  def set_course
    @course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :finish_date, :teacher_id)
  end
end
