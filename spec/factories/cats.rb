FactoryBot.define do
  factory :cat do
    name { Faker::Lorem.unique.word }
  end
end
