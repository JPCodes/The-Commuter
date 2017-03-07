require 'rails_helper'

describe Conversation do
  it { should belong_to :user }
  it { should have_many :responses }
  
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_length_of(:title).is_at_least(3).is_at_most(20) }
  it { should validate_length_of(:content).is_at_least(10).is_at_most(300) }
end