class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.string :user1
      t.string :user2

      t.timestamps
    end
  end
end
