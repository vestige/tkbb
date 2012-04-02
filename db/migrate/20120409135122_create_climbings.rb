class CreateClimbings < ActiveRecord::Migration
  def change
    create_table :climbings do |t|
      t.references :user
      t.references :gym
      t.string :comment
      t.string :action

      t.timestamps
    end
    add_index :climbings, :user_id
    add_index :climbings, :gym_id
  end
end
