class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :name, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end

    add_index :tags, :owner_id
    add_index :tags, [:owner_id, :name], unique: true
  end
end