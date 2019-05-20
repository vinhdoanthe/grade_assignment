class CreateRubric < ActiveRecord::Migration[5.2]
  def change
    create_table :rubrics do |t|
      t.string :assignment
      t.text :description
      t.timestamps
    end
  end
end
