class CreateNewsGuardian < ActiveRecord::Migration[5.0]
  def change
    create_table :news_guardians do |t|
      t.integer :content_type
      t.integer :update_interval
    end
  end
end
