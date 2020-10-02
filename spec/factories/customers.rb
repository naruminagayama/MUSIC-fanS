FactoryBot.define do
  factory :customer do
    last_name             {'田中'}
    first_name            {'二郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'ジロウ'}
    sequence(:email)      {|n| 'test#{n}@example.com'}
    nickname              {'テスト'}
    password              {'password'}
    password_confirmation {'password'}
  end
end