class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.text :name, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end

    add_index :notebooks, :owner_id
  end
end
