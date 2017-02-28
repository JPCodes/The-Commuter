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
      RestClient.get("https://api.propublica.org/congress/v1/115/senate/bills/passed.json", headers={"X-API-Key": ENV['API_KEY_Propublica'] })
    rescue
      puts 'Propublica Recent Bills Passed by Senate API Error'
    end
  end


end
