require 'rails_helper'

describe User do
  it { should have_many :conversations }
  it { should have_many :responses }
end