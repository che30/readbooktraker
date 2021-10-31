require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:pages_read) }
end
