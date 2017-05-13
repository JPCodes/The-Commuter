class Dashboard < ActiveRecord::Base
  belongs_to :user
  validates :api_content_preferences, presence: true
  serialize :api_content_preferences, JSON
end
