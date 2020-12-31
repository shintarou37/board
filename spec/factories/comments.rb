FactoryBot.define do
  factory :comment do
    association :user
    association :collect

    text   { '一緒に開発しましょう' }
  end
end
