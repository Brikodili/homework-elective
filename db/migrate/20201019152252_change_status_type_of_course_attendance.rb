class ChangeStatusTypeOfCourseAttendance < ActiveRecord::Migration[6.0]
  def change
    change_column :course_attendances, :status, :string, default: ''
  end
end
