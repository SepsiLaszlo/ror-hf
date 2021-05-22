class AddForeignKeyToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_index(:subject_applications, [:user_id, :subject_id], unique: true)
  end
end
