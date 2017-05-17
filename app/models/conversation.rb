class Conversation < ActiveRecord::Base
    belongs_to :user
    has_many :responses
    validates :title, presence: true, length: { minimum: 3, maximum: 20}
    validates :content, presence: true, length: { minimum: 10, maximum: 300}
end
