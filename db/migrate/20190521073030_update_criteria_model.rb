class UpdateCriteriaModel < ActiveRecord::Migration[5.2]
  def change
    drop_table :criteria
    drop_table :grade_criteria
  end
end
