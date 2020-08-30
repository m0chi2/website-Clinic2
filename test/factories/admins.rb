FactoryBot.define do
  factory :admin do
    name { "テスト名前" }
    name_kana { "テストナマエ" }
    login_id { "adminuser" }
    sequence(:email) { |n| "#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
