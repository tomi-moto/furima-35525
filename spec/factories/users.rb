FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'f000000'}
    password_confirmation {password}
    birth_date            {'1945-8-15'}
    first_name            {'ふぁーすと'}
    last_name             {'らすと'}
    first_kana            {'ファースト'}
    last_kana             {'ラスト'}
  end
end