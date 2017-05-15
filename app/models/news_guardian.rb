class NewsGuardian < ActiveRecord::Base
  has_one :news_cache, as: :content_storage
  validates :update_interval, :content_type, presence: true
  after_commit :retrieve_specified_content

  enum content_type: {
    usa: 4
  }

  def retrieve_specified_content
    eval "retrieve_#{content_type}_articles"
  end

  def cache_api_data(response)
    nc = NewsCache.create!(content_storage_body: response, content_storage: self)
    content_storage = nc
  end

  def retrieve_usa_articles
    response = RestClient.get('http://content.guardianapis.com/search?page-size=15&q=us',
    {
      params: {'api-key': ENV['API_KEY_GUARDIAN']}
    })
    cache_api_data(response)
  end
end
