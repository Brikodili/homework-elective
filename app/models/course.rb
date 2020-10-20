class Course < ApplicationRecord
  has_many :course_attendances
  has_many :users, through: :course_attendances
end
