FactoryBot.define do
  factory :category do
    name { Faker::Lorem.unique.word }
  end
end
