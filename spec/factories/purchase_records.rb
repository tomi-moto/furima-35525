FactoryBot.define do
  factory :purchase_record do
    association :item
    association :user
  end
end
