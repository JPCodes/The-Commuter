class NewsController < ApplicationController
  include ApiHelper
  skip_before_action :require_authentication!
  # TODO: Remove else and return data from the API method's call or rescue
  def index
    if @top_guardian_headlines = retrieve_guardian_headlines
      @top_guardian_headlines = JSON.parse(@top_guardian_headlines)['response']['results']
    else
      # retrieve from cache
      puts 'Top Guardian Headlines not retrieved (NewsController#Index)'
    end

    if @nyt_home_articles = retrieve_home_articles
      @nyt_home_articles = JSON.parse(@nyt_home_articles)['results']
    else
      # retrieve from cache
      puts 'NYT Home Articles not retrieved (NewsController#Index)'
    end
  end

  def show_article
    @article = params[:article]
    if @article
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def congressional_report
    if @reports = retrieve_congressional_bills
      @reports = JSON.parse(@reports)['results'][0]['bills']
      else
        # retrieve from cache
        puts 'Propublica Recent Bills Passed by Senate not retrieved (NewsController#Congressional_Report)'
      end
  end

  def download_pdf
    send_data(generate_pdf(params[:headline], params[:author], params[:section], params[:date], params[:body]), :filename => "article.pdf", :type => "application/pdf")
  end

  private
  def generate_pdf(headline, author, section, date, body)
    Prawn::Document.new do
      text "#{headline}", align: :center, size: 18
      text "#{section}", align: :center, size: 18
      text "#{author}",   align: :center, size: 14
      text "#{date}",   align: :center, size: 12
      move_down 12

      column_box([0, cursor], columns: 1, width: bounds.width) do
          text((<<-END.gsub(/\s+/, ' ') + "\n\n"))
            Abstract: #{body}
          END
        end
      text "Courtesy of the New York Times.",   align: :center, size: 12
      end.render
  end

end
