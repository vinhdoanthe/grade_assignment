class CreateGradeCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_criteria do |t|
      t.references :grades_record
      t.integer :index
      t.string :criteria
      t.string :outcome
      t.text :meet_the_specification
      t.string :status
      t.decimal :point
      t.text :comment
      t.boolean :mandatory
      t.string :criteria_type
      t.decimal :weight
      t.timestamps
    end
  end
end
