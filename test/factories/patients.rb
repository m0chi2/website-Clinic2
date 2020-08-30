FactoryBot.define do
  factory :patient do
    name { "テスト名前" }
    name_kana { "テストナマエ" }
    password { "password" }
    password_confirmation { "password" }
    membership_number { "AB000000" }
    sequence(:email) { |n| "#{n}@example.com}" }
    birthday { "2000-01-11" }
    sex { 1 }
    phonenumber { "00000000" }
    created_at { "2020-07-19 05:24:37" }
    updated_at { "2020-07-19 05:24:37" }
  end
end
