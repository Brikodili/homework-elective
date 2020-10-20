class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :user_scores, dependent: :destroy
  has_many :course_attendances, dependent: :destroy
  has_many :courses, through: :course_attendances

  def user_role
    role.name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def name_with_initial
    full_name
  end
end
