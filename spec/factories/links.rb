FactoryGirl.define do
  factory :link do
    user
    read     { [true, false].sample }
    title    { Faker::Hacker.adjective }
    url      { Faker::Internet.url }
  end
end
