class AddDisplayHtmlToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :display_html?, :boolean, default: false
  end
end
