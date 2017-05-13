class NewsCache < ActiveRecord::Base
  belongs_to :content_storage, polymorphic: true

  def self.cached_model_enums
    [['NewYork', NewYork.content_types], ['NewsGuardian', NewsGuardian.content_types]]
  end

  def self.find_specified_content(preference_enum)
    NewsCache.cached_model_enums.each do |model_enum|
      enum_hash = model_enum[1]
      if enum_hash.has_value? preference_enum
        model_name = model_enum[0]
        content_name = model_enum[1].key(preference_enum)
        return retrieve_cached_content(model_name, content_name)
      end
    end
  end

  def self.retrieve_cached_content(model_name, content_name)
    puts model_name
    puts content_name
  end
end
