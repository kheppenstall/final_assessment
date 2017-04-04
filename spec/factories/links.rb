FactoryGirl.define do
  factory :link do
    user
    title    { Faker::Hacker.adjective }
    url      { Faker::Internet.url }
  end
end
