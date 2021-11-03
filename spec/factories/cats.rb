FactoryBot.define do
  factory :cat do
    name { Faker::Lorem.word }
  end
end
