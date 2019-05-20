class UpdateModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :criteria, :rubric, index: true
    rename_column :criteria, :type, :criteria_type
    add_column :rubrics, :rubric_code, :string, unique: true
  end
end
