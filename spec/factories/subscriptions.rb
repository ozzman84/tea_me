# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.variety }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
