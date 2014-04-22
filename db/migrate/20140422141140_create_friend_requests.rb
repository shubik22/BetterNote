class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :in_friend_id, null: false
      t.integer :out_friend_id, null: false

      t.timestamps
    end

    add_index :friend_requests, :out_friend_id
    add_index :friend_requests, :in_friend_id
    add_index :friend_requests, [:in_friend_id, :out_friend_id], unique: true
  end
end
