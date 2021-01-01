FactoryBot.define do
  factory :collect do
    association :user

    explanation   { 'Rubyエンジニアを募集します' }
    language_id   { 2 }
    type_id       { 2 }
    goal_id       { 2 }
    framework_id  { 2 }
  end
end
