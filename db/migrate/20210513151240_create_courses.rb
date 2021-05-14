class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :course_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
