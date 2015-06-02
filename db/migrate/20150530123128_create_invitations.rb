class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.string :recipient_phone
      t.string :token
      t.datetime :sent_at
      t.string :new

      t.timestamps
    end
  end
end
