class CourseAttendanceController < ApplicationController
  before_action :set_course_attendance, only: [:update, :delete]

  def new
    @course_attendance = CourseAttendance.new(course_attendance_params)
  end

  def create
    @course_attendance = CourseAttendance.new(course_id: params[:course_id], user_id: current_user.id, status: true)

    if @course_attendance.save
      flash[:notice] = 'Joined'
    else
      redirect_to courses_path
    end
  end

  def update
    @course_attendance.update(course_attendance_params)
  end

  def delete
    @course_attendance.delete
  end

  private

  def course_attendance_params
    params.require(:course_attendance).permit(:user_id, :course_id, :status)
  end

  def set_course_attendance
    @course_attendance ||= CourseAttendance.find(params[:id])
  end
end
