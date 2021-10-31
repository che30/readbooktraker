FactoryBot.define do
  factory :measurement do
    pages_read { Faker::Number.number(1).to_i }
  end
end