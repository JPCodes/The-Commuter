class Response < ActiveRecord::Base
    belongs_to :user
    belongs_to :conversation
    validates :content, presence: true, length: { minimum: 1, maximum: 300}
end
