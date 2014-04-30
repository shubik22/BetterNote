class CreateNoteTags < ActiveRecord::Migration
  def change
    create_table :note_tags do |t|
      t.integer :tag_id, null: false
      t.integer :note_id, null: false

      t.timestamps
    end

    add_index :note_tags, :tag_id
    add_index :note_tags, :note_id
    add_index :note_tags, [:tag_id, :note_id], unique: true
  end
end
