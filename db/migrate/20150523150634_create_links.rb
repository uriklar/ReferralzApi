class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :links, :follower_id
    add_index :links, :followed_id
    add_index :links, [:follower_id, :followed_id], unique: true
  end
end
