class AddFieldsToGradeRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :rubrics, :course_instance, :string
    add_column :grade_records, :learner_name, :string
  end
end
