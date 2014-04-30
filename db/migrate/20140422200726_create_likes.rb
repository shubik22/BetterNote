class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :owner_id, null: false
      t.integer :note_id, null: false

      t.timestamps
    end

    add_index :likes, :owner_id
    add_index :likes, :note_id
    add_index :likes, [:owner_id, :note_id], unique: true
  end
end
