class CreateCrite < ActiveRecord::Migration[5.2]
  def change
    create_table :crites do |t|
      t.references :rubric, foreign_key: true
      t.integer :index
      t.string :criteria_description
      t.string :outcome
      t.text :meet_the_specification
      t.boolean :mandatory
      t.string :criteria_type
      t.decimal :weight
      t.timestamps
    end
  end
end
