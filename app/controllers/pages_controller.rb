class PagesController < ApplicationController
  include NytapiHelper
  def index
    @articles = JSON.parse(retrieve_home_articles)['results']
  end

  def congressional_report

  end
end
