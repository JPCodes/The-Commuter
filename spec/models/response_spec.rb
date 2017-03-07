require 'rails_helper'

describe Response do
  it { should belong_to :user }
  it { should belong_to :conversation }
  it { should validate_presence_of :content }
  it { should validate_length_of(:content).is_at_least(10).is_at_most(300) }
end