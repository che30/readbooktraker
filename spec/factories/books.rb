FactoryBot.define do
  factory :book do
    name { Faker::Lorem.word }
    author { Faker::Name.first_name }
    isbn { Faker::Alphanumeric.alpha(number: 5) }
    # user_id {Faker::Number.number(1).to_i}
    # book_id {Faker::Number.number(1).to_i}
  end
end
