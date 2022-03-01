FactoryBot.define do
  factory :book do
    name { Faker::Lorem.word }
    author { Faker::Name.first_name }
    isbn { Faker::Alphanumeric.alpha(number: 5) }
    number_of_pages {Faker::Number.number(2).to_i}
    user_id {Faker::Number.number(1).to_i}
    category_id {Faker::Number.number(1).to_i}
  end
end
