class CreateGradeRecord < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_records do |t|
      t.references :rubric
      t.references :learner
      t.references :mentor
      t.text :comment
      t.decimal :point
      t.string :status
      t.timestamps
    end
  end
end
