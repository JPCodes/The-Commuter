module ApiHelper

  def retrieve_home_articles
    begin
      RestClient.get("https://api.nytimes.com/svc/topstories/v2/home.json", q={
        'api-key': ENV['API_KEY_NYT']
      })
    rescue
      puts 'NYT Top Stories V2 API Error'
    end
  end

  def retrieve_guardian_headlines
    begin
      RestClient.get('http://content.guardianapis.com/search?page-size=15&q=us',
      {
        params: {'api-key': ENV['API_KEY_GUARDIAN']}
      })
    rescue
      puts 'Guardian US Top Story Headlines API Error'
    end
  end

  def retrieve_congressional_bills
    begin
      RestClient.get("https://api.propublica.org/congress/v1/115/senate/bills/passed.json", headers={"X-API-Key": ENV['API_KEY_PROPUBLICA'] })
    rescue
      puts 'Propublica Recent Bills Passed by Senate API Error'
    end
  end


  def get_businesses(yelp_search)
    begin
      if !yelp_search[:price_point].empty?
        RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{yelp_search[:term]}&location=#{yelp_search[:location]}&price=#{yelp_search[:price_point].scan(/\$/).count}", headers={"authorization": ENV['API_KEY_YELP'] })
      else
        RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{yelp_search[:term]}&location=#{yelp_search[:location]}", headers={"authorization": ENV['API_KEY_YELP'] })
      end
    rescue
      puts 'Yelp API ERROR'
    end
  end

end
