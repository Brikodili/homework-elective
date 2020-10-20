class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :teacher_id
      t.boolean :activity_status, default: true
      t.date :start_date, allow_nil: false
      t.date :finish_date, allow_nil: true

      t.timestamps
    end
  end
end
