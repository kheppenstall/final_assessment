FactoryGirl.define do
  factory :link do
    user
    title    { Faker::Hacker.adjective + rand(1000).to_s }
    url      { Faker::Internet.url }
  end
end
