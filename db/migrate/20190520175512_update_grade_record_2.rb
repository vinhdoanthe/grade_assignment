class UpdateGradeRecord2 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :grade_records, :learner
    add_column :grade_records, :learner_email, :string
  end
end
