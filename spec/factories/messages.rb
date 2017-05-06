FactoryGirl.define do

  factory :message do
    id        { Faker::Number.number(1) }
    body      { Faker::Lorem.sentence }
    image     { Faker::Avatar.image }
    group_id  { Faker::Number.number(1) }
    user_id   { Faker::Number.number(1) }

    factory :invalid_message do
      body   nil
    end

  end

end
