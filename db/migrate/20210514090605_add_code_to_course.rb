class AddCodeToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :number, :integer
  end
end
