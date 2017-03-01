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
      text 'The Prince',          align: :center, size: 18
      text 'Niccolò Machiavelli', align: :center, size: 14
      move_down 12

      column_box([0, cursor], columns: 2, width: bounds.width) do
          text((<<-END.gsub(/\s+/, ' ') + "\n\n") * 3)
            All the States and Governments by which men are or ever have been ruled,
            have been and are either Republics or Princedoms. Princedoms are either
            hereditary, in which the sovereignty is derived through an ancient line
            of ancestors, or they are new. New Princedoms are either wholly new, as
            that of Milan to Francesco Sforza; or they are like limbs joined on to
            the hereditary possessions of the Prince who acquires them, as the
            Kingdom of Naples to the dominions of the King of Spain. The States thus
            acquired have either been used to live under a Prince or have been free;
            and he who acquires them does so either by his own arms or by the arms of
            others, and either by good fortune or by merit.
          END
        end
      end.render
  end

end
