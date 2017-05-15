class NewsCache < ActiveRecord::Base
  belongs_to :content_storage, polymorphic: true
  # TODO: remove highest res images from cache before uploading to DB
  class << self
    def cached_model_enums
      [['NewYork', NewYork.content_types], ['NewsGuardian', NewsGuardian.content_types], ['Propublica', Propublica.content_types]]
    end

    def find_specified_content(preference_enum)
      NewsCache.cached_model_enums.each do |model_enum|
        enum_hash = model_enum[1]
        if enum_hash.has_value? preference_enum
          model_name = model_enum[0]
          content_name = model_enum[1].key(preference_enum)
          return retrieve_cached_content(model_name, content_name)
        end
      end
    end

    def retrieve_cached_content(model_name, content_name)
      access_one_day_backup(model_name, content_name)
    end

    def access_one_day_backup(model_name, content_name)
      content = eval "#{model_name}.where(update_interval: 1, content_type: '#{content_name}').first.news_cache"

      if model_name == 'NewYork'
        content = JSON.parse(content[:content_storage_body])['results'].first(20)
      elsif model_name == 'NewsGuardian'
        content = JSON.parse(content[:content_storage_body])['response']['results'].first(20)
      elsif model_name == 'Propublica'
        content = JSON.parse(content[:content_storage_body])['results'][0]['bills'].first(12)
      end

      return {
        source: model_name,
        content: content,
        content_type: content_name
      }
    end
  end
end
