class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :budget
      t.string :opening_hours
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :shops, [:address, :budget]
  end
end
