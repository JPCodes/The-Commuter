class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.text :content
      t.integer :user_id
    end
    create_table :responses do |t|
      t.text :content
      t.integer :user_id
      t.integer :conversation_id
    end
  end
end
