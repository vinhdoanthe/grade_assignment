class AddTypeToGradeRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :grade_records, :grade_type, :string
  end
end
