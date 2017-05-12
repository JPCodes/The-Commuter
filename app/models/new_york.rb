class NewYork < ActiveRecord::Base
  has_one :news_cache, as: :content_storage
  validates :update_interval, :content_type, presence: true
  after_commit :retrieve_specified_content

  enum content_type: {
    home: 0,
    sports: 1,
    tech: 2,
    movies: 3
  }

  def retrieve_specified_content
    eval "retrieve_#{content_type}_articles"
  end

  def cache_api_data(response)
    nc = NewsCache.create!(content_storage_body: response, content_storage: self)
    content_storage = nc
  end

  def retrieve_home_articles
    response = RestClient.get("https://api.nytimes.com/svc/topstories/v2/home.json", q={
      'api-key': ENV['API_KEY_NYT']
    })
    cache_api_data(response)
  end
end
