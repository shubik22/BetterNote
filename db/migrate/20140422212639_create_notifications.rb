class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :notifiable_id
      t.string :notifiable_type
      t.integer :user_id

      t.timestamps
    end

    add_index :notifications, :notifiable_id
    add_index :notifications, :user_id
  end
end