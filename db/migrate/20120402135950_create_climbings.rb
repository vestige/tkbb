class CreateClimbings < ActiveRecord::Migration
  def change
    create_table :climbings do |t|
      t.references :user_id
      t.references :gym_id
      t.string :comment
      t.string :action

      t.timestamps
    end
    add_index :climbings, :user_id_id
    add_index :climbings, :gym_id_id
  end
end
