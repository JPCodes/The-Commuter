class CreateNewYork < ActiveRecord::Migration[5.0]
  def change
    create_table :new_yorks do |t|
      t.integer :content_type
      t.integer :update_interval

      t.timestamps
    end
  end
end
