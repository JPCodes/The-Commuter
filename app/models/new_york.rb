class NewYork < ActiveRecord::Base
  has_one :news_cache, as: :content_storage
  validates :update_interval, :content_type, presence: true
  before_save :cache_api_data

  enum content_type: {
    home: 0,
    sports: 1,
    tech: 2,
    movies: 3
  }

  def cache_api_data
    # get api results
    content_storage = NewsCache.new(content_storage_body: 'testing')
  end
end
