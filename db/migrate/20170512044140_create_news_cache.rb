class CreateNewsCache < ActiveRecord::Migration[5.0]
  def change
    create_table :news_caches do |t|
      t.text :content_storage_body
      t.string :content_storage_type
      t.integer :content_storage_id
    end
  end
end
