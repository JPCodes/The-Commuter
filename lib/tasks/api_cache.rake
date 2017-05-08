require './app/helpers/api_helper'
include ApiHelper

namespace :cache do
  desc 'Cache API results to database'
  task nyt: :environment do
    if results = retrieve_home_articles
      # cache
    else
      # Queue this task again
    end
  end

  task guardian: :environment do
    if results = retrieve_guardian_headlines
      # cache
    else
      # Queue this task again
    end
  end

  task congress: :environment do
    if results = retrieve_congressional_bills
      # cache
    else
      # Queue this task again
    end
  end
end
