class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :in_friend_id, null: false
      t.integer :out_friend_id, null: false

      t.timestamps
    end

    add_index :friendships, :out_friend_id
    add_index :friendships, :in_friend_id
    add_index :friendships, [:in_friend_id, :out_friend_id], unique: true
  end
end