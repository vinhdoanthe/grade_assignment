class CreateMentor < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :full_name
      t.string :email
      t.timestamps
    end
  end
end
