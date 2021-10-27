require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
it { should validate_presence_of(:pages_read) }
end
