class Propublica < ActiveRecord::Base
  has_one :news_cache, as: :content_storage
  validates :update_interval, :content_type, presence: true
  after_commit :retrieve_specified_content

  enum content_type: {
    senate: 5,
    house: 6
  }

  def retrieve_specified_content
    eval "retrieve_#{content_type}_bills"
  end

  def cache_api_data(response)
    # Rescue because APIs are unpredictable
    begin
      retries ||= 0
      nc = NewsCache.create!(content_storage_body: response, content_storage: self)
      content_storage = nc
    rescue
      retry if (retries += 1) < 3
    end
  end

  def retrieve_senate_bills
    response = RestClient.get("https://api.propublica.org/congress/v1/115/senate/bills/passed.json", headers={"X-API-Key": ENV['API_KEY_PROPUBLICA'] })
    cache_api_data(response)
  end

  def retrieve_house_bills
    response = RestClient.get("https://api.propublica.org/congress/v1/115/house/bills/passed.json", headers={"X-API-Key": ENV['API_KEY_PROPUBLICA'] })
    cache_api_data(response)
  end
end
