class UserScore < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
