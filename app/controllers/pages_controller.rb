class PagesController < ApplicationController
  include ApiHelper
  def index
    if retrieve_home_articles then @articles = JSON.parse(retrieve_home_articles)['results'] else puts 'Articles not retrieved' end
  end

  def congressional_report
    @reports = JSON.parse(retrieve_congressional_bills)['results'][0]['bills']
  end
end
