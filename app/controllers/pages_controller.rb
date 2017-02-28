class PagesController < ApplicationController
  include ApiHelper
  def index
    if retrieve_guardian_headlines then @top_guardian_headlines = JSON.parse(retrieve_guardian_headlines) else puts 'Top Guardian Headlines not retrieved (PagesController#Index)' end

    if retrieve_home_articles then @nyt_home_articles = JSON.parse(retrieve_home_articles)['results'] else puts 'NYT Home Articles not retrieved (PagesController#Index)' end
  end

  def congressional_report
    if retrieve_congressional_bills then @reports = JSON.parse(retrieve_congressional_bills)['results'][0]['bills'] else puts 'Propublica Recent Bills Passed by Senate not retrieved (PagesController#Congressional_Report)' end
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

  def download_pdf
    send_data(generate_pdf, :filename => "article.pdf", :type => "application/pdf")
  end

  private
  def generate_pdf
    Prawn::Document.new do
        text "Hello World"
    end.render
  end
end
