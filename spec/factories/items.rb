FactoryBot.define do
  factory :item do
    title              {'test'}
    price              {'300'}
    introduction       {'aaa'}
    category_id        {'1'}
    state_id           {'1'}
    fee_id             {'1'}
    prefecture_id      {'1'}
    days_id            {'1'}
    association :user
  end
end
