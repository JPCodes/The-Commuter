class AddTimestampsToConversationsAndResponses < ActiveRecord::Migration[5.0]
  def change
    add_column(:conversations, :created_at, :datetime)
    add_column(:conversations, :updated_at, :datetime)

    add_column(:responses, :created_at, :datetime)
    add_column(:responses, :updated_at, :datetime)
  end
end
