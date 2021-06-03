FactoryBot.define do
  factory :item do
    title              {'test'}
    price              {300}
    introduction       {'aaa'}
    category_id        {1}
    state_id           {1}
    fee_id             {1}
    prefecture_id      {1}
    days_id            {1}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
