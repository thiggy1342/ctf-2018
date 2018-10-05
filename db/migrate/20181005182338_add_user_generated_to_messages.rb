class AddUserGeneratedToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user_generated, :boolean
  end
end
