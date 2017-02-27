module NytapiHelper

  def retrieve_articles
    RestClient.get("https://api.nytimes.com/svc/topstories/v2/home.json", q={
      'api-key': ENV['API_KEY_NYT']
    })
  end

end
