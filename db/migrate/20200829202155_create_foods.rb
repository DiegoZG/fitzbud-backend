class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :title
      t.integer :calories
      t.string :macro_group
      t.datetime :date
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
