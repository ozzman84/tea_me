# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { 'MyString' }
    last_name { 'MyString' }
    email { 'MyString' }
    address { 'MyString' }
  end
end
