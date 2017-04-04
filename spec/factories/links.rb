FactoryGirl.define do
  factory :link do
    user_id  { rand(10000) }
    read     { [true, false].sample }
    title    { Faker::Hacker.adjective }
    url      { Faker::Internet.url }
  end
end
