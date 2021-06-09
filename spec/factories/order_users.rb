FactoryBot.define do
  factory :order_user do
    token           {"tok_abcdefghijk00000000000000000"}
    post_num        {'000-0000'}
    prefecture_id   {1}
    city            {'tokyo'}
    address         {'sinjyuku'}
    building_name   {'tanuki'}
    phone_number    {'00012345678'}


  end
end