class CreateUserScores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.boolean :pass_status, default: false
      t.integer :score
      t.datetime :finish_at

      t.timestamps
    end
  end
end
