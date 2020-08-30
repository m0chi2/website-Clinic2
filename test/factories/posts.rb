FactoryBot.define do
  factory :post do
    patient_id { 1 }
    bothering_start_id { 1 }
    bothering_genre_id { 1 }
    content { "テスト" }
  end
end
