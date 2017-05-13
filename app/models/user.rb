class User < ActiveRecord::Base
  has_many :conversations
  has_many :responses
  has_one :dashboard
  after_commit :generate_dashboard

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private
  def generate_dashboard
    Dashboard.create!(api_content_preferences: randomize_content_preferences, user: self)
  end

  def randomize_content_preferences
    content_enums = (0...4).to_a.sample(3)
  end
end
