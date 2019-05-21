class UpdateFieldCriteriaModel < ActiveRecord::Migration[5.2]
  def change
    rename_column :criteria, :criteria, :criteria_description
    rename_column :grade_criteria, :criteria, :criteria_description
  end
end
