class CreateGradeCrite < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_crites do |t|
      t.references :grade_record, foreign_key: true
      t.integer :index
      t.string :criteria_description
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
