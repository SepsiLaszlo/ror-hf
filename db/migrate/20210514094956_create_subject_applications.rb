class CreateSubjectApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_applications do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
