FactoryBot.define do
  factory :user_detail do
    association :user

      GitHub        { Faker::Base.regexify("[aあ]{32}") }
      introduce     { Faker::Base.regexify("[aあ]{32}") }
      age_id        { 1 }
      prefecture_id { 2 }
      language_id   { 2 }
      type_id       { 2 }
      goal_id       { 2 }
  end
end
