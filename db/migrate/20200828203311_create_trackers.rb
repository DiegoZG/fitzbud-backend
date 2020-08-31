class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.integer :calories
      t.integer :weight
      t.integer :height
      t.integer :goal_weight
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
