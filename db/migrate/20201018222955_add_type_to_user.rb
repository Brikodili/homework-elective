class AddTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, default: ''
  end
end
