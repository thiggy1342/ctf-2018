class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :content
      t.belongs_to :conversation, index: true

      t.timestamps
    end
  end
end
