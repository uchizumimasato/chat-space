FactoryGirl.define do

  factory :message do
    body      "text"
    image     "neko.jpg"
    # created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
