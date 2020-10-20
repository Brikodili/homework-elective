class Role < ApplicationRecord
  has_many :users

  def name_with_initial
    name.to_s
  end
end
