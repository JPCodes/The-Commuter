class CreateDashboard < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.text :api_content_preferences
      t.integer :user_id
    end
  end
end
