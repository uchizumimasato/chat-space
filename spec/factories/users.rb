require 'faker'

FactoryGirl.define do

  factory :user do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                { Faker::Number.number(8) }
    password_confirmation   { Faker::Number.number(8) }
  end

end
