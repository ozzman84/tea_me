FactoryBot.describe do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea }
    temperature { Faker::Number(digits: 10) }
    brew_time { Faker::Number(digits: 4) }
  end
end
