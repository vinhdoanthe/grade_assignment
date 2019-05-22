class RemoveMentorModel < ActiveRecord::Migration[5.2]
  def change
    drop_table :mentors
  end
end
