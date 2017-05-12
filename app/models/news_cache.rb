class NewsCache < ActiveRecord::Base
  belongs_to :content_storage, polymorphic: true
end
