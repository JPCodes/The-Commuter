require './app/helpers/api_helper'
include ApiHelper

namespace :cache do
  desc 'Cache API results to database'
  task nyt: :environment do
    begin
      retries ||= 0
      NewYork.create!(content_type: 'home', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end

    begin
      retries ||= 0
      NewYork.create!(content_type: 'tech', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end

    begin
      retries ||= 0
      NewYork.create!(content_type: 'sports', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end

    begin
      retries ||= 0
      NewYork.create!(content_type: 'movies', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end
  end

  task guardian: :environment do
    begin
      retries ||= 0
      NewsGuardian.create!(content_type: 'usa', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end
  end

  task propublica: :environment do
    begin
      retries ||= 0
      Propublica.create!(content_type: 'senate', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end

    begin
      Propublica.create!(content_type: 'house', update_interval: 1)
    rescue
      retry if (retries += 1) < 3
    end
  end

  task populate: :environment do
    Rake::Task['cache:nyt'].invoke
    Rake::Task['cache:guardian'].invoke
    Rake::Task['cache:propublica'].invoke
  end
end
