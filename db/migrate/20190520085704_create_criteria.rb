class CreateCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria do |t|
      t.integer :index
      t.string :criteria
      t.string :outcome
      t.text :meet_the_specification
      t.decimal :weight
      t.boolean :mandatory
      t.string :type
      t.timestamps
    end
  end
end
