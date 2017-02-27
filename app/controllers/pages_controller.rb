class PagesController < ApplicationController
  include NytapiHelper
  def index
    @articles = JSON.parse(retrieve_articles)['results']
  end
end
