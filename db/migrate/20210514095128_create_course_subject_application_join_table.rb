class CreateCourseSubjectApplicationJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :subject_applications do |t|
      # t.index [:course_id, :subject_application_id]
      # t.index [:subject_application_id, :course_id]
    end
  end
end
