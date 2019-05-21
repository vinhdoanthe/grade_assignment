class UpdateGradeRecord < ActiveRecord::Migration[5.2]
  def change
    remove_reference :grade_records, :mentor
    remove_column :grade_records, :mentor_id
    add_column :grade_records, :mentor_email, :string
  end
end
