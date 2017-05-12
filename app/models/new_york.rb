class NewYork < ActiveRecord::Base
  has_one :news_cache, as: :content_storage
  validates :update_interval, :content_type, presence: true

  enum content_type: {
    home: 0,
    sports: 1,
    tech: 2,
    movies: 3
  }
end
