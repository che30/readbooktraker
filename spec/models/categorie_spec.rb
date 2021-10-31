require 'rails_helper'

RSpec.describe Categorie, type: :model do
  it { should validate_presence_of(:name) }
end
