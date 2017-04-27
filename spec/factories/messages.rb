FactoryGirl.define do

  factory :message do
    id        1
    body      "text"
    image     "neko.jpg"
    group_id  1
    user_id   1

    factory :invalid_message do
      body   nil
    end

  end

end
