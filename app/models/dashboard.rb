class Dashboard < ActiveRecord::Base
  belongs_to :user
  validates :api_content_preferences, presence: true
  serialize :api_content_preferences, JSON

  # Who can see the user's dashboard
  enum privacy_setting: {
    user: 0,
    unrestricted: 1
  }
end
