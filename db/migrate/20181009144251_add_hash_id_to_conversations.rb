class AddHashIdToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :hash_id, :string
  end
end
